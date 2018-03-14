FactoryBot.define do
  factory :document do
    attachment { Rack::Test::UploadedFile.new('sample.csv', 'text/plain') }
  end
end
