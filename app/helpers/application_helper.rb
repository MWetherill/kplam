module ApplicationHelper
  def created_at(record)
    "Created On: " + record.created_at.strftime("%d-%m-%Y at %H:%M")
  end
  def updated_at(record)
    "Last Updated: " + record.updated_at.strftime("%d-%m-%Y at %H:%M")
  end
end
