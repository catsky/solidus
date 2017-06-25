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
  class BillingIntegration < PaymentMethod
    validates :name, presence: true

    preference :server, :string, default: 'test'
    preference :test_mode, :boolean, default: true

    def gateway
      integration_options = options
      ActiveMerchant::Billing::Base.integration_mode = integration_options[:server].to_sym
      integration_options[:test] = true if integration_options[:test_mode]
      @gateway ||= gateway_class.new(integration_options)
    end

    def options
      options_hash = {}
      preferences.each { |key, value| options_hash[key.to_sym] = value }
      options_hash
    end
  end
end
