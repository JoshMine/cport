module ParticipantsHelper
  
    
  def current_participant
    @participant = current_user.portfolio.participant
  end
  
  def current_participant?(participant)
    participant == current_participant
  end
  
end
