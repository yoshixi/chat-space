class ChangeMessages < ActiveRecord::Migration[5.0]
  def up
    change_column :messages, :user_id, :integer, foreign_key: true, null: false
    change_column :messages, :group_id, :integer, foreign_key: true, null: false
  end

  # 変更前の状態
  def down
    change_column :messages, :user_id, :integer, foreign_key: true
    change_column :messages, :group_id, :integer, foreign_key: true
  end
end
