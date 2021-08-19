# frozen_string_literal: true

require 'stamp_pdf/client/services/fetch_stamp_path'

module StampPdf
  module Services
    # Модуль очистки файла с штампом
    module ClearStamp
      class << self
        def call(token)
          stamp_path = FetchStampPathStamp.call(token)
          File.delete(stamp_path) if File.exist?(stamp_path)
        end
      end
    end
  end
end
