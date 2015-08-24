module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
      <input type="hidden"
      name="authenticity_token"
      value="#{form_authenticity_token}">
    HTML
  end

  def sign_out_button
    <<-HTML.html_safe
      <form action="#{session_url}" method="post">
        #{auth_token}
        #{delete_input}
      <button>Sign Out</button>
      </form>
    HTML
  end

  def sign_up_link
    <<-HTML.html_safe
      <a href="#{new_user_url}">Sign Up</a>
    HTML
  end

  def sign_in_link
    <<-HTML.html_safe
      <a href="#{new_session_url}">Sign In</a>
    HTML
  end

  def delete_input
   <<-HTML.html_safe
     <input type="hidden" name="_method" value="delete">
  HTML
  end

  def flash_errors
    if flash[:errors]
      flash[:errors].map do |error|
        "#{error}"
      end.join("<br>").html_safe
    end
  end

end
