class User

#attributes: id, name, holds a user history in an array of wins and losses

 attr_accessor :id, :name, :history, :strikes

 @@all = []

 def initialize(id = nil, name)
   @id = id
   @name = name
   @strikes = 0
   @history = {wins: 0, losses: 0}
   @@all << self
   # count of wins; count of losses 
 end


end