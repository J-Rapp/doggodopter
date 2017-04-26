class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.boolean    :selected
      t.references :user, index: true
      t.references :dog,  index: true

      t.timestamps
    end
  end
end
