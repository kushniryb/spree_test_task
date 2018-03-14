require 'rails_helper'

describe Importer::Product do
  let(:path)       { File.open('sample.csv').path }
  let(:parser)     { double() }
  let(:attributes) { attributes_for(:product) }

  describe '#call' do
    let(:importer) { described_class.call(path: path) }

    before do
      allow(parser).to receive(:call) { attributes }
      allow_any_instance_of(described_class).to receive(:parser) { parser }
    end

    after { importer }

    it { expect(parser).to   receive(:call) }
    it { expect(importer).to eq attributes }
  end
end
