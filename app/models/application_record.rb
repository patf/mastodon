# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Remotable

  after_create :track_created

  def track_created
    Librato.increment "mastodon.#{self.class.to_s.downcase}.created"
  end
end
