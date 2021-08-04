class CreateBoard < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :secure_id

      t.timestamps
    end

    add_index :boards, :secure_id, unique: true
  end
end
