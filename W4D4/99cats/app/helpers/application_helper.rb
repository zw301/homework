module ApplicationHelper

  def auth_token
    auth_str = "<input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\'<%= #{form_authenticity_token} %>\'
    />"
    auth_str.html_safe
  end
end
