module ApplicationHelper

  def active_item(uri)
    uri_segment = request.fullpath.split(/\/|\?/)
    uri_segment[1] === uri ? 'active' : ''
  end

  def has_error?(resource,field)
    resource.errors.messages[field].present?
  end

  def get_error(resource,field)
    resource.errors.messages[field].join(", ")
  end
end
