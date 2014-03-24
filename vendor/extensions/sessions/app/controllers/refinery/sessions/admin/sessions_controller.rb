module Refinery
  module Sessions
    module Admin
      class SessionsController < ::Refinery::AdminController

        crudify :'refinery/sessions/session',
                :title_attribute => 'status', :xhr_paging => true,
                                			  :order => 'status ASC, start DESC',
                							  :sortable => false

      end
    end
  end
end
