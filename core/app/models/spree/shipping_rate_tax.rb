# == Schema Information
#
# Table name: spree_shipping_rate_taxes
#
#  id               :integer          not null, primary key
#  amount           :decimal(8, 2)    default(0.0), not null
#  tax_rate_id      :integer
#  shipping_rate_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

module Spree
  # Used to persist shipping rate tax estimations.
  # @attr [Spree::ShippingRate] shipping_rate The shipping rate to be taxed
  # @attr [Spree::TaxRate] tax_rate The tax rate used to calculate the tax amount
  # @since 1.3.0
  # @see Spree::Tax::ShippingRateTaxer
  class ShippingRateTax < ActiveRecord::Base
    belongs_to :shipping_rate, class_name: "Spree::ShippingRate"
    belongs_to :tax_rate, class_name: "Spree::TaxRate"

    extend DisplayMoney
    money_methods :absolute_amount

    delegate :currency, to: :shipping_rate, allow_nil: true

    def label
      Spree.t translation_key,
        scope: 'shipping_rate_tax.label',
        amount: display_absolute_amount,
        tax_rate_name: tax_rate.name
    end

    def absolute_amount
      amount.abs
    end

    private

    def translation_key
      if tax_rate.included_in_price?
        if amount > 0
           :vat
         else
           :vat_refund
         end
       else
         :sales_tax
      end
    end
  end
end
