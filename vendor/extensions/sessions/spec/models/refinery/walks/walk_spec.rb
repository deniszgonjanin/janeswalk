require 'spec_helper'

module Refinery
  module Walks
    describe Walk do
      describe "validations" do
        subject do
          FactoryGirl.create(:walk,
          :guide_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:guide_name) { should == "Refinery CMS" }
      end
    end
  end
end
