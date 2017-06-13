# == Schema Information
#
# Table name: spree_promotion_rule_taxons
#
#  id                :integer          not null, primary key
#  taxon_id          :integer
#  promotion_rule_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

module Spree
  class PromotionRuleTaxon < Spree::Base
    belongs_to :promotion_rule
    belongs_to :taxon
  end
end
