class AddAllDayToScheduleEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :schedule_events, :all_day, :boolean, default: false, null: false
  end
end