action :install

attribute :app, :kind_of => String, :name_attribute => true
attribute :source, :kind_of => String
attribute :zip_file, :kind_of => String
attribute :destination, :kind_of => String, :default => "/Applications"
attribute :checksum, :kind_of => String
attribute :installed, :kind_of => [TrueClass, FalseClass], :default => false

def initialize(name, run_context = nil)
  super
  @action = :install
end
