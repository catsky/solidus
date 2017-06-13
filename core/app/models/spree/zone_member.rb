# == Schema Information
#
# Table name: spree_zone_members
#
#  id            :integer          not null, primary key
#  zoneable_type :string
#  zoneable_id   :integer
#  zone_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

module Spree
  class ZoneMember < Spree::Base
    belongs_to :zone, class_name: 'Spree::Zone', counter_cache: true, inverse_of: :zone_members
    belongs_to :zoneable, polymorphic: true

    delegate :name, to: :zoneable, allow_nil: true
  end
end
