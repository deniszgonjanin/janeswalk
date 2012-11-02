class CreateSessionsSessions < ActiveRecord::Migration

  def up
    create_table :refinery_sessions do |t|
      t.date :start
      t.date :end
      t.string :status
      t.date :submission_start
      t.date :submission_end
      t.date :registration_start
      t.date :registration_end
      t.string :title
      t.text :synopsis
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-sessions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/sessions/sessions"})
    end

    drop_table :refinery_sessions

  end

end
