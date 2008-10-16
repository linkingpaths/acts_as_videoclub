require 'videoclub_helper'

module LinkingPaths
  module Acts #:nodoc:
    module Videoclub #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_videoclub
          has_many :videos, :as => :resource

          include LinkingPaths::Acts::Videoclub::InstanceMethods
        end
      end

      # Adds instance methods.
      module InstanceMethods
        def has_videos?
          self.videos.size > 0
        end
      end

    end
  end
end

ActiveRecord::Base.send :include, LinkingPaths::Acts::Videoclub

ActionView::Base.send :include, LinkingPaths::Videoclub::Helper