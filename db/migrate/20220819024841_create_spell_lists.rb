class CreateSpellLists < ActiveRecord::Migration[6.0]
  def change
    create_table :spell_lists do |t|
      t.string :spell

      t.timestamps
    end
  end
end
