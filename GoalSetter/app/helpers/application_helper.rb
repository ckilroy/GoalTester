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

  def delete_input
   <<-HTML.html_safe
     <input type="hidden" name="_method" value="delete">
  HTML
  end

end
