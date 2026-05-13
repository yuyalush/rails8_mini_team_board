class DashboardController < ApplicationController
  def show
    @stats = Rails.cache.fetch("dashboard:user:#{Current.user.id}", expires_in: 10.minutes) do
      {
        incomplete_tasks: Task.where(assignee_id: Current.user.id).where.not(status: "done").count,
        due_today: Task.where(assignee_id: Current.user.id, due_on: Date.today).count,
        per_project: Task.where(assignee_id: Current.user.id).group(:project_id).count
      }
    end
  end
end
