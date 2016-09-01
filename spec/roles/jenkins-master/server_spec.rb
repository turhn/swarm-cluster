require 'spec_helper'

describe 'jenkins-master' do
  include_examples 'python::init'
  include_examples 'user::init'
  include_examples 'docker::init'
  include_examples 'docker-compose::init'
  include_examples 'jenkins-master::init'
end
