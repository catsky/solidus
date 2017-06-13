# == Schema Information
#
# Table name: spree_product_option_types
#
#  id             :integer          not null, primary key
#  position       :integer
#  product_id     :integer
#  option_type_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

module Spree
  class ProductOptionType < Spree::Base
    belongs_to :product, class_name: 'Spree::Product', inverse_of: :product_option_types, touch: true
    belongs_to :option_type, class_name: 'Spree::OptionType', inverse_of: :product_option_types
    acts_as_list scope: :product
  end
end
