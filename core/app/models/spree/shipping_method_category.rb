# == Schema Information
#
# Table name: spree_shipping_method_categories
#
#  id                   :integer          not null, primary key
#  shipping_method_id   :integer          not null
#  shipping_category_id :integer          not null
#  created_at           :datetime
#  updated_at           :datetime
#

module Spree
  class ShippingMethodCategory < Spree::Base
    belongs_to :shipping_method, class_name: 'Spree::ShippingMethod'
    belongs_to :shipping_category, class_name: 'Spree::ShippingCategory', inverse_of: :shipping_method_categories
  end
end
