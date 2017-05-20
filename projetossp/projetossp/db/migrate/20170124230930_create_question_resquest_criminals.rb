class CreateQuestionResquestCriminals < ActiveRecord::Migration
  def change
    create_table :question_resquest_criminals do |t|
      t.references :question, index: true, foreign_key: true
      t.references :resquest_criminal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
