# == Schema Information
#
# Table name: spree_promotion_rules_users
#
#  user_id           :integer
#  promotion_rule_id :integer
#  id                :integer          not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#

module Spree
  class PromotionRuleUser < Spree::Base
    self.table_name = 'spree_promotion_rules_users'

    belongs_to :promotion_rule, class_name: 'Spree::PromotionRule'
    belongs_to :user, class_name: Spree::UserClassHandle.new
  end
end
