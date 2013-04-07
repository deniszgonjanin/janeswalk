class AddMissingFieldsToWalks < ActiveRecord::Migration
  def change
    add_column :refinery_walks, :image_id,      :integer
    add_column :refinery_walks, :guide2_name,   :string
    add_column :refinery_walks, :guide2_email,  :string
    add_column :refinery_walks, :guide2_phone,  :string
    add_column :refinery_walks, :media,         :boolean
    add_column :refinery_walks, :map_marker,    :string
    add_column :refinery_walks, :marshal_name,  :string
    add_column :refinery_walks, :marshal_email, :string
    add_column :refinery_walks, :marshal_phone, :string
    add_column :refinery_walks, :marshal2_name, :string
    add_column :refinery_walks, :marshal2_email, :string
    add_column :refinery_walks, :marshal2_phone, :string
  end
end
