class AddEmail < ActiveRecord::Migration
  def change
    add_column :geekettes, :email, :string
  end
end
