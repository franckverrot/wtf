Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |c| require c }

module Wtf
  class Wtf
    extend Dsl
    attr_accessor :root_dir
    attr_accessor :configuration_file

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

    def self.configure &block
        instance_eval &block
    end

    private
    def process_dsl
      path = File.join(self.root_dir, self.configuration_file)
      puts "Using the configuration file #{path}"
      class_eval do
        eval(File.read(path), TOPLEVEL_BINDING)
      end
    end

  end
end
