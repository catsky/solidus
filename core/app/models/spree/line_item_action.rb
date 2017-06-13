# == Schema Information
#
# Table name: spree_line_item_actions
#
#  id           :integer          not null, primary key
#  line_item_id :integer          not null
#  action_id    :integer          not null
#  quantity     :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#

module Spree
  class LineItemAction < Spree::Base
    belongs_to :line_item
    belongs_to :action, class_name: "Spree::PromotionAction"
  end
end
