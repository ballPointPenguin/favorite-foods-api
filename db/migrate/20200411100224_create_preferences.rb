class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.belongs_to :person, null: false, foreign_key: true
      t.belongs_to :food, null: false, foreign_key: true
      t.jsonb :details

      t.timestamps
    end
  end
end
