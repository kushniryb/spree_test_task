require 'rails_helper'

describe Document, type: :model do
  it { should belong_to(:user) }
  it { should have_attached_file(:attachment) }
  it { should validate_attachment_presence(:attachment) }
  it { should validate_attachment_content_type(:attachment).allowing('text/plain') }
end
