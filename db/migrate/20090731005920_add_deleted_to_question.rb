class AddDeletedToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :deleted, :boolean
  end

  def self.down
    remove_column :questions, :deleted
  end
end
