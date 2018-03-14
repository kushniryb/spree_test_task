class ImportJob < ApplicationJob
  queue_as :default

  def perform(params = {})
    document = Document.find_by(id: params[:document_id])
    importer = params[:importer].constantize

    return unless document && importer

    logger.info "Starting import process for document ##{document.id}"
    logger.info "Document path: #{document.attachment.path}"
    logger.info "Importer: #{importer.name}"

    importer.call(
      path: document.attachment.path
    )
  rescue NameError => e
    logger.error "Unknown importer: #{params[:importer]} (#{e.message})"
  end

  delegate :logger, to: 'Rails'
end
