module Wtf
  module Helpers
    def self.root_directory path
      File.expand_path("#{`pwd`.strip}","#{`git rev-parse --show-cdup`}")
    end
  end
end
