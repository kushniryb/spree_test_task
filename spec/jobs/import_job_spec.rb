require 'rails_helper'

describe ImportJob do
  let(:user)     { create(:user) }
  let(:document) { create(:document, user: user) }
  let(:importer) { Importer::Product }

  describe '#perform' do
    context 'with valid params' do
      let(:job) { described_class.perform_now(document_id: document.id, importer: importer.name) }

      after { job }

      it 'calls importer' do
        expect(importer).to receive(:call).with(path: document.attachment.path)
      end

      it 'logs import information' do
        expect(Rails.logger).to receive(:info).at_least(3).times
      end
    end

    context 'with invalid params' do
      let(:job) { described_class.perform_now(importer: importer.name) }

      it { expect(job).to eq nil }

      after { job }

      it "doesn't call importer" do
        expect(importer).not_to receive(:call)
      end
    end
  end
end
