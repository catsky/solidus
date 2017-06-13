# == Schema Information
#
# Table name: spree_roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

module Spree
  class Role < Spree::Base
    has_many :role_users, class_name: "Spree::RoleUser", dependent: :destroy
    has_many :users, through: :role_users

    validates_uniqueness_of :name

    def admin?
      name == "admin"
    end
  end
end
