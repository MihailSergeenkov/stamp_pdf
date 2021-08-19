# frozen_string_literal: true

module FileFixturesHeplpers
  def file_fixture(path)
    Pathname.new(__dir__).join('..', '..', 'fixtures', 'files').join(path)
  end
end

RSpec.configure do |config|
  config.include FileFixturesHeplpers
end
