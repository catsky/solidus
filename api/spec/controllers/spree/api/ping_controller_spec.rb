require 'spec_helper'

module Spree
  describe Spree::Api::PingsController, type: :controller do
    render_views
    context "general ping" do
      it "can get epoch time from server" do
        api_get :show
        expect(json_response).to  include("time_epoch")
      end
    end
  end
end
