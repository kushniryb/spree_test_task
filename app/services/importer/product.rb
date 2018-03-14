module Importer
  class Product < Base
    private

    def builder
      @builder ||= Importer::Builders::Product
    end
  end
end
