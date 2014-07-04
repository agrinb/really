module ApplicationHelper

  def flash_class(key)
    binding.pry
    if "success"
      "alert alert-success"
    elsif "notice"
      "alert alert-info"
    else
      "alert alert-error"
    end
  end
end
