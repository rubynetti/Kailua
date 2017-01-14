require 'active_support/concern'

module Csvable
  extend ActiveSupport::Concern
    included do

def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |socio|
        row = socio.attributes.values_at(*column_names)
        csv << row
      end
    end
  end
  end
  
end
