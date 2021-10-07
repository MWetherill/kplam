module ApplicationHelper
  def created_at(record)
    "Created On: " + record.created_at.strftime("%d-%b-%Y at %H:%M")
  end

  def updated_at(record)
    "Last Updated: " + record.updated_at.strftime("%d-%b-%Y at %H:%M")
  end

  def flash_type(type)
    return 'danger' if type == 'alert'
    return 'success' if type == 'notice'
    type
  end

  def created_by(id)
    "Created by " + User.find(id).username
  end
end
