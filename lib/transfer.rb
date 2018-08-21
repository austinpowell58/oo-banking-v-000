class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount 
  
  def initialize(new_sender, new_receiver, new_amount)
    @sender = new_sender
    @receiver = new_receiver
    @amount = new_amount
    @status = "pending"
  end 
  
  def valid?
    sender.valid?
    receiver.valid?
  end 
  
  def execute_transaction
    if sender.valid?
      @receiver.deposit(@amount)
      @sender.withdraw(@amount)
    else
    
  
end
