require 'serverspec'
require 'net/ssh'
require 'yaml'
require 'pathname'

base_spec_dir = Pathname.new(File.join(File.dirname(__FILE__)))
Dir[base_spec_dir.join('shared/**/*.rb')].sort.each { |f| require f }

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    raise 'highline is not available. Try installing it.'
  end
  set :sudo_password, ask('Enter sudo password: ') { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

options = Net::SSH::Config.for(host)
options[:user] = 'ubuntu'
host = ENV['TARGET_HOST']

set :host,        options[:host_name] || host
set :ssh_options, options
