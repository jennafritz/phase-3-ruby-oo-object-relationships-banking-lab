require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? && receiver.balance >= self.amount
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    if (self.valid? == true && self.status == "pending")
      self.status = "complete"
      sender.balance = sender.balance - self.amount
      receiver.balance = receiver.balance + self.amount
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.status = "reversed"
      receiver.balance = receiver.balance - amount
      sender.balance = sender.balance + amount
    end
  end

end
