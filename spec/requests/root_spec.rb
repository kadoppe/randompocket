require 'spec_helper'

describe 'Root' do
  describe 'GET /' do
    subject { get root_path }
    specify { subject and expect(response.status).to eq(200) }
  end
end
