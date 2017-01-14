class AddUserAgentToPageVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :page_visitors, :UserAgent, :string
  end
end
