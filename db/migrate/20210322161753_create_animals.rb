class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :sex
      t.integer :age
      t.text :personality_attributes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
