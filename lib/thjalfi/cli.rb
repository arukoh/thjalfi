require "thor"
require 'bundler/cli'

module Thjalfi
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
    end

    desc "new GEM_NAME", "Creates a skeleton for creating a CLI rubygem"
    option :ext,  type: :boolean, aliases: '-e', default: false,
                  desc: "Generate the boilerplate for C extension code"
    option :test, type: :string, aliases: '-t', lazy_default: 'rspec',
                  desc: "Generate a test directory for your library: 'rspec' is the default, but 'minitest' is also supported."
    def new(name)
      argv = ["gem", name]
      argv << "--ext"                if options[:ext]
      argv += ["-t", options[:test]] if options[:text]
      Bundler::CLI.start(argv)

      target = Pathname.pwd.join(name)
      return unless File.directory?(target)

      name = name.chomp("/")
      namespaced_path = name.tr('-', '/')
      constant_name = name.split('_').map{|p| p[0..0].upcase + p[1..-1] }.join
      constant_name = constant_name.split('-').map{|q| q[0..0].upcase + q[1..-1] }.join('::') if constant_name =~ /-/
      constant_array = constant_name.split('::')
      opts = {
        namespaced_path: namespaced_path,
        constant_name:   constant_name,
        constant_array:  constant_array,
      }

      templates = {
        "bin/newgem.tt"        => "bin/#{name}",
        "lib/newgem/cli.rb.tt" => "lib/#{namespaced_path}/cli.rb",
      }

      templates.each do |src, dst|
        template(src, target.join(dst), opts)
      end
      Dir.chdir(target) { `chmod +x bin/#{name}; git add .` }
    end
  end
end
