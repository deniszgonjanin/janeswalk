require 'spec_helper'

module Refinery
  module Sessions
    describe Session do
      describe "validations" do
        subject do
          FactoryGirl.create(:session,
          :status => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:status) { should == "Refinery CMS" }
      end
    end
  end
end
