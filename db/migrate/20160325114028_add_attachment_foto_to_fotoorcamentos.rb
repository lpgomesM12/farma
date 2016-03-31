class AddAttachmentFotoToFotoorcamentos < ActiveRecord::Migration
  def self.up
    change_table :fotoorcamentos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :fotoorcamentos, :foto
  end
end
