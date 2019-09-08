class CreateAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :access_tokens do |t|
      t.belongs_to :user, foreign_key: true
      t.string :token, null: false
      t.string :secret, null: false
      t.string :provider, null: false

      t.timestamps
    end
  end
end
