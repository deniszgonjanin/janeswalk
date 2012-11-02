module Refinery
  module Sessions
    class Session < Refinery::Core::BaseModel
      self.table_name = 'refinery_sessions'

      attr_accessible :start, :end, :status, :submission_start, :submission_end, :registration_start, :registration_end, :title, :synopsis, :position

      acts_as_indexed :fields => [:status, :title, :synopsis]

      validates :status, :presence => true, :uniqueness => true
    end
  end
end
