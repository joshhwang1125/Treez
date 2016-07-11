class AddDetailsToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :DCB, :string
    add_column :licenses, :DCD, :string
  end
end
