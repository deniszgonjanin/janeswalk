module Refinery
  module Walks
    module Admin
      class WalksController < ::Refinery::AdminController

        crudify :'refinery/walks/walk',
                :title_attribute => 'guide_name', :xhr_paging => true,
                									                :order => 'session_id DESC',
                									                :sortable => false

      end
    end
  end
end
