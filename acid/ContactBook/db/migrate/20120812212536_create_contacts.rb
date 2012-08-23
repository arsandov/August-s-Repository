class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_adress
      t.string :phone_numer
      t.string :tweet_user
      t.references :company

      t.timestamps
    end
    add_index :contacts, :company_id
  end
end
