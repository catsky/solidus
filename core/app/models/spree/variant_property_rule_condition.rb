# == Schema Information
#
# Table name: spree_variant_property_rule_conditions
#
#  id                       :integer          not null, primary key
#  option_value_id          :integer
#  variant_property_rule_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

module Spree
  class VariantPropertyRuleCondition < Spree::Base
    belongs_to :option_value
    belongs_to :variant_property_rule, touch: true

    validates_uniqueness_of :option_value_id, scope: :variant_property_rule_id
  end
end
