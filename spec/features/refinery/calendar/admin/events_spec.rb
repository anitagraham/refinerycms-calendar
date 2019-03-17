# encoding: utf-8
require "spec_helper"

module Refinery
  module Calendar
    module Admin
      describe Event, type: :feature do
        refinery_login

        describe "events list" do
          let!(:events){FactoryBot.create_list(:event, 2)}

          it "shows all items" do
            visit refinery.calendar_admin_events_path
            expect(page).to have_selector('li.record', count:  2)
          end
        end

        describe "create" do

          let!(:venue){FactoryBot.create(:venue, name: 'Best Venue')}
          before(:each) do
            visit refinery.calendar_admin_events_path
            click_link "Add New Event"
          end

          context "when valid data is entered" do
            it "creates an event" do
              save_and_open_page
              fill_in "Title", :with => "This is a test of the first string field"
              select('Best Venue', from: 'event_venue_id' )
              click_button "Save"

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
              expect(Refinery::Calendar::Event.count).to eq(1)
            end
          end

          context "when no data entered" do
            it "returns an error" do
              click_button "Save"
              expect(page).to have_content("Title can't be blank")
              expect(Refinery::Calendar::Event.count).to eq(0)
            end
          end

          context "when a duplicate title is entered" do
            let!(:event){ FactoryBot.create(:event, :title => "UniqueTitle")}

            it "will not create the event" do
              visit refinery.calendar_admin_events_path

              click_link "Add New Event"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              expect(page).to have_content("There were problems")
              expect(Refinery::Calendar::Event.count).to eq(1)
            end
          end

        end

        describe "edit" do
          let!(:event) { FactoryBot.create(:event, :title => "A title") }

          it "changes an event title" do
            visit refinery.calendar_admin_events_path

            within ".actions" do
              click_link "Edit this event"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).to have_no_content("A title")
          end
        end

        describe "destroy" do
          let!(:event) { FactoryBot.create(:event, :title => "UniqueTitleOne") }

          it "deletes the event" do
            visit refinery.calendar_admin_events_path

            click_link "Remove this event forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Calendar::Event.count).to eq(0)
          end
        end

      end
    end
  end
end
