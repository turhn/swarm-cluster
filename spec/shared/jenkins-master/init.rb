shared_examples 'jenkins-master::init' do
  describe file('/data/jenkins') do
    it { should be_directory }
  end

  describe docker_container('jenkins') do
    it { should be_running }
    it { should have_volume('/var/jenkins_home', '/data/jenkins') }
    it { should have_volume('/usr/bin/docker', '/usr/bin/docker') }
    it { should have_volume('/var/run/docker.sock', '/var/run/docker.sock') }
    it { should have_volume('/usr/local/bin/docker-compose', '/usr/local/bin/docker-compose') }
  end
end
