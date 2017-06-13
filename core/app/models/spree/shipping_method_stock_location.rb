# == Schema Information
#
# Table name: spree_shipping_method_stock_locations
#
#  id                 :integer          not null, primary key
#  shipping_method_id :integer
#  stock_location_id  :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Spree::ShippingMethodStockLocation < Spree::Base
  belongs_to :shipping_method
  belongs_to :stock_location
end
