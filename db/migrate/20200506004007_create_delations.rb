class CreateDelations < ActiveRecord::Migration[6.0]
  def change
    create_table :delations do |t|
      t.string :description
      t.string :status
      t.string :latitude
      t.string :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
