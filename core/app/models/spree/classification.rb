# == Schema Information
#
# Table name: spree_products_taxons
#
#  product_id :integer
#  taxon_id   :integer
#  id         :integer          not null, primary key
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

module Spree
  class Classification < Spree::Base
    self.table_name = 'spree_products_taxons'
    acts_as_list scope: :taxon
    belongs_to :product, class_name: "Spree::Product", inverse_of: :classifications
    belongs_to :taxon, class_name: "Spree::Taxon", inverse_of: :classifications, touch: true

    # For https://github.com/spree/spree/issues/3494
    validates_uniqueness_of :taxon_id, scope: :product_id, message: :already_linked
  end
end
