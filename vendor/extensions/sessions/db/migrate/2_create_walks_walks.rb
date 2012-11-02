class CreateWalksWalks < ActiveRecord::Migration

  def up
    create_table :refinery_walks do |t|
      t.integer :session_id
      t.integer :guide_id
      t.string :guide_name
      t.string :guide_email
      t.string :guide_phone
      t.string :starting_location
      t.string :end_location
      t.text :route
      t.string :neighbourhoods
      t.date :date
      t.time :start_time
      t.integer :duration
      t.text :notes
      t.string :language
      t.float :distance
      t.text :synopsis
      t.string :title
      t.boolean :published
      t.text :description
      t.text :credentials
      t.boolean :accesible
      t.text :accessibility_notes
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-walks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/walks/walks"})
    end

    drop_table :refinery_walks

  end

end
