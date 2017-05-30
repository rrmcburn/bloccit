module UsersHelper
  def has_posts?
    current_user.posts.count != 0
  end

  def display_fav_post(post)
    username_info = "<h3>#{post.user.name}</h3> <img src='#{post.user.avatar_url}' class='media-object' />"
    username_info.html_safe
  end
end
