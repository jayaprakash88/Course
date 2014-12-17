class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.string :name
      t.integer :cource_detail_id

      t.timestamps
    end
  end
end
