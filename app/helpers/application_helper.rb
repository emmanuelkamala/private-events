module ApplicationHelper
    def error_messages_for(object)
      render(:partial => 'application/error_messages', :locals => {:object => object})
    end

    def gravatar_for(user, options = {size:80})
     gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
     size = options[:size]
     gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
     image_tag(gravatar_url, alt: user.username, class: "img-circle")

    end
end
