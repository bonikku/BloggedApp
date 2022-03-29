module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email = user.email
    hash = Digest::MD5.hexdigest(email)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: 'rounded mx-auto d-block')
  end

  def current_user
    # Memoization
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end
