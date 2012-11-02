# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Sessions" do
    describe "Admin" do
      describe "sessions" do
        login_refinery_user

        describe "sessions list" do
          before do
            FactoryGirl.create(:session, :status => "UniqueTitleOne")
            FactoryGirl.create(:session, :status => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.sessions_admin_sessions_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.sessions_admin_sessions_path

            click_link "Add New Session"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Status", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Sessions::Session.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Status can't be blank")
              Refinery::Sessions::Session.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:session, :status => "UniqueTitle") }

            it "should fail" do
              visit refinery.sessions_admin_sessions_path

              click_link "Add New Session"

              fill_in "Status", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Sessions::Session.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:session, :status => "A status") }

          it "should succeed" do
            visit refinery.sessions_admin_sessions_path

            within ".actions" do
              click_link "Edit this session"
            end

            fill_in "Status", :with => "A different status"
            click_button "Save"

            page.should have_content("'A different status' was successfully updated.")
            page.should have_no_content("A status")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:session, :status => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.sessions_admin_sessions_path

            click_link "Remove this session forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Sessions::Session.count.should == 0
          end
        end

      end
    end
  end
end
