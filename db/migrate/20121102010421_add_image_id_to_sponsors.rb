class AddImageIdToSponsors < ActiveRecord::Migration
  def change
    add_column :refinery_sponsors, :image_id, :integer
    remove_column :refinery_sponsors, :img
  end
end
