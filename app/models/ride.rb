class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def short_tickets?
    true if self.user.tickets < self.attraction.tickets
  end

  def too_short?
    true if self.user.height < self.attraction.min_height
  end

  def took_ride
    new_tickets = self.user.tickets - self.attraction.tickets
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    self.user.update(:happiness => new_happiness, :tickets => new_tickets, :nausea => new_nausea)
  end

  def take_ride
    if short_tickets?  && !too_short?
      'Sorry. You do not have enough tickets to ride the Roller Coaster.'
    elsif too_short? && !short_tickets?
      'Sorry. You are not tall enough to ride the Roller Coaster.'
    elsif short_tickets? && too_short?
      'Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster.'
    else
      took_ride
    end
  end

end
