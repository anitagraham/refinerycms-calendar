require "spec_helper"
module Refinery
  module Calendar
    describe '#configure' do
      before do
        Refinery::Calendar.configure do |config|
          config.page_url = '/daysanddates'
          config.date_format = 'Day Month Year'
          config.time_format = "Hours Minutes"
        end
      end

      it 'uses the configured url' do
        url = Refinery::Calendar.page_url
        expect(url).to eq('/daysanddates')
      end

      it 'has the configured date format' do
        expect(Refinery::Calendar.date_format).to eq('Day Month Year')
      end

      it 'has the configured time format' do
        expect(Refinery::Calendar.time_format).to eq('Hours Minutes')
      end
    end
  end
end
