class ScheduleEventsController < ApplicationController
  def index #一覧表示
    @schedule_events = ScheduleEvent.all.order(start_at: :asc)
    @today = Date.today
    @total = @schedule_events.count
  end

  def show #詳細表示
    @schedule_event = ScheduleEvent.find(params[:id])
  end

  def new #新規作成フォーム
    @schedule_event = ScheduleEvent.new
  end

  def create #新規作成処理
    @schedule_event = ScheduleEvent.new(schedule_event_params)
    if @schedule_event.save
      redirect_to schedule_events_path, notice: "スケジュールを作成しました"
      # redirect_to("/schedule_events")
      # flash[:notice] = "スケジュールを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit #編集フォーム
    @schedule_event = ScheduleEvent.find(params[:id])
  end

  def update #編集処理
    @schedule_event = ScheduleEvent.find(params[:id])
    if @schedule_event.update(schedule_event_params)
      redirect_to schedule_events_path, notice: "スケジュールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy #削除処理
    @schedule_event = ScheduleEvent.find(params[:id])
    @schedule_event.destroy
    redirect_to schedule_events_path, notice: "スケジュールを削除しました"
  end

  private

  def schedule_event_params
    params.require(:schedule_event).permit(:title, :start_at, :end_at, :all_day, :memo)
  end
end