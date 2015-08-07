class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :country
      t.string :password
      t.string :birthdate
      t.timestamps null:false
    end
  end
end
