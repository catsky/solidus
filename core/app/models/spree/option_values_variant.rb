# == Schema Information
#
# Table name: spree_option_values_variants
#
#  variant_id      :integer
#  option_value_id :integer
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#

module Spree
  class OptionValuesVariant < Spree::Base
    belongs_to :variant
    belongs_to :option_value
  end
end
