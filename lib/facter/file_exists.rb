require "puppet"
module Puppet::Parser::Functions
  newfunction(:file_exists, :type => :rvalue) do |args|
    File.exists?(args[0])
  end

  newfunction(:combine_sugid_lists, :type => :rvalue) do |args|
    ( args[0] - args[1] + args[2] ).uniq
  end
end

