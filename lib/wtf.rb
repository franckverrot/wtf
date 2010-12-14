require 'active_support'
require 'active_support/all'

module Wtf
  extend ActiveSupport::Autoload
  autoload :Wtf

  module Dsl
    extend ActiveSupport::Autoload
    autoload :Scm
    module Scm
      extend ActiveSupport::Autoload
      autoload :Git
    end

    autoload :Tracker
    module Tracker
      extend ActiveSupport::Autoload
      autoload :PivotalTracker
    end

    autoload :Topics
    autoload :Actions
    autoload :Roles
  end
end
