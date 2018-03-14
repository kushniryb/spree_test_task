require 'rails_helper'

describe Importer::Builders::Product do
  let(:attributes) {
    attributes_for(:product).merge(
      slug:              FFaker::Internet.slug,
      availability_date: Time.zone.now
    )
  }

  describe '#call' do
    context 'with valid params' do
      let(:product) { described_class.call(attributes) }

      it { expect(product.class).to                  eq Spree::Product }
      it { expect(product.name).to                   eq attributes[:name] }
      it { expect(product.description).to            eq attributes[:description] }
      it { expect(product.slug).to                   eq attributes[:slug] }
      it { expect(product.price).to                  eq attributes[:price].to_f }
      it { expect(product.available_on).to           eq attributes[:availability_date] }
      it { expect(product.shipping_category).not_to  be nil }
      it { expect(product.shipping_category.name).to eq 'Default' }
      it { expect { product }.to                     change(Spree::Product, :count).by(1) }
    end

    context 'with invalid params' do
      let(:product) { described_class.call({}) }

      it { expect { product }.not_to change(Spree::Product, :count) }
    end
  end
end
