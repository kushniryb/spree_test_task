require 'csv'

module Importer
  module Parsers
    class Default < Callable
      def initialize(params = {})
        @path        = params[:path]
        @separator   = params[:separator]
        @headers     = params[:headers]
      end

      def call
        CSV.foreach(path, options) do |row|
          yield format(row) unless invalid?(row)
        end
      end

      private

      attr_reader :headers, :path, :separator

      def invalid?(row)
        row.to_hash.compact.empty?
      end

      def format(row)
        row.to_hash.symbolize_keys
      end

      def options
        {
          headers: headers   || true,
          col_sep: separator || DEFAULT_SEPARATOR
        }
      end

      DEFAULT_SEPARATOR = ';'.freeze
    end
  end
end
