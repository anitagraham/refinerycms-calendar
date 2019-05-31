module Refinery
  module Calendar
    include ActiveSupport::Configurable

    config_accessor  :date_format,
                     :time_format,
                     :date_delta,
                     :time_delta,

                     :page_url

    # End_date/times are automatically set to the start_date/time on the same day, 1 hour later
    self.date_delta = '0'        # same day
    self.time_delta = '60'       # 60 minutes

    self.date_format = "%D"
    self.time_format = "%I:%M%p"
    self.page_url    = '/calendar'
  end
end

