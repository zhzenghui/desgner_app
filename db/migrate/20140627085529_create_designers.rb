class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :degn_id
      t.string :name
      t.string :spell
      t.string :template

      t.timestamps
    end
  end
end
