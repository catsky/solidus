module Spree
  module Api
    class PingsController < Spree::Api::BaseController
      skip_before_action :authenticate_user
      def show
      end
    end
  end
end
