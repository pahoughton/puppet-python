require 'puppet/provider/package/pip'

Puppet::Type.type(:package).provide :pip27,
  :parent => :pip, :source => :pip do
    
  desc "Python packages via `pip27`."
  
  has_feature :installable, :uninstallable, :upgradeable, :versionable
    
  def self.cmd
    case Facter.value(:osfamily)
    when "RedHat"
      "pip27"
    when "Darwin"
      "pip27"
    else
      "pip27"
    end
  end
end
