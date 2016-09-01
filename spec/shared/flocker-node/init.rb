shared_examples 'flocker-node::init' do
  describe file('/etc/flocker/node.crt') do
    it { should exist }
    it { should be_mode 600 }
  end

  describe file('/etc/flocker/node.key') do
    it { should exist }
    it { should be_mode 600 }
  end

  describe file('/etc/flocker/plugin.crt') do
    it { should exist }
    it { should be_mode 600 }
  end

  describe file('/etc/flocker/plugin.key') do
    it { should exist }
    it { should be_mode 600 }
  end

  describe file('/etc/flocker/agent.yml') do
    it { should exist }
  end

  describe service('flocker-container-agent') do
    it { should be_running.under('systemd') }
  end

  describe service('flocker-dataset-agent') do
    it { should be_running.under('systemd') }
  end

  describe service('flocker-docker-plugin') do
    it { should be_running.under('systemd') }
  end
end
