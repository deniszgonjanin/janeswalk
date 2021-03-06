module Refinery
  module Sessions
    class SessionsController < ::ApplicationController

      before_filter :find_all_sessions
      before_filter :find_page

      def index
        @sessions = Session.past
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @session in the line below:
        present(@page)
      end

      def show
        @session = Session.find(params[:id])

        @markers = @session.walks.published.collect {|walk| [walk.map_marker, walk.title, refinery.walks_walk_path(walk)]}

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @session in the line below:
        present(@page)
      end

    protected

      def find_all_sessions
        @sessions = Session.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/sessions").first
      end

    end
  end
end
