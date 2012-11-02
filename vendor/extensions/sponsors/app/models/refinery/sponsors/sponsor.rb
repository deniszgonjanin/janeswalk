module Refinery
  module Sponsors
    class Sponsor < Refinery::Core::BaseModel
      self.table_name = 'refinery_sponsors'

      attr_accessible :image_id, :description, :blurb, :website_url, :position

      acts_as_indexed :fields => [:image_id, :description, :blurb, :website_url]

      validates :image_id, :presence => true, :uniqueness => true
      
      belongs_to :image
    end
  end
end
