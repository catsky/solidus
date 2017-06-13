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

class Spree::ReimbursementType::Exchange < Spree::ReimbursementType
  def self.reimburse(reimbursement, return_items, simulate)
    return [] unless return_items.present?

    exchange = Spree::Exchange.new(reimbursement.order, return_items)
    exchange.perform! unless simulate
    [exchange]
  end
end
