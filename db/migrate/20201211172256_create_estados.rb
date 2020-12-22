class CreateEstados < ActiveRecord::Migration[6.1]
  def change
    create_table :estados do |t|
      t.string :uf
      t.string :descricao
      t.string :cod

      t.timestamps
    end
  end
end
