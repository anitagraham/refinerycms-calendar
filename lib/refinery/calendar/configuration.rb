module Refinery
  module Calendar
    include ActiveSupport::Configurable

    config_accessor  :date_format,
                     :time_format,

                     :date_delta,
                     :time_delta,

                     :page_url

    # these formats must match
    self.date_format   = 'dd MM, yy'         # 05 January, 2019
    self.time_format   = 'HH:MM'             # 13:26

    # End_date/time are automatically set to the start_date/time on the same day, 1 hour later
    self.date_delta = '0'        # same day
    self.time_delta = '60'       # 60 minutes

    self.page_url    = '/calendar'
  end
end

