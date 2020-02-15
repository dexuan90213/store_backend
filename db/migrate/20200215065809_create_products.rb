class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.string :state

      t.timestamps
    end
  end
end
