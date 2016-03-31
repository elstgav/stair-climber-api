class CreateClimbs < ActiveRecord::Migration
  def change
    create_table :climbs do |t|
      t.integer :user_id
      t.datetime :datetime
      t.integer :flights

      t.timestamps null: false
    end
  end
end
