module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def aggregate_drives(drives_array)
  	center = 0
  	left = 0
  	right = 0
  	drives_array.each do |i|
  	  if i == 1
  	  	center += 1
  	  elsif i == 2
  	  	left += 1
  	  else
  	  	right += 1
  	  end
  	end
  	return "#{left}/#{center}/#{right}"
  end

end
