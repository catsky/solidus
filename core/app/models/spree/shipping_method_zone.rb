# == Schema Information
#
# Table name: spree_shipping_method_zones
#
#  shipping_method_id :integer
#  zone_id            :integer
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#

module Spree
  class ShippingMethodZone < Spree::Base
    belongs_to :zone
    belongs_to :shipping_method
  end
end
