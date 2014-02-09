#
# $Id: cli.rb 16 2013-04-19 20:43:38Z nicb $
#
require 'optparse'

module Dkk2Euro
  class CLI
    def self.execute(stdout, arguments=[])

      options = {
#       :config              => Configuration::DEFAULT_CONFIGURATION,
      }
      mandatory_options = %w(  )

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          
          dkk2euro is a DKK to Euro currency converter (including bank conversion commission percentage)

          Usage: #{File.basename($0)} [options]

          Options are:
        BANNER
        opts.separator ""
#       opts.on("-c", "--config PATH", String,
#               "use configuration file found in  PATH",
#               "Default: #{Configuration::DEFAULT_CONFIGURATION}") { |arg| options[:config] = arg }
        opts.on("-h", "--help",
                "Show this help message.") { stdout.puts opts; exit }
        opts.parse!(arguments)

        if mandatory_options && mandatory_options.find { |option| options[option.to_sym].nil? }
          stdout.puts opts; exit
        end
      end

			arguments.each { |dkk| stdout.puts(Convert.output(dkk.to_f, options)) }
    end
  end
end
