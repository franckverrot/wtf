Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |c| require c }

module Wtf
  class Wtf
    attr_accessor :root_dir
    attr_accessor :configuration_file

    include Dsl

    attr_accessor :_scm, :_tracker
    include Scm     #FIXME:put that in the Dsl module
    include Tracker #FIXME:put that in the Dsl module
    include Topics  #FIXME:put that in the Dsl module
    include Actions #FIXME:put that in the Dsl module
    include Roles   #FIXME:put that in the Dsl module

    def initialize(dir)
      self.root_dir = dir
    end

    def load(filename)
      self.configuration_file = filename
      process_dsl
    end

    def help *args
      puts "wtf, work the flow, your favorite workflow tool"
      puts "Root dir: #{self.root_dir}"
      puts "args: #{args.inspect}"
    end

    def self.method_missing *args
      puts "CLASS METHOD MISSING #{args.inspect}"
    end



    attr_accessor :branches
    def running_branches &block
      bm = BranchManager.new &block
      self.branches = bm.branches
      puts "Configuring running branches: #{self.branches.join(', ')}"
    end

    class BranchManager
      attr_accessor :branches
      def initialize &block
        self.branches = []
        instance_eval &block
      end
      def method_missing name, args = {}
        branches << name
      end
    end


    attr_accessor :_repository
    def repository &block
      rm = RepositoryManager.new &block
      self._repository = rm
      puts "Configuring the repository #{self._repository.to_s}"
    end
    class RepositoryManager
      attr_accessor :_url, :_auth, :_commit_template, :_hooks
      def initialize &block
        instance_eval &block
      end
      def url rm_url
        self._url = rm_url
      end
      def auth rm__auth
      end
      def commit_template rm_ct
      end
      def hooks args = {}
      end
      def to_s
        "Should say something here"
      end
    end

    attr_accessor :_continuous_integration
    def continuous_integration driver_name
      self._continuous_integration = driver_name
    end

    private
    def process_dsl
      config_file_path    = File.join(self.root_dir, self.configuration_file)
      config_file_content = File.read(config_file_path)

      puts "Using the configuration file #{config_file_path}"
      eval(config_file_content)
    end

  end
end
