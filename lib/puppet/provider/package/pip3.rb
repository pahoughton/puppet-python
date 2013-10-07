require 'puppet/provider/package/pip'

Puppet::Type.type(:package).provide :pip3,
  :parent => :pip, :source => :pip do
    
  desc "Python packages via `pip3`."
  
  has_feature :installable, :uninstallable, :upgradeable, :versionable
    
  def self.cmd
    case Facter.value(:osfamily)
    when "RedHat"
      "pip-python3"
    when "Darwin"
      "pip-3.3"
    else
      "pip"
    end
  end
end