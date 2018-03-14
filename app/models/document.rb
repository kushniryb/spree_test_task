class Document < ApplicationRecord
  belongs_to :user, class_name: 'Spree::User'

  has_attached_file    :attachment
  validates_attachment :attachment, presence: true, content_type: {
    content_type: %w[text/plain]
  }
end
