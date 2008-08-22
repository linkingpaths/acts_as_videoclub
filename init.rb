require 'acts_as_videoclub'
require 'videoclub_helper'

ActiveRecord::Base.send :include, LinkingPaths::Acts::Videoclub

ActionView::Base.send :include, LinkingPaths::Videoclub::Helper