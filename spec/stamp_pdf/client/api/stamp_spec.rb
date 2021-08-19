# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StampPdf::Api::Stamp do
  let(:client) { StampPdf::Client.new }

  describe '#add_stamp' do
    subject(:add_stamp) do
      client.add_stamp(
        document: document,
        token: token
      )
    end

    let(:document) { file_fixture('claim.pdf') }
    let(:token) { JSON.parse(file_fixture('token.json').read) }

    before do
      allow(StampPdf::Services::GenerateStamp).to receive(:call).with(token)
      allow(StampPdf::Services::AddStamp).to receive(:call).with(document, token)
      allow(StampPdf::Services::ClearStamp).to receive(:call).with(token)
    end

    it 'returns true' do
      expect(add_stamp).to eq true
    end

    it 'calls stamp services' do
      add_stamp
      expect(StampPdf::Services::GenerateStamp).to have_received(:call).with(token)
      expect(StampPdf::Services::AddStamp).to have_received(:call).with(document, token)
      expect(StampPdf::Services::ClearStamp).to have_received(:call).with(token)
    end
  end
end
