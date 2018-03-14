module Importer
  module Builders
    class Product < Callable
      def initialize(params = {})
        @name         = params[:name]
        @slug         = params[:slug]
        @price        = params[:price]
        @description  = params[:description]
        @available_on = params[:availability_date]
      end

      def call
        model_class.create(attributes)
      end

      private

      attr_reader :name, :description, :price, :available_on, :slug

      def attributes
        {
          name:              name,
          description:       description,
          price:             price.to_f,
          available_on:      available_on.try(:to_datetime),
          shipping_category: shipping_category,
          slug:              slug
        }
      end

      def shipping_category
        @shipping_category ||= ::Spree::ShippingCategory.find_or_create_by(
          name: 'Default'
        )
      end

      def model_class
        ::Spree::Product
      end
    end
  end
end
