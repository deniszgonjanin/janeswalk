module Refinery
  module Walks
    class Walk < Refinery::Core::BaseModel
      self.table_name = 'refinery_walks'

      attr_accessible :session_id, :guide_id, :guide_name, :guide_email, :guide_phone, :starting_location, :end_location, :route, :neighbourhoods, :date, :start_time, :duration, :notes, :language, :distance, :synopsis, :title, :published, :description, :credentials, :accesible, :accessibility_notes, :position

      acts_as_indexed :fields => [:guide_name, :guide_email, :guide_phone, :starting_location, :end_location, :route, :neighbourhoods, :notes, :language, :synopsis, :title, :description, :credentials, :accessibility_notes]

      validates :guide_name, :presence => true, :uniqueness => true
    end
  end
end
