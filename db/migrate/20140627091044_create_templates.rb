class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :spell
      t.string :version
      t.integer :status

      t.timestamps
    end
  end
end
