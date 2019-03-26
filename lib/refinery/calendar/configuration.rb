module Refinery
  module Calendar
    include ActiveSupport::Configurable

    config_accessor  :date_format,
                     :time_format,
                     :date_delta,
                     :time_delta,
                     :page_url

    self.date_format = 'dd/mm/yyy'
    self.time_format = 'g:ia'
    self.date_delta = '0'        # same day
    self.time_delta = '60'       # 60 minutes

    self.page_url    = '/calendar'
  end
end
