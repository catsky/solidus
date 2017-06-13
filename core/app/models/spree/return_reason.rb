# == Schema Information
#
# Table name: spree_return_reasons
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  mutable    :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

module Spree
  class ReturnReason < Spree::Base
    include Spree::NamedType

    has_many :return_authorizations

    def self.reasons_for_return_items(return_items)
      # Only allow an inactive reason if it's already associated to a return item
      active | return_items.map(&:return_reason).compact
    end
  end
end
