# == Schema Information
#
# Table name: spree_state_changes
#
#  id             :integer          not null, primary key
#  name           :string
#  previous_state :string
#  stateful_id    :integer
#  user_id        :integer
#  stateful_type  :string
#  next_state     :string
#  created_at     :datetime
#  updated_at     :datetime
#

module Spree
  class StateChange < Spree::Base
    belongs_to :user
    belongs_to :stateful, polymorphic: true
    before_create :assign_user

    def <=>(other)
      created_at <=> other.created_at
    end

    def assign_user
      true # don't stop the filters
    end
  end
end
