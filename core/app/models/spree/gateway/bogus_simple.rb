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
  # @deprecated Use Spree::PaymentMethod::SimpleBogusCreditCard instead
  class Gateway::BogusSimple < Spree::PaymentMethod::SimpleBogusCreditCard
    def initialize(*args)
      Spree::Deprecation.warn \
        'Spree::Gateway::BogusSimple is deprecated. ' \
        'Please use Spree::PaymentMethod::SimpleBogusCreditCard instead'
      super
    end
  end
end
