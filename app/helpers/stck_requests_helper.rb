module StckRequestsHelper
  def myformclass
  end

  def bbm_selects
    select_option=""
    StckRequest::BBM.each do |t|
      select_option+="<option value='#{t}'>t</option>"
    end
    return select_option
  end
end
