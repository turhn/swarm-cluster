shared_examples 'user::init' do
  describe group('deploy') do
    it { should exist }
  end

  describe user('deploy') do
    it { should exist }
    it { should belong_to_group 'deploy' }
    it { should have_home_directory '/home/deploy' }
  end
end
