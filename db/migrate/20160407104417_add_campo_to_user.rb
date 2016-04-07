class AddCampoToUser < ActiveRecord::Migration
  def change
    add_column :users, :chaveacesso, :string
  end
end
