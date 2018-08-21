class Transfer
  
  def initialize(new_sender, new_receiver, new_amount)
    @sender = new_sender
    @reciever = new_receiver
    @amount = new_amount
    @status = "pending"
  end 
end
