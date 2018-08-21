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
  
  def sufficient_funds? 
    @sender.withdraw(@amount)
    if @sender.valid?
      true
    else 
      false
    end
  end 
  
  def execute_transaction
    if valid? && sufficient_funds?
      @receiver.deposit(@amount)
      @sender.withdraw(@amount)
      @status = "complete"
      return @status
    elsif @status != "pending"
      "Transaction can not be repeated."
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    
  end 
  
    
  
end
