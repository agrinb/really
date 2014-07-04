module ApplicationHelper

  def flash_class(key)
    if key == "success"
      "alert alert-success"
    elsif key == "notice"
      "alert alert-info"
    else
      "alert alert-error"
    end
  end
end
