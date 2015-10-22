class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :picture
      t.references :attachable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_index :attachments, :picture
  end
end
