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
    checking_sender = sender.withdraw(@amount)
    checking_reciever = receiver.deposit(@amount)
    checking_reciever.valid? && checking_sender.valid?
  end 
  
  def execute_transaction
    if 
      @receiver.deposit(@amount)
      @sender.withdraw(@amount)
      @status = "complete"
      return @status
    elsif @status != "pending"
      "Transaction can not be repeated."
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      return @status
    end
  end 
  
  def reverse_transfer
    
  end 
  
    
  
end
