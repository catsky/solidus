# == Schema Information
#
# Table name: spree_refund_reasons
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  mutable    :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#  code       :string
#

module Spree
  class RefundReason < Spree::Base
    include Spree::NamedType

    RETURN_PROCESSING_REASON = 'Return processing'

    has_many :refunds

    def self.return_processing_reason
      find_by!(name: RETURN_PROCESSING_REASON, mutable: false)
    end
  end
end
