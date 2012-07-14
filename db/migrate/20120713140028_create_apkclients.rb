class CreateApkclients < ActiveRecord::Migration
  def change
    create_table :apkclients do |t|
      t.string :version_code
      t.string :version_number
      t.text :update_items
      t.string :location
      t.timestamps
    end
  end
end
