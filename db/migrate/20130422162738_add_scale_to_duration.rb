class AddScaleToDuration < ActiveRecord::Migration
  def change
    change_column :refinery_walks, :duration, :decimal, :precision => 4, :scale => 2
  end
end
