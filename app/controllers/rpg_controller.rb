class RpgController < ApplicationController
  def index
  	session[:gold] = 0 unless session[:gold]
  	session[:action] = ["It won't let me play if this is nil..."] unless session[:action]
  end

  def farm
  	@earnings = rand(10..20)
    timestamp = Time.new.strftime("%Y/%m/%d %l:%M %p")
  	session[:action].unshift "Earned #{@earnings} golds from the farm! (#{timestamp})"
  	session[:gold]+=@earnings
  	redirect_to '/'
  end

  def cave
  	@earnings = rand(5..10)
    timestamp = Time.new.strftime("%Y/%m/%d %l:%M %p")
  	session[:action].unshift "Earned #{@earnings} golds from the cave! (#{timestamp})"
  	session[:gold]+=@earnings
  	redirect_to '/'
  end

  def house
  	@earnings = rand(2..5)
    timestamp = Time.new.strftime("%Y/%m/%d %l:%M %p")
  	session[:action].unshift "Earned #{@earnings} golds from the house! (#{timestamp})"
  	session[:gold]+=@earnings
  	redirect_to '/'
  end

  def casino
  	if session[:gold] <= 0
      timestamp = Time.new.strftime("%Y/%m/%d %l:%M %p")
  	  session[:action].unshift "Can't play at the casino when you're broke. (#{timestamp})"
  	  redirect_to '/'
  	else
      timestamp = Time.new.strftime("%Y/%m/%d %l:%M %p")
  	  chance = rand(1..2)
  	  @earnings = rand(0..50)
  	  if chance == 1
  	    session[:gold]+=@earnings
        session[:action].unshift "Earned #{@earnings} golds from the casino! (#{timestamp})"
  	  else 
  	    session[:gold]-=@earnings
        if session[:gold]<0
          session[:gold] = 0
        end
        session[:action].unshift "Lost #{@earnings} golds from the casino! (#{timestamp})"
  	  end
  	  redirect_to '/'
  	end
  end

  def reset
  	reset_session
  	redirect_to '/'
  end

end
