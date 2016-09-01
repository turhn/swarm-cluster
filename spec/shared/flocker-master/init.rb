shared_examples 'flocker-master::init' do
  describe file('/etc/flocker/cluster.key') do
    it { should be_a_file }
  end

  describe file('/etc/flocker/cluster.crt') do
    it { should be_a_file }
  end

  describe file('/etc/flocker/control-service.key') do
    it { should be_a_file }
    it { should be_mode 600 }
  end

  describe file('/etc/flocker/control-service.crt') do
    it { should be_a_file }
  end

  describe service('flocker-control') do
    it { should be_running.under('systemd') }
  end
end
