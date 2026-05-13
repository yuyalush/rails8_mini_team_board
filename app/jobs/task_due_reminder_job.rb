class TaskDueReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    today = Date.today

    Task.where(due_on: today).where.not(assignee_id: nil).each do |task|
      # 同じ通知を重複して作らない
      next if Notification.exists?(task: task, user_id: task.assignee_id, kind: "due_today")

      Notification.create!(
        task: task,
        user_id: task.assignee_id,
        kind: "due_today"
      )

    end
  end
end
