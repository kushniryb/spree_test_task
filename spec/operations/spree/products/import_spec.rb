require 'rails_helper'

describe Spree::Product::Import do
  let(:user)       { create(:user) }
  let(:attachment) { attributes_for(:document)[:attachment] }

  describe '#call' do
    context 'with valid params' do
      let(:operation) { described_class.call(user: user, attachment: attachment) }

      before do
        allow(ImportJob).to receive(:perform_later) { true }
      end

      it { expect(operation.class).to          eq Document }
      it { expect { operation }.to             change(Document, :count).by(1) }
      it { expect(operation.user).to           eq user }
      it { expect(operation.attachment).not_to be nil }
      it { expect(operation.persisted?).to     eq true }

      after { operation }

      it 'delegates to ImportJob' do
        expect(ImportJob).to receive(:perform_later)
      end
    end

    context 'with invalid params' do
      let(:operation) { described_class.call(user: user) }

      it { expect { operation }.not_to change(Document, :count) }
    end
  end
end
