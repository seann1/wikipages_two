class CreateEmail < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.column :email, :string
      t.column :contact_id, :integer
    end
  end
end
