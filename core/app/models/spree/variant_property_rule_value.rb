# == Schema Information
#
# Table name: spree_variant_property_rule_values
#
#  id                       :integer          not null, primary key
#  value                    :text
#  position                 :integer          default(0)
#  property_id              :integer
#  variant_property_rule_id :integer
#  created_at               :datetime
#  updated_at               :datetime
#

module Spree
  class VariantPropertyRuleValue < Spree::Base
    include Spree::OrderedPropertyValueList

    acts_as_list scope: :variant_property_rule

    belongs_to :property
    belongs_to :variant_property_rule, touch: true
  end
end
