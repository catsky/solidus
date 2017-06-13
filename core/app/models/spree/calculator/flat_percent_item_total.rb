# == Schema Information
#
# Table name: spree_calculators
#
#  id              :integer          not null, primary key
#  type            :string
#  calculable_type :string
#  calculable_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#  preferences     :text
#

require_dependency 'spree/calculator'

module Spree
  class Calculator::FlatPercentItemTotal < Calculator
    preference :flat_percent, :decimal, default: 0

    def compute(object)
      computed_amount = (object.amount * preferred_flat_percent / 100).round(2)

      # We don't want to cause the promotion adjustments to push the order into a negative total.
      if computed_amount > object.amount
        object.amount
      else
        computed_amount
      end
    end
  end
end
