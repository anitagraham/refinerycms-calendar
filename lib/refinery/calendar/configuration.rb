module Refinery
  module Calendar
    include ActiveSupport::Configurable

    config_accessor  :page_url,
                     :date_format,
                     :time_format,
                     :time_zone

    self.page_url = '/calendar'
    self.date_format = '%A, %d %b %Y'
    self.time_format = '%l:%M %p'
    self.time_zone = true

  end
end
