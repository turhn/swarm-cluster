shared_examples 'consul-master::init' do
  describe docker_container('consul') do
    it { should be_running }
  end
end
