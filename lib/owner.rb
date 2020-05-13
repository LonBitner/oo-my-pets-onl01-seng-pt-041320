class Owner
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    self.all.size
  end
  
  def self.reset_all
    self.all.clear
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name_of_cat)
    cats << Cat.new(name_of_cat, self)
  end
  
  def buy_dog(name_of_dog)
    dogs << Dog.new(name_of_dog, self)
  end
  
  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    cats.each do |cat|
      cat.mood = "nervous"
    end
     dogs.each do |dog|
      dog.mood = "nervous" 
    end
    cats.each do |cat|
      cat.owner = nil
    end
    dogs.each do |dog|
      dog.owner = nil 
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end


