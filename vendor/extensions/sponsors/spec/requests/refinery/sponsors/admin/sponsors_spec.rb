# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Sponsors" do
    describe "Admin" do
      describe "sponsors" do
        login_refinery_user

        describe "sponsors list" do
          before do
            FactoryGirl.create(:sponsor, :img => "UniqueTitleOne")
            FactoryGirl.create(:sponsor, :img => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.sponsors_admin_sponsors_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.sponsors_admin_sponsors_path

            click_link "Add New Sponsor"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Img", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Sponsors::Sponsor.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Img can't be blank")
              Refinery::Sponsors::Sponsor.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:sponsor, :img => "UniqueTitle") }

            it "should fail" do
              visit refinery.sponsors_admin_sponsors_path

              click_link "Add New Sponsor"

              fill_in "Img", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Sponsors::Sponsor.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:sponsor, :img => "A img") }

          it "should succeed" do
            visit refinery.sponsors_admin_sponsors_path

            within ".actions" do
              click_link "Edit this sponsor"
            end

            fill_in "Img", :with => "A different img"
            click_button "Save"

            page.should have_content("'A different img' was successfully updated.")
            page.should have_no_content("A img")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:sponsor, :img => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.sponsors_admin_sponsors_path

            click_link "Remove this sponsor forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Sponsors::Sponsor.count.should == 0
          end
        end

      end
    end
  end
end
