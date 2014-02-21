class RemoveStatusFromHosts < ActiveRecord::Migration
  def change
    remove_column :hosts, :status, :string
  end
end
