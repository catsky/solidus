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
  class ReturnsCalculator < Calculator
    def compute(_return_item)
      raise NotImplementedError, "Please implement 'compute(return_item)' in your calculator: #{self.class.name}"
    end
  end
end
