class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end 
  
  def valid? 
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @sender.balance > amount && status == "pending"
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
    else 
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
    @status = "reversed"
    @sender.balance += amount
    @receiver.balance -= amount 
    end 
  end
  
end
