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

require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping
    class FlatRate < ShippingCalculator
      preference :amount, :decimal, default: 0
      preference :currency, :string, default: ->{ Spree::Config[:currency] }

      def compute_package(_package)
        preferred_amount
      end
    end
  end
end
