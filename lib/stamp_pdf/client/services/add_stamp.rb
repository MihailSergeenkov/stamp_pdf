# frozen_string_literal: true

require 'stamp_pdf/client/services/fetch_stamp_path'

module StampPdf
  module Services
    # Модуль добавления штампа
    module AddStamp
      STAMPED_CLAIM_PATH = 'tmp/stamped_claim.pdf'

      class << self
        def call(document, token)
          stamp_path = StampPdf::Services::FetchStampPathStamp.call(token)
          stamp = CombinePDF.load(stamp_path).pages[0]

          pdf = CombinePDF.load(document)
          pdf.pages.last << stamp
          pdf.save(STAMPED_CLAIM_PATH)
        end
      end
    end
  end
end
