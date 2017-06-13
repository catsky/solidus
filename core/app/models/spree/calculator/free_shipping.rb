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
  # @deprecated This calculator will be removed in future versions of Spree.
  #   The only case where it was used was for Free Shipping Promotions.  There is
  #   now a Promotion Action which deals with these types of promotions instead.
  class Calculator::FreeShipping < Calculator
    def compute(object)
      if object.is_a?(Array)
        return if object.empty?
        order = object.first.order
      else
        order = object
      end

      order.ship_total
    end
  end
end
