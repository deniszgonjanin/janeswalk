module Refinery
  module Walks
    module Admin
      class WalksController < ::Refinery::AdminController

        crudify :'refinery/walks/walk',
                :title_attribute => 'guide_name', :xhr_paging => true

      end
    end
  end
end
