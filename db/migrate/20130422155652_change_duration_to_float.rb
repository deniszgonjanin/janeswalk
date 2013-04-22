class ChangeDurationToFloat < ActiveRecord::Migration
  def up
    change_column :refinery_walks, :duration, :decimal
  end

  def down
  end
end
