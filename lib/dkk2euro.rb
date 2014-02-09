
module Dkk2Euro
	ROOT = File.expand_path(File.join(['..'] * 2, 'lib', 'dkk2euro'), __FILE__)
end

%w(
	convert
	cli
).each { |f| require File.join(Dkk2Euro::ROOT, f) }
