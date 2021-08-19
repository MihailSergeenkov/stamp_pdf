# frozen_string_literal: true

module StampPdf
  module Services
    # Модуль генерации пути к файлу с штампом
    module FetchStampPathStamp
      class << self
        def call(token)
          "tmp/stamp-#{token['id']}.pdf"
        end
      end
    end
  end
end
