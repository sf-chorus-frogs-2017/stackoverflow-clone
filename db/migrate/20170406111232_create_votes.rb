class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voteable_type
      t.integer :voteable_id

      timestamps(null: false)
    end
  end
end
