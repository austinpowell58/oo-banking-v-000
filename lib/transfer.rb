class Transfer
  
  attr_accessor :status, :last_transfer
  attr_reader :sender, :receiver, :amount 
  
  def initialize(new_sender, new_receiver, new_amount)
    @sender = new_sender
    @receiver = new_receiver
    @amount = new_amount
    @status = "pending"
  end 
  
  def valid?
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction
    if valid?
      @receiver.deposit(@amount)
      @sender.withdraw(@amount)
      @status = "complete"
    else 
      @status = "rejected"
    end
  end 
  
  def reverse_transfer
    
  end 
  
    
  
end
