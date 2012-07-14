class CreateApks < ActiveRecord::Migration
  def change
    create_table :apks do |t|
      t.string :vc
      t.string :vn
      t.string :update_items
      t.string :location

      t.timestamps
    end
  end
end
