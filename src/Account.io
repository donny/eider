Account := Object clone
Account balance := 0.0
Account deposit := method(v, self balance := self balance + v)
Account show := method(write("Account balance: $", balance, "\n"))
