shared_examples 'docker::init' do
  describe package('docker-engine') do
    it { should be_installed }
  end

  describe file('/lib/systemd/system/docker.service') do
    it { should exist }
  end

  describe file('/usr/local/bin/docker-compose') do
    it { should exist }
  end

  describe service('docker') do
    it { should be_running.under('systemd') }
  end

  describe user('deploy') do
    it { should belong_to_group('docker') }
  end
end
