require 'active_support'
require 'active_support/all'

module Wtf
  extend ActiveSupport::Autoload
  autoload :Wtf

  module Dsl
    extend ActiveSupport::Autoload
    module Scm
      extend ActiveSupport::Autoload
      autoload :Git
    end
    module Tracker
      extend ActiveSupport::Autoload
      autoload :PivotalTracker
    end
  end
end
