module ApplicationHelper
  def show_errors(object, form_field)
    return unless object.errors.any?
    return if object.errors.messages[form_field].blank?
    object.errors.messages[form_field].join(', ')
  end

  def user_session(user_id)
    session[:user_id] = user_id
  end

  def end_user_session
    session[:user_id] = nil
  end
end
