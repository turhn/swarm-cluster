shared_examples 'flocker::init' do
  describe package('clusterhq-flocker-cli') do
    it { should be_installed }
  end

  describe package('clusterhq-flocker-docker-plugin') do
    it { should be_installed }
  end

  describe package('clusterhq-flocker-node') do
    it { should be_installed }
  end

  describe file('/etc/flocker') do
    it { should be_directory }
    it { should be_mode 700 }
  end
end
