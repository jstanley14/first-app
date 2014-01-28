include ApplicationHelper

def right_title(short_title)
  unless short_title.nil?
    if short_title == 'hom'
      return 'home'
    elsif short_title == 'hel'
      return 'help'
    end
  else
    return 'Invalid short_title'
  end
end