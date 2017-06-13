# == Schema Information
#
# Table name: spree_adjustment_reasons
#
#  id         :integer          not null, primary key
#  name       :string
#  code       :string
#  active     :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

module Spree
  class AdjustmentReason < Spree::Base
    has_many :adjustments, inverse_of: :adjustment_reason

    validates :name, presence: true, uniqueness: { case_sensitive: false, allow_blank: true }
    validates :code, presence: true, uniqueness: { case_sensitive: false, allow_blank: true }

    scope :active, -> { where(active: true) }
  end
end
