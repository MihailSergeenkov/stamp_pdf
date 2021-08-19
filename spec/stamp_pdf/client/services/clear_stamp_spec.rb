# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StampPdf::Services::ClearStamp do
  subject(:call) { described_class.call(token) }

  let(:token) { JSON.parse(file_fixture('token.json').read) }
  let(:stamp_path) { "tmp/stamp-#{token['id']}.pdf" }

  before do
    StampPdf::Services::GenerateStamp.call(token)
  end

  it 'clear stamp' do
    expect(File.exist?(stamp_path)).to eq true
    call
    expect(File.exist?(stamp_path)).to eq false
  end
end
