# == Schema Information
#
# Table name: spree_reimbursement_types
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  mutable    :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#  type       :string
#

module Spree
  class ReimbursementType::Credit < Spree::ReimbursementType
    extend Spree::ReimbursementType::ReimbursementHelpers

    class << self
      def reimburse(reimbursement, return_items, simulate)
        unpaid_amount = return_items.sum(&:total).round(2, :down)
        reimbursement_list, _unpaid_amount = create_credits(reimbursement, unpaid_amount, simulate)
        reimbursement_list
      end
    end
  end
end
