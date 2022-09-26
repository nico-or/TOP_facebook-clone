require "digest/md5"

module GravatarHelper
  def gravatar_image_url(user, options = {})
    hash = Digest::MD5.hexdigest(user.email)

    url = "https://www.gravatar.com/avatar/#{hash}?d=identicon"
    url += "&s=#{options[:size]}" if options[:size]
    url
  end

  def gravatar_image_tag(user, options = {})
    options[:alt] = "User profile picture"
    src = gravatar_image_url(user, options[:gravatar] || {})
    image_tag(src, options)
  end
end
