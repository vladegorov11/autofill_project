class ProjectDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime("%a %d/%m/%y")
  end

  def in_archive_alert?
    object.archived ? 'alert-warning' : 'alert-success'
  end

  def in_archive_message?
    object.archived ? 'not active' : 'active'
  end
end
