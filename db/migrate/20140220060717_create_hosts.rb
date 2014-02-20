class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :ip
      t.integer :port
      t.string :suffix
      t.string :status
      t.string :token

      t.timestamps
    end
  end
end
