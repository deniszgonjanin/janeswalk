# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Walks" do
    describe "Admin" do
      describe "walks" do
        login_refinery_user

        describe "walks list" do
          before do
            FactoryGirl.create(:walk, :guide_name => "UniqueTitleOne")
            FactoryGirl.create(:walk, :guide_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.walks_admin_walks_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.walks_admin_walks_path

            click_link "Add New Walk"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Guide Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Walks::Walk.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Guide Name can't be blank")
              Refinery::Walks::Walk.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:walk, :guide_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.walks_admin_walks_path

              click_link "Add New Walk"

              fill_in "Guide Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Walks::Walk.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:walk, :guide_name => "A guide_name") }

          it "should succeed" do
            visit refinery.walks_admin_walks_path

            within ".actions" do
              click_link "Edit this walk"
            end

            fill_in "Guide Name", :with => "A different guide_name"
            click_button "Save"

            page.should have_content("'A different guide_name' was successfully updated.")
            page.should have_no_content("A guide_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:walk, :guide_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.walks_admin_walks_path

            click_link "Remove this walk forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Walks::Walk.count.should == 0
          end
        end

      end
    end
  end
end
