module Refinery
  module Calendar
    include ActiveSupport::Configurable

    config_accessor  :js_date_format,
                     :ruby_date_format,
                     :js_time_format,
                     :ruby_time_format,
                     :date_delta,
                     :time_delta,
                     :page_url

    # these formats must match
    self.js_date_format   = "d MM, yy"        # 5 January, 2019
    self.ruby_date_format = "%d %B, %Y"      # 5 January, 2019

    self.js_time_format   = 'g:ia'
    self.ruby_time_format = '%l:%M%P'

    # End_date/time are automatically set to the start_date/time on the same day, 1 hour later
    self.date_delta = '0'        # same day
    self.time_delta = '60'       # 60 minutes

    self.page_url    = '/calendar'
  end
end
