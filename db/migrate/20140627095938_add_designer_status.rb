class AddDesignerStatus < ActiveRecord::Migration
  def change
  	add_column :designers, :app_status_id, :integer

  end
end
