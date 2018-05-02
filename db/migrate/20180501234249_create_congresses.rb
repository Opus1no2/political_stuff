class CreateCongresses < ActiveRecord::Migration[5.1]
  def change
    create_table :congresses do |t|
      t.integer :session, index: { unique: true }
      t.timestamps
    end
  end
end
