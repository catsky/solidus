# == Schema Information
#
# Table name: spree_log_entries
#
#  id          :integer          not null, primary key
#  source_type :string
#  source_id   :integer
#  details     :text
#  created_at  :datetime
#  updated_at  :datetime
#

module Spree
  class LogEntry < Spree::Base
    belongs_to :source, polymorphic: true

    # Fix for https://github.com/spree/spree/issues/1767
    # If a payment fails, we want to make sure we keep the record of it failing
    after_rollback :save_anyway

    def save_anyway
      log = Spree::LogEntry.new
      log.source  = source
      log.details = details
      log.save!
    end

    def parsed_details
      @details ||= YAML.load(details)
    end
  end
end
