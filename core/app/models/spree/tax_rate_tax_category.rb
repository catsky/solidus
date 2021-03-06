# == Schema Information
#
# Table name: spree_tax_rate_tax_categories
#
#  id              :integer          not null, primary key
#  tax_category_id :integer          not null
#  tax_rate_id     :integer          not null
#

module Spree
  class TaxRateTaxCategory < Spree::Base
    belongs_to :tax_rate, class_name: 'Spree::TaxRate', inverse_of: :tax_rate_tax_categories
    belongs_to :tax_category, class_name: 'Spree::TaxCategory', inverse_of: :tax_rate_tax_categories
  end
end
