module Swim
  def swim
    "I\'m swimming"
  end
end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Mamals < Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Fish < Pet
  include Swim
end

class Cat < Mamals
  def speak
    'meow!'
  end

  def swim
    'Cats can\'t swim!'
  end
end

class Dog < Mamals
  include Swim

  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class BullDog < Dog
  def swim
    'I can\'t swim!'
  end
end

#speak run jump swim fetch

cat = Cat.allocate
dog = Dog.allocate
fish = Fish.allocate
bulldog = BullDog.allocate

p cat.speak
p dog.speak
p bulldog.swim
p fish.swim

# p Pet.ancestors
# p Cat.ancestors
# p Dog.ancestors
# p BullDog.ancestors

class Person
  attr_accessor :name
  attr_reader :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def new_pet(pet)
    @pets << pet
  end

  def pet_names
    @pets.map { |pet| pet.name }
  end

  def pets_jump
    @pets.map { |pet| pet.jump }
  end
end

 joe = Person.new("Joe")
 joe.name
 bruno = BullDog.new("bruno")
 mazy = Cat.new("mazy")
 choco = Dog.new("choco")

 joe.new_pet(bruno)
 joe.new_pet(mazy)
 joe.new_pet(choco)
p joe.pet_names
p joe.pets_jump

p joe.pets.map { |pet| pet.swim }

p Person.ancestors
p BullDog.ancestors
p Cat.ancestors
p Dog.ancestors
