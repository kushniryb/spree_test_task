class Spree::Product < Spree::Base
  class Import < Callable
    def initialize(params = {})
      @user       = params[:user]
      @attachment = params[:attachment]
    end

    def call
      document.tap do
        worker.perform_later(worker_params) if document.persisted?
      end
    end

    private

    attr_reader :attachment, :user

    def document
      @document ||= model_class.create(
        attachment: attachment,
        user:       user
      )
    end

    def worker_params
      {
        document_id: document.id,
        importer:    Importer::Product.name
      }
    end

    def worker
      ImportJob
    end

    def model_class
      Document
    end
  end
end
