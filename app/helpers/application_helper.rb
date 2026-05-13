module ApplicationHelper
  TASK_STATUS_LABELS = {
    "open"        => "未着手",
    "in_progress" => "進行中",
    "done"        => "完了"
  }.freeze

  TASK_PRIORITY_LABELS = {
    "low"    => "低",
    "medium" => "中",
    "high"   => "高"
  }.freeze

  def task_status_label(status)
    label_badge(TASK_STATUS_LABELS.fetch(status, status), "status-#{status}")
  end

  def task_priority_label(priority)
    label_badge(TASK_PRIORITY_LABELS.fetch(priority, priority), "priority-#{priority}")
  end

  private

  def label_badge(text, tone_class)
    content_tag(:span, text, class: ["badge", tone_class])
  end
end
