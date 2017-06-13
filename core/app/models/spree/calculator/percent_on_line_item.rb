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

module Spree
  class Calculator
    class PercentOnLineItem < Calculator
      preference :percent, :decimal, default: 0

      def compute(object)
        (object.amount * preferred_percent) / 100
      end
    end
  end
end
