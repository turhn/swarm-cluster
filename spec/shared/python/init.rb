shared_examples 'python::init' do
  describe file('/usr/bin/python') do
    it { should exist }
  end

  describe package('python-pip') do
    it { should be_installed }
  end
end
