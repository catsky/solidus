# == Schema Information
#
# Table name: spree_payment_methods
#
#  id                 :integer          not null, primary key
#  type               :string
#  name               :string
#  description        :text
#  active             :boolean          default(TRUE)
#  deleted_at         :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  auto_capture       :boolean
#  preferences        :text
#  preference_source  :string
#  position           :integer          default(0)
#  available_to_users :boolean          default(TRUE)
#  available_to_admin :boolean          default(TRUE)
#

module Spree
  class PaymentMethod::Check < PaymentMethod
    def actions
      %w{capture void credit}
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    def capture(*)
      simulated_successful_billing_response
    end

    def cancel(*); end

    def void(*)
      simulated_successful_billing_response
    end

    def credit(*)
      simulated_successful_billing_response
    end

    def source_required?
      false
    end

    def simulated_successful_billing_response
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end
  end
end
