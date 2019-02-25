module ApplicationHelper

  def user_address
    "#{current_user.address.prefecture}" + " " + "#{current_user.address.city}" + " " + "#{current_user.address.house_number}" + " " + "#{current_user.address.building_name}"
  end
end
