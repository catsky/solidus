# == Schema Information
#
# Table name: spree_preferences
#
#  id         :integer          not null, primary key
#  value      :text
#  key        :string
#  created_at :datetime
#  updated_at :datetime
#

class Spree::Preference < Spree::Base
  serialize :value

  validates :key, presence: true, uniqueness: { allow_blank: true }
end
