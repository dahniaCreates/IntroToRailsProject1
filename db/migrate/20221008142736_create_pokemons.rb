class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokemon_id_number
      t.integer :height
      t.integer :weight
      t.integer :base_experience

      t.timestamps
    end
  end
end
