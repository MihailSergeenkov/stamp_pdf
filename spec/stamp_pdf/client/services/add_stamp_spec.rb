# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StampPdf::Services::AddStamp do
  subject(:call) { described_class.call(document, token) }

  let(:document) { file_fixture('claim.pdf') }
  let(:token) { JSON.parse(file_fixture('token.json').read) }

  let(:document_path) { 'tmp/stamped_claim.pdf' }

  around do |example|
    StampPdf::Services::GenerateStamp.call(token)
    example.run
    StampPdf::Services::ClearStamp.call(token)
    File.delete(document_path) if File.exist?(document_path)
  end

  it 'saves document' do
    call
    expect(File.exist?(document_path)).to eq true
  end

  it 'adds stamp to document' do
    call
    stamp = PDF::Reader.new(document_path)
    page = stamp.pages.last

    expect(page.text).to include(token['id'])
    expect(page.text).to include(token['full_name'])
    expect(page.text).to include(token['date_from'])
    expect(page.text).to include(token['date_to'])
  end
end
