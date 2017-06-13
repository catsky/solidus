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
  # A concrete implementation of `Spree::PaymentMethod` intended to provide a
  # base for extension. See https://github.com/solidusio/solidus_gateway/ for
  # offically supported payment gateway implementations.
  #
  class Gateway < PaymentMethod
    delegate :authorize, :purchase, :capture, :void, :credit, to: :provider

    validates :name, :type, presence: true

    preference :server, :string, default: 'test'
    preference :test_mode, :boolean, default: true

    def payment_source_class
      CreditCard
    end

    def provider
      gateway_options = options
      gateway_options.delete :login if gateway_options.key?(:login) && gateway_options[:login].nil?
      if gateway_options[:server]
        ActiveMerchant::Billing::Base.mode = gateway_options[:server].to_sym
      end
      @provider ||= provider_class.new(gateway_options)
    end

    def options
      preferences.to_hash
    end

    def payment_profiles_supported?
      false
    end

    def method_type
      'gateway'
    end

    def supports?(source)
      return true unless provider_class.respond_to? :supports?
      return true if source.brand && provider_class.supports?(source.brand)
      source.has_payment_profile?
    end

    def reusable_sources_by_order(order)
      source_ids = order.payments.where(payment_method_id: id).pluck(:source_id).uniq
      payment_source_class.where(id: source_ids).select(&:reusable?)
    end
    alias_method :sources_by_order, :reusable_sources_by_order
    deprecate sources_by_order: :reusable_sources_by_order, deprecator: Spree::Deprecation

    def reusable_sources(order)
      if order.completed?
        reusable_sources_by_order(order)
      elsif order.user_id
        order.user.wallet.wallet_payment_sources.map(&:payment_source).select(&:reusable?)
      else
        []
      end
    end
  end
end
