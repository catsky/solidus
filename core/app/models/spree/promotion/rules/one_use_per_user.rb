# == Schema Information
#
# Table name: spree_promotion_rules
#
#  id               :integer          not null, primary key
#  promotion_id     :integer
#  product_group_id :integer
#  type             :string
#  created_at       :datetime
#  updated_at       :datetime
#  code             :string
#  preferences      :text
#

module Spree
  class Promotion
    module Rules
      class OneUsePerUser < PromotionRule
        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, _options = {})
          if order.user.present?
            if promotion.used_by?(order.user, [order])
              eligibility_errors.add(:base, eligibility_error_message(:limit_once_per_user))
            end
          else
            eligibility_errors.add(:base, eligibility_error_message(:no_user_specified))
          end

          eligibility_errors.empty?
        end
      end
    end
  end
end
