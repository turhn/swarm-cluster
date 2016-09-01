shared_examples 'docker-compose::init' do
  describe file('/usr/local/bin/docker-compose') do
    it { should exist }
    it { should be_executable }
  end
end
