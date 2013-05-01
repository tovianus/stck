class StaticPagesController < ApplicationController
  skip_authorization_check
  #load_and_authorize_resource
  def home

  end
  def help
  end
  def about
  end
  def contact
  end
  def dashboard
    
#TODO: set title
    #Ytd stat
    @pending_ytd    =StckRequest.pending.forthisyear.byuser(current_user).count
    @registered_ytd =StckRequest.registered.forthisyear.byuser(current_user).count
    @cancelled_ytd  =StckRequest.cancelled.forthisyear.byuser(current_user).count
    @approved_ytd   =StckRequest.approved.forthisyear.byuser(current_user).count
    @printed_ytd    =StckRequest.printed.forthisyear.byuser(current_user).count
    #Mtd stat
    @pending_mtd    =StckRequest.pending.forthismonth.byuser(current_user).count
    @registered_mtd =StckRequest.registered.forthismonth.byuser(current_user).count
    @cancelled_mtd  =StckRequest.cancelled.forthismonth.byuser(current_user).count
    @approved_mtd   =StckRequest.approved.forthismonth.byuser(current_user).count
    @printed_mtd    =StckRequest.printed.forthismonth.byuser(current_user).count
    #Today stat
    @pending_today    =StckRequest.pending.fortoday.byuser(current_user).count
    @registered_today =StckRequest.registered.fortoday.byuser(current_user).count
    @cancelled_today  =StckRequest.cancelled.fortoday.byuser(current_user).count
    @approved_today   =StckRequest.approved.fortoday.byuser(current_user).count
    @printed_today    =StckRequest.printed.fortoday.byuser(current_user).count
    #Records
    @pending    =StckRequest.pending.byuser(current_user).limit(5)
    @registered =StckRequest.registered.byuser(current_user).limit(5)
    @cancelled  =StckRequest.cancelled.byuser(current_user).limit(5)
    @approved   =StckRequest.approved.byuser(current_user).limit(5)
    @printed    =StckRequest.printed.byuser(current_user).limit(5)

  end
end
