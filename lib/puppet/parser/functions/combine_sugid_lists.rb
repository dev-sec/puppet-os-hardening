module Puppet::Parser::Functions
  newfunction(:combine_sugid_lists, :type => :rvalue) do |args|
    ( args[0] - args[1] + args[2] ).uniq
  end
end
