require 'spec_helper'

describe 'consul-master' do
  include_examples 'python::init'
  include_examples 'user::init'
  include_examples 'docker::init'
  include_examples 'consul-master::init'
end
