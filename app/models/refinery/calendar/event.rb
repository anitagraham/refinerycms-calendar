module Refinery
  module Calendar
    class Event < ActiveRecord::Base
    include ActiveModel::AttributeMethods

    extend TimeSplitter::Accessors

    extend FriendlyId

    split_accessor :from, :to

    friendly_id :title, :use => :slugged

    belongs_to :venue

    validates :title, :presence => true, :uniqueness => true

    alias_attribute :from, :starts_at
    alias_attribute :to, :ends_at

    delegate :name, :address,
              to: :venue,
              prefix: true,
              allow_nil: true

    def tense
      since = Date.current.beginning_of_day - from
      case
        when since > 0 then 'past'
        when since = 0 then 'present'
        when since < 0 then'future'
      end
    end

    scope :upcoming, -> { where arel_table[:starts_at].gteq Time.now }

    scope :featured, -> { where featured: true }

    scope :archive, -> { where arel_table[:starts_at].lt Time.now }

    end
  end
end
