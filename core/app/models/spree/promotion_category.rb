# == Schema Information
#
# Table name: spree_promotion_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#  code       :string
#

module Spree
  class PromotionCategory < Spree::Base
    validates_presence_of :name
    has_many :promotions
  end
end
