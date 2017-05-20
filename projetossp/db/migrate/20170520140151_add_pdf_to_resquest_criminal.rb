class AddPdfToResquestCriminal < ActiveRecord::Migration
  def change
    add_column :resquest_criminals, :pdf, :string
  end
end
