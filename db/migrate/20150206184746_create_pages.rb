class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :number
      t.string :imageurl, limit: 2000

      t.timestamps
    end
  end
end
