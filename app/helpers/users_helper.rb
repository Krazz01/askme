module UsersHelper
  def display_nickname(user)
    "@#{user.nickname}"
  end

  def navbar_color(user)
    user.navcolor
  end
end
