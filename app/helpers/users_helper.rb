module UsersHelper
  def displayed_image(image)
    if image.attached?
      image
    else
      "/public/dummy-prof.png"
    end
  end
end
