# == Schema Information
#
# Table name: spree_user_addresses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  address_id :integer          not null
#  default    :boolean          default(FALSE)
#  archived   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Spree
  class UserAddress < Spree::Base
    belongs_to :user, class_name: UserClassHandle.new, foreign_key: "user_id"
    belongs_to :address, class_name: "Spree::Address"

    validates_uniqueness_of :address_id, scope: :user_id
    validates_uniqueness_of :user_id, conditions: -> { active.default }, message: :default_address_exists, if: :default?

    scope :with_address_values, ->(address_attributes) do
      joins(:address).merge(
        Spree::Address.with_values(address_attributes)
      )
    end

    scope :all_historical, -> { unscope(where: :archived) }
    scope :default, -> { where(default: true) }
    scope :active, -> { where(archived: false) }

    default_scope -> { order([default: :desc, updated_at: :desc]) }
  end
end
