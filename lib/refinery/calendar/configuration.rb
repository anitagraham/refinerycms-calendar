module Refinery
  module Calendar
    include ActiveSupport::Configurable

    config_accessor  :date_format,
                     :dp_date_format,
                     :time_format,
                     :tp_time_format,
                     :date_delta,
                     :time_delta,
                     :page_url

    # End_date/times are automatically set to the start_date/time on the same day, 1 hour later
    self.date_delta = '0'        # same day
    self.time_delta = '60'       # 60 minutes

    self.date_format = "%D"               # used by timesplitter (Rails Date#strftime format)
    self.time_format = "%I:%M%p"          # used by timesplitter (Rails Time#strftime format)

    # datepicker and timepicker are used by http://www.jonthornton.com/Datepair.js/
    self.dp_date_format = "mm/dd/yy"      # datepicker default format (jquery-ui-datepicker, formats at https://api.jqueryui.com/datepicker/#utility-formatDate)
    self.tp_time_format = "g:ia"          # timepicker default format (https://github.com/jonthornton/jquery-timepicker, PHP date formatting syntax)

    self.page_url    = '/calendar'
  end
end

