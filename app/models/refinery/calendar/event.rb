module Refinery
  module Calendar
    class Event < ActiveRecord::Base
    include ActiveModel::AttributeMethods

      extend TimeSplitter::Accessors

      extend FriendlyId

      split_accessor :from, :to,
                     date_format: "%d/%m/%Y",
                     time_format: "%I:%M%p",
                     default: ->{Time.zone.now}

      friendly_id :title, :use => :slugged

      belongs_to :venue

      validates :title, :presence => true, :uniqueness => true

      alias_attribute :from, :starts_at
      alias_attribute :to, :ends_at

      delegate :name, :address,
                to: :venue,
                prefix: true,
                allow_nil: true

      def currency
        to_date < Date.today ? 'old' : to_date == Date.today ? 'current' : 'future'
      end

      # def local_date(date)
      #   date.in_time_zone.to_s(Refinery::Calendar.date_format)
      # end
      #
      # def local_time(time)
      #   time.in_time_zone.to_s(Refinery::Calendar.time_format)
      # end
      #
      # scope :starting_on_day, ->(day) { where(starts_at: day.beginning_of_day..day.tomorrow.beginning_of_day) }
      # scope :ending_on_day, ->(day) { where(ends_at: day.beginning_of_day..day.tomorrow.beginning_of_day) }
      #
      # scope :on_day, ->(day) {
      #   where(
      #     arel_table[:starts_at].in(day.beginning_of_day..day.tomorrow.beginning_of_day).
      #     or(arel_table[:ends_at].in(day.beginning_of_day..day.tomorrow.beginning_of_day)).
      #     or(arel_table[:starts_at].lt(day.beginning_of_day).and(arel_table[:ends_at].gt(day.tomorrow.beginning_of_day)) )
      #   )
      # }

      scope :upcoming, -> { where arel_table[:starts_at].gteq Time.now }

      scope :featured, -> { where featured: true }

      scope :archive, -> { where arel_table[:starts_at].lt Time.now }

      # attribute_method_prefix 'local_'
      # define_attribute_methods(:)
      #
      # def attributes
      #   {
      #     'to_date' => @to_date,
      #     'to_time' => @to_time,
      #     'from_date' => @from_date,
      #     'from_time' => @from_time
      #
      #   }
      # end
      # private
      #
      # def attribute_local(attr)
      #   send(attr, in_time_zone.to_s(Refinery::Calendar.time_format)x )
      #
      # end
    end
  end
end
