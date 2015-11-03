class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :number
    end
  end
end
