shared_examples 'docker-registry::init' do
  describe file('/data/docker-registry/certs') do
    it { should be_directory }
  end

  describe file('/data/docker-registry/auth') do
    it { should be_directory }
  end

  describe file('/data/docker-registry/auth/.htpasswd') do
    it { should exist }
  end

  describe file('/data/docker-registry/certs/server.crt') do
    it { should exist }
  end

  describe file('/data/docker-registry/certs/server.key') do
    it { should exist }
  end

  describe docker_container('registry') do
    it { should be_running }
    it { should have_volume('/var/lib/registry', '/data/docker-registry/registry') }
    it { should have_volume('/certs', '/data/docker-registry/certs') }
    it { should have_volume('/auth', '/data/docker-registry/auth') }
  end
end
