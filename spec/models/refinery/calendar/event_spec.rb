require 'spec_helper'

module Refinery
  module Calendar
    describe Event, type: :model do
      describe "validations" do
        let(:event){FactoryBot.create(:event, :title => "Refinery CMS")}

        it "the event to be valid" do
          expect(event).to be_valid
        end

        it "has the title given to it" do
          expect(event.title).to eq("Refinery CMS")
        end
      end

      describe "upcoming events" do
        let(:past_event)   {FactoryBot.create(:event, starts_at: 2.hours.ago, title: 'Done')}
        let(:future_event) {FactoryBot.create(:event, starts_at: 2.hours.from_now, title: "Soon")}
        # before do
        #   FactoryBot.create(:event, starts_at: 2.hours.ago)
        #   FactoryBot.create(:event, starts_at: 2.hours.from_now)
        #   FactoryBot.create(:event, starts_at: 2.days.from_now)
        #   FactoryBot.create(:event, starts_at: 2.weeks.from_now)
        # end

        it "does not include events that start in the past" do
          expect(Event.upcoming).not_to include(past_event)
        end

        it "includes events that start in the future" do
          expect(Event.upcoming).to include(future_event)
        end
      end

      describe "tomorrow's events" do
        let(:past_event)      {FactoryBot.create(:event, starts_at: Date.tomorrow-2.hours)}
        let(:event_tomorrow)  {FactoryBot.create(:event, starts_at: Date.tomorrow+2.hours)}
        let(:multi_day_event) {FactoryBot.create(:event, starts_at: Date.yesterday, ends_at: 2.days.from_now)}

        it "does not include events that will be complete before tomorrow" do
          expect(Event.on_day(Date.tomorrow)).to_not include(past_event)
        end

        it "includes events that begin and end tomorrow" do
          expect(Event.on_day(Date.tomorrow)).to include(event_tomorrow)
        end

        it "includes events that start before tomorrow and finish after tomorrow" do
          expect(Event.on_day(Date.tomorrow)).to include(multi_day_event)
        end

      end

    end
  end
end
