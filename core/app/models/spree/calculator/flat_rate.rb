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
  class Calculator::FlatRate < Calculator
    preference :amount, :decimal, default: 0
    preference :currency, :string, default: ->{ Spree::Config[:currency] }

    def compute(object = nil)
      if object && preferred_currency.casecmp(object.currency).zero?
        preferred_amount
      else
        0
      end
    end
  end
end
