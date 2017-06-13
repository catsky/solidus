# == Schema Information
#
# Table name: spree_payment_capture_events
#
#  id         :integer          not null, primary key
#  amount     :decimal(10, 2)   default(0.0)
#  payment_id :integer
#  created_at :datetime
#  updated_at :datetime
#

module Spree
  class PaymentCaptureEvent < Spree::Base
    belongs_to :payment, class_name: 'Spree::Payment'

    def display_amount
      Spree::Money.new(amount, { currency: payment.currency })
    end
  end
end
