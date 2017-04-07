class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voteable_type, null: false
      t.integer :voteable_id, null: false
      t.references :user
      t.timestamps null: false
    end
  end
end
