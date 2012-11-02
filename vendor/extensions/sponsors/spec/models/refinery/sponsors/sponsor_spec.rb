require 'spec_helper'

module Refinery
  module Sponsors
    describe Sponsor do
      describe "validations" do
        subject do
          FactoryGirl.create(:sponsor,
          :img => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:img) { should == "Refinery CMS" }
      end
    end
  end
end
