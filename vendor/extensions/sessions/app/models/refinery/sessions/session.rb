module Refinery
  module Sessions
    class Session < Refinery::Core::BaseModel
      self.table_name = 'refinery_sessions'

      attr_accessible :start, :end, :status, :submission_start, :submission_end, :registration_start, :registration_end, :title, :synopsis, :position

      acts_as_indexed :fields => [:status, :title, :synopsis]

      validates :status, :presence => true, :inclusion => {:in => ['active', 'inactive']}
      validate :only_one_active

      has_many :walks, :class_name => 'Refinery::Walks::Walk'

      def timeframe
        if start == self.end #bad choice of attribute name
          return start.strftime("%B %d, %Y")
        else
          return "#{start.strftime("%B %d, %Y")} to #{self.end.strftime("%B %d, %Y")}"
        end
      end

      def self.active
        Session.find_by_status('active')
      end

      def self.past
        Session.where("status = 'inactive'")
      end

      def walks_by_date(date)
        self.walks.where(date: date)
      end

      private
      def only_one_active
        if status == 'active' and Session.exists? ["status = 'active' AND id != ?", id.to_i]
          errors.add( :status, ' - there is already an active session. make the active session inactive first')
        end
      end
    end
  end
end
