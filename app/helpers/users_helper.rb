module UsersHelper
  def displayed_image(image)
    if image.attached?
      image
    else
      "/assets/dummy-prof.png"
    end
  end
end
