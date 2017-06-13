# == Schema Information
#
# Table name: spree_assets
#
#  id                      :integer          not null, primary key
#  viewable_type           :string
#  viewable_id             :integer
#  attachment_width        :integer
#  attachment_height       :integer
#  attachment_file_size    :integer
#  position                :integer
#  attachment_content_type :string
#  attachment_file_name    :string
#  type                    :string(75)
#  attachment_updated_at   :datetime
#  alt                     :text
#  created_at              :datetime
#  updated_at              :datetime
#

module Spree
  class Asset < Spree::Base
    belongs_to :viewable, polymorphic: true, touch: true
    acts_as_list scope: [:viewable_id, :viewable_type]
  end
end
