class RemoveReferencesToComments < ActiveRecord::Migration[6.1]
  def change
    remove_reference :comments, :report, null: false, foreign_key: true
  end
end
