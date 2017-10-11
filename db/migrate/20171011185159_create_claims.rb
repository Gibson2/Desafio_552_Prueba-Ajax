class CreateClaims < ActiveRecord::Migration[5.1]
  def change
    create_table :claims do |t|
      t.text :content
      t.references :company
      t.references :user

      t.timestamps
    end
  end
end
