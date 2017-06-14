class Spree::Api::UsersController < Spree::Api::ResourceController
  before_action :authenticate_user, :except => [:sign_up, :sign_in]
  prepend_before_action :allow_params_authentication!, only: :sign_in

  def sign_up
    user_params = params.require(:spree_user).permit :email, :password, :password_confirmation
    @user = Spree.user_class.new user_params
    if @user.save
      @user.generate_spree_api_key!
      render 'show'
    else
      invalid_resource! @user
    end
  end

  def sign_in
    user_params = params.require(:spree_user).permit :email, :password
    if warden.authenticate scope: :spree_user
      @user = warden.user scope: :spree_user
      @user.generate_spree_api_key! if @user.spree_api_key.blank?
      render 'auth'
    else
      render 'invalid', status: 401
    end
  end

  private

  attr_reader :user

  def model_class
    Spree.user_class
  end

  def user_params
    permitted_resource_params
  end

  def permitted_resource_attributes
    if action_name == "create" || can?(:update_email, user)
      super | [:email]
    else
      super
    end
  end
end
