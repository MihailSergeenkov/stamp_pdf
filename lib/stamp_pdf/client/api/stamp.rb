# frozen_string_literal: true

require 'stamp_pdf/client/services/generate_stamp'
require 'stamp_pdf/client/services/add_stamp'
require 'stamp_pdf/client/services/clear_stamp'

module StampPdf
  module Api
    # Модуль добавления штампа
    module Stamp
      def add_stamp(document:, token:)
        StampPdf::Services::GenerateStamp.call(token)
        StampPdf::Services::AddStamp.call(document, token)
        StampPdf::Services::ClearStamp.call(token)

        true
      end
    end
  end
end
