require "puppet"
module Puppet::Parser::Functions
  newfunction(:file_exists, :type => :rvalue) do |args|
    File.exists?(args[0])
  end
end
