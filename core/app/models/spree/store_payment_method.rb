# == Schema Information
#
# Table name: spree_store_payment_methods
#
#  id                :integer          not null, primary key
#  store_id          :integer          not null
#  payment_method_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

module Spree
  class StorePaymentMethod < Spree::Base
    belongs_to :store, inverse_of: :store_payment_methods
    belongs_to :payment_method, inverse_of: :store_payment_methods
  end
end
