module UsersHelper

def gravatar_for(user, options = { size: 50 })
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  size = options[:size]
  gravatar_url = "https://s.gravatar.com/avatar/4d432fdf68b1637f9e33810fdd1d8871?s=80
"
  image_tag(gravatar_url, alt: user.name, class: "gravatar")
end
end
