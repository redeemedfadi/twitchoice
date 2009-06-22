class AddSidToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :sid, :string, :limit => 10
    add_index :questions, :sid, :unique => true
  end

  def self.down
    remove_index :questions, :sid
    remove_column :questions, :sid
  end
end
