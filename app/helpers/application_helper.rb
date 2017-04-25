module ApplicationHelper
  def show_errors(object, form_field)
    return unless object.errors.any?
    return if object.errors.messages[form_field].blank?
    object.errors.messages[form_field].join(', ')
  end
end
