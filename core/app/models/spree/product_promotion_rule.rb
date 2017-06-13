# == Schema Information
#
# Table name: spree_product_promotion_rules
#
#  product_id        :integer
#  promotion_rule_id :integer
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#

module Spree
  class ProductPromotionRule < Spree::Base
    belongs_to :product
    belongs_to :promotion_rule
  end
end
