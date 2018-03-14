module Importer
  class Base < Callable
    def initialize(params = {})
      @path = params[:path]
    end

    def call
      parser.call(path: path, &method(:persist))
    end

    private

    attr_reader :path

    def persist(attributes)
      builder.call(attributes)
    end

    def parser
      Parsers::Default
    end
  end
end
