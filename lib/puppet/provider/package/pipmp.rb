require 'puppet/provider/package/pip'

Puppet::Type.type(:package).provide :pipmp,
  :parent => :pip, :source => :pip do
    
  desc "Python packages via `pip` from macports."
  
  has_feature :installable, :uninstallable, :upgradeable, :versionable
    
  def self.cmd
    case Facter.value(:osfamily)
    when "RedHat"
      "pip-python"
    when "Darwin"
      "pip2.7"
    else
      "pip"
    end
  end
end