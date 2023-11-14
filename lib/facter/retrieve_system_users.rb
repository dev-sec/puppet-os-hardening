# Try to read UID_MIN from /etc/login.defs to calculate SYS_UID_MAX
# if that fails set some predefined values based on os_family fact.
logindefs = '/etc/login.defs'

if File.exist?(logindefs)
  su_maxid = File.readlines(logindefs).each do |line|
    break Regexp.last_match[1].to_i - 1 if line =~ %r{^\s*UID_MIN\s+(\d+)(\s*#.*)?$}
  end
else
  case Facter.value(:osfamily)
  when 'Debian', 'OpenBSD', 'FreeBSD'
    su_maxid = 999
  else
    su_maxid = 499
  end
end

# Retrieve all system users and build custom fact with the usernames
# using comma separated values.
Facter.add(:retrieve_system_users) do
  sys_users = []
  Etc.passwd do |u|
    sys_users.push(u.name) unless u.uid > su_maxid
  end

  setcode do
    sys_users.join(',')
  end
end
