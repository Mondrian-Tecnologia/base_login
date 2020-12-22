class CreateCidades < ActiveRecord::Migration[6.1]
  def change
    create_table :cidades do |t|
      t.string :cod
      t.string :descricao
      t.references :estado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
