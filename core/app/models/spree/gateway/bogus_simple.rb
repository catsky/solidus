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
  # Bogus Gateway that doesn't support payment profiles.
  class Gateway::BogusSimple < Gateway::Bogus
    def payment_profiles_supported?
      false
    end

    def authorize(_money, credit_card, _options = {})
      if VALID_CCS.include? credit_card.number
        ActiveMerchant::Billing::Response.new(true, 'Bogus Gateway: Forced success', {}, test: true, authorization: '12345', avs_result: { code: 'A' })
      else
        ActiveMerchant::Billing::Response.new(false, 'Bogus Gateway: Forced failure', { message: 'Bogus Gateway: Forced failure' }, test: true)
      end
    end

    def purchase(_money, credit_card, _options = {})
      if VALID_CCS.include? credit_card.number
        ActiveMerchant::Billing::Response.new(true, 'Bogus Gateway: Forced success', {}, test: true, authorization: '12345', avs_result: { code: 'A' })
      else
        ActiveMerchant::Billing::Response.new(false, 'Bogus Gateway: Forced failure', message: 'Bogus Gateway: Forced failure', test: true)
      end
    end
  end
end
