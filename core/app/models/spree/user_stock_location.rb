# == Schema Information
#
# Table name: spree_user_stock_locations
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  stock_location_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

module Spree
  class UserStockLocation < Spree::Base
    belongs_to :user, class_name: Spree::UserClassHandle.new, inverse_of: :user_stock_locations
    belongs_to :stock_location, class_name: "Spree::StockLocation", inverse_of: :user_stock_locations
  end
end
