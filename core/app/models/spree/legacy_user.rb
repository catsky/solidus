# == Schema Information
#
# Table name: spree_users
#
#  id                     :integer          not null, primary key
#  encrypted_password     :string(128)
#  password_salt          :string(128)
#  email                  :string
#  remember_token         :string
#  persistence_token      :string
#  reset_password_token   :string
#  perishable_token       :string
#  sign_in_count          :integer          default(0), not null
#  failed_attempts        :integer          default(0), not null
#  last_request_at        :datetime
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  login                  :string
#  ship_address_id        :integer
#  bill_address_id        :integer
#  authentication_token   :string
#  unlock_token           :string
#  locked_at              :datetime
#  reset_password_sent_at :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  spree_api_key          :string(48)
#  remember_created_at    :datetime
#  deleted_at             :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#

module Spree
  # Default implementation of User.
  #
  # @note This class is intended to be modified by extensions (ex.
  #   spree_auth_devise)
  class LegacyUser < Spree::Base
    include UserMethods

    self.table_name = 'spree_users'

    before_destroy :check_completed_orders

    def self.model_name
      ActiveModel::Name.new Spree::LegacyUser, Spree, 'user'
    end

    attr_accessor :password
    attr_accessor :password_confirmation

    private

    def check_completed_orders
      raise Spree::Core::DestroyWithOrdersError if orders.complete.present?
    end
  end
end
