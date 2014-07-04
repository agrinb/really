module ApplicationHelper

  def flash_class(key)
    binding.pry
    if key == "success"
      "alert alert-success"
    elsif key == "notice"
      "alert alert-info"
    else
      "alert alert-error"
    end
  end
end
