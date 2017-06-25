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
  # @deprecated Use Spree::PaymentMethod::CreditCard or Spree::PaymentMethod instead
  class Gateway < PaymentMethod::CreditCard
    def initialize(*args)
      Spree::Deprecation.warn \
        "Using Spree::Gateway as parent class of payment methods is deprecated. " \
        "Please use Spree::PaymentMethod::CreditCard for credit card based payment methods " \
        "or Spree::PaymentMethod for non credit card payment methods instead."
      super
    end
  end
end
