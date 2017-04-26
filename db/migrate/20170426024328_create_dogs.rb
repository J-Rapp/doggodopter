class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string  :url
      t.string  :images,   array: true, default: []
      t.boolean :cats,                  default: false
      t.boolean :children,              default: false
      t.integer :energy,                default: 5

      t.timestamps
    end
  end
end
