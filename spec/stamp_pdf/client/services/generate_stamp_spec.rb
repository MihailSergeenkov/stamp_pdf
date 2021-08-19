# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StampPdf::Services::GenerateStamp do
  subject(:call) { described_class.call(token) }

  let(:token) { JSON.parse(file_fixture('token.json').read) }
  let(:stamp_path) { "tmp/stamp-#{token['id']}.pdf" }

  after do
    StampPdf::Services::ClearStamp.call(token)
  end

  it 'generates stamp' do
    call
    expect(File.exist?(stamp_path)).to eq true
  end

  it 'stamp with token data' do
    call
    stamp = PDF::Reader.new(stamp_path)
    page = stamp.pages.last

    expect(page.text).to include(token['id'])
    expect(page.text).to include(token['full_name'])
    expect(page.text).to include(token['date_from'])
    expect(page.text).to include(token['date_to'])
  end
end
