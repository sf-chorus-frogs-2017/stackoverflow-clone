class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.string :body, {null: false}

      t.timestamps null: false
    end
  end
end
