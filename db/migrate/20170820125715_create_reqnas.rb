class CreateReqnas < ActiveRecord::Migration
  def change
    create_table :reqnas do |t|
      t.integer :qna_id
      t.string :content
      t.timestamps null: false
    end
  end
end
