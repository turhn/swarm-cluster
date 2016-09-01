require 'spec_helper'

describe 'docker-registry' do
  include_examples 'python::init'
  include_examples 'user::init'
  include_examples 'docker::init'
  include_examples 'docker-registry::init'
end
