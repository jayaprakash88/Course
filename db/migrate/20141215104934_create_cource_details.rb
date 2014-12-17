class CreateCourceDetails < ActiveRecord::Migration
  def change
    create_table :cource_details do |t|
      t.string :cource_name

      t.timestamps
    end
  end
end
