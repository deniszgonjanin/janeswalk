module Refinery
  module Walks
    class WalksController < ::ApplicationController

      before_filter :find_all_walks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @walk in the line below:
        present(@page)
      end

      def show
        @walk = Walk.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @walk in the line below:
        present(@page)
      end
      
      def new
        @walk = Walk.new
      end

      def edit
        @walk = Walk.find(params[:walk])

        render action: 'edit'
      end
      
      def create
        @walk = Walk.new(params[:walk])
        
        if @walk.save
          redirect_to '/thank-you'
        else
          render action: 'new'
        end
      end

    protected

      def find_all_walks
        @walks = Walk.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/walks").first
      end

    end
  end
end
