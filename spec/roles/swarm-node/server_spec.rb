require 'spec_helper'

describe 'swarm-node' do
  include_examples 'python::init'
  include_examples 'user::init'
  include_examples 'docker::init'
  include_examples 'flocker-node::init'
end
