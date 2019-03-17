require 'spec_helper'

module Refinery
  module Calendar
    describe Venue, type: :model do
      describe "validations" do
        let(:venue){FactoryBot.create(:venue, name: "Refinery CMS")}

        it "is valid"  do
          expect(venue).to be_valid
        end

        it "has the name passed to it" do
          expect(venue.name).to eq("Refinery CMS")
        end

      end
    end
  end
end
