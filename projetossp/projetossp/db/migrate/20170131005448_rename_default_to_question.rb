class RenameDefaultToQuestion < ActiveRecord::Migration
  def change
    rename_column :questions, :default, :question_default
  end
end
