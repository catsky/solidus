# == Schema Information
#
# Table name: spree_product_properties
#
#  id          :integer          not null, primary key
#  value       :string
#  product_id  :integer
#  property_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  position    :integer          default(0)
#

module Spree
  class ProductProperty < Spree::Base
    include Spree::OrderedPropertyValueList

    acts_as_list scope: :product

    belongs_to :product, touch: true, class_name: 'Spree::Product', inverse_of: :product_properties
    belongs_to :property, class_name: 'Spree::Property', inverse_of: :product_properties

    self.whitelisted_ransackable_attributes = ['value']
  end
end
