class AddFkToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_reference :attachments, :article, index: true, foreign_key: true
  end
end
