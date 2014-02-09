#
# $Id$
#
require 'simple_currency'

module Dkk2Euro
  
  module Convert

    class << self

      def convert(qt, opts = {})
        qt.dkk.to_eur
      end

      def output(qt, opts = {})
        c = convert(qt, opts)
				"%05.2f € (commission %05.2f €)" % [ c, commission(c) ]
      end

    private

      #
      # FIXME: this should probably be configurable/optionable
      #
      COMMISSION_RATE = 0.0174

      def commission(sum)
				sum * COMMISSION_RATE
      end

    end

  end

end
