## rewriting fake opperator methods

# class Person
#   attr_accessor :name, :age
#
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
#
#   def >(other_person)
#     age > other_person.age
#   end
#
#   def <(other_person)
#     age < other_person.age
#   end
# end
#
# bob = Person.new("Bob", 49)
# kim = Person.new("Kim", 33)
#
# puts "bob is older than kim" if bob > kim
#
# class Team
#   attr_accessor :name, :members
#
#   def initialize(name)
#     @name = name
#     @members = []
#   end
#
#   def <<(person)
#     members.push person
#   end
# end
#
# cowboys = Team.new("Dallas Cowboys")
# emmitt = Person.new("Emmitt Smith", 46)     # suppose we're using the Person class from earlier
#
# cowboys << emmitt                           # will this work?
#
# p cowboys.members


## Other fake opperators

# my_array = %w(first second third fourth)    # ["first", "second", "third", "fourth"]
#
# # element reference
# my_array[2]                                 # => "third"
# my_array.[](2)                              # => "third"
#
# # element assignment
# my_array[4] = "fifth"
# puts my_array.inspect                            # => ["first", "second", "third", "fourth", "fifth"]
#
# my_array.[]=(5, "sixth")
# puts my_array.inspect


## Rewriting

# class Team
#   # ... rest of code omitted for brevity
#
#   def [](idx)
#     members[idx]
#   end
#
#   def []=(idx, obj)
#     members[idx] = obj
#   end
# end
#
# # assume set up from earlier
# cowboys.members                           # => ... array of 3 Person objects
#
# cowboys[1]                                # => #<Person:0x007fae9295d830 @name="Emmitt Smith", @age=46>
# cowboys[3] = Person.new("JJ", 72)
# cowboys[3]
