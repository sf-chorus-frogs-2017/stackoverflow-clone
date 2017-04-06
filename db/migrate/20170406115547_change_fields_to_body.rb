class ChangeFieldsToBody < ActiveRecord::Migration
  def change
    rename_column :questions, :description, :body
    rename_column :comments, :comments, :body
  end
end
