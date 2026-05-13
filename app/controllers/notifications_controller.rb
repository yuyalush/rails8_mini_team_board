class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user: Current.user).order(created_at: :desc)
  end

  def mark_as_read
    @notification = Notification.find(params[:id])
    @notification.update(read_at: Time.current)
    redirect_to task_path(@notification.task)
  end
end
