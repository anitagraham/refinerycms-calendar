module Refinery
  module Calendar
    class Event < ActiveRecord::Base
      include ActiveModel::AttributeMethods

      extend TimeSplitter::Accessors
      extend FriendlyId

      split_accessor :from, :to,
                     date_format: Refinery::Calendar.ruby_date_format,
                     time_format: Refinery::Calendar.ruby_time_format

      friendly_id :title, :use => :slugged

      belongs_to :venue

      dragonfly_accessor :main_image
      has_many_page_images

      validates :title, :presence => true, :uniqueness => true

      alias_attribute :from, :starts_at
      alias_attribute :to, :ends_at

      delegate :name, :address,
                to: :venue,
                prefix: true,
                allow_nil: true

      scope :starting_on_day, lambda {|day| where(starts_at: day.beginning_of_day..day.tomorrow.beginning_of_day) }
      scope :ending_on_day, lambda {|day| where(ends_at: day.beginning_of_day..day.tomorrow.beginning_of_day) }

      scope :on_day, lambda {|day|
        where(
          arel_table[:starts_at].in(day.beginning_of_day..day.tomorrow.beginning_of_day).
            or(arel_table[:ends_at].in(day.beginning_of_day..day.tomorrow.beginning_of_day)).
            or( arel_table[:starts_at].lt(day.beginning_of_day).and(arel_table[:ends_at].gt(day.tomorrow.beginning_of_day)) )
        )
      }
      scope :featured, -> { where featured: true }
      scope :upcoming, -> { where arel_table[:starts_at].gteq Time.now }
      scope :archive, ->  { where arel_table[:starts_at].lt Time.now }

      def tense
        case
        when from.future?
          'future'
        when to.past?
          'past'
        when from.past? && to.future?
          'present'
        end
      end
    end
  end
end
