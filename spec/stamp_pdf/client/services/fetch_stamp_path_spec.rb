# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StampPdf::Services::FetchStampPathStamp do
  subject(:call) { described_class.call(token) }

  let(:token) { JSON.parse(file_fixture('token.json').read) }
  let(:result) { "tmp/stamp-#{token['id']}.pdf" }

  it 'returns path' do
    expect(call).to eq result
  end
end
