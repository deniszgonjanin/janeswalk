module Refinery
  module Walks
    class Walk < Refinery::Core::BaseModel
      self.table_name = 'refinery_walks'

      attr_accessible :session_id, :guide_id, :guide_name, :guide_email, :guide_phone, 
                      :starting_location, :end_location, :route, :neighbourhoods, 
                      :date, :start_time, :duration, :notes, :language, :distance, 
                      :synopsis, :title, :published, :description, :credentials, 
                      :accesible, :accessibility_notes, :position, 
                      :image_id,      
                      :guide2_name,   
                      :guide2_email,  
                      :guide2_phone,  
                      :media,         
                      :map_marker,    
                      :marshal_name,  
                      :marshal_email, 
                      :marshal_phone, 
                      :marshal2_name, 
                      :marshal2_email,
                      :marshal2_phone
                      
                      

      acts_as_indexed :fields => [:guide_name, :guide_email, :guide_phone, 
                                  :starting_location, :end_location, :route, 
                                  :neighbourhoods, :notes, :language, :synopsis, 
                                  :title, :description, :credentials, 
                                  :accessibility_notes]

      validates :guide_name, :presence => true
      validates :title, :presence => true
      validates :guide_email, :presence => true
      validates :starting_location, :presence => true
      validates :end_location, :presence => true
      validates :credentials, :presence => true
      
      belongs_to :session, :class_name => '::Refinery::Sessions::Session'

      before_create :set_session_id
      
      scope :published, :conditions => { :published => true }
      scope :english, :conditions => { :language => 'en' }
      scope :french, :conditions => { :language => 'fr' }
      
      belongs_to :image
      
      def img
        
      end

      def num_marshals
        if !marshal_name.empty? and !marshal2_name.empty?
          return 2
        elsif !marshal_name.empty? or !marshal2_name.empty?
          return 1
        else
          return 0
        end
      end

      private
        def set_session_id
          self.session_id = Refinery::Sessions::Session.active.id
        end
      
    end
  end
end
