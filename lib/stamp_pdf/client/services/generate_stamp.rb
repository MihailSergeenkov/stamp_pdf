# frozen_string_literal: true

require 'stamp_pdf/client/services/fetch_stamp_path'

module StampPdf
  module Services
    # Модуль генерации файла с штампом
    module GenerateStamp
      class << self
        def call(token)
          stamp_path = FetchStampPathStamp.call(token)
          Prawn::Document.generate(stamp_path) do |pdf|
            create_stamp(pdf, token)
            pdf.stamp('stamp')
          end
        end

        private

        def create_stamp(pdf, token)
          pdf.font_families.update(
            'OpenSans' => { normal: 'fonts/Open_Sans/OpenSans-Regular.ttf' }
          )

          pdf.create_stamp('stamp') do
            pdf.stroke_color '0000FF'
            pdf.fill_color '0000FF'
            create_bounding_box(pdf, token)
          end
        end

        def create_bounding_box(pdf, token)
          pdf.bounding_box([150, 100], width: 370, height: 100) do
            pdf.move_down 20
            add_text(pdf, token)
            pdf.transparent(1) { pdf.stroke_bounds }
          end
        end

        def add_text(pdf, token)
          pdf.font('OpenSans') do
            pdf.indent(20) do
              pdf.text 'ДОКУМЕНТ ПОДПИСАН ЭЛЕКТРОННОЙ ПОДПИСЬЮ'
              pdf.text "Сертификат #{token['id']}"
              pdf.text "Владелец #{token['full_name']}"
              pdf.text "Действителен с #{token['date_from']} по #{token['date_to']}"
            end
          end
        end
      end
    end
  end
end
