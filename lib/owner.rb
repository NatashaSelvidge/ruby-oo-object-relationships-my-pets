class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(owner_name)
    @name=owner_name
    @species="human"
    @@all << self
  end 

  def say_species
    "I am a #{species}."
  end 

  def self.all
    @@all
  end 

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end 

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end 

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    self.dogs.each {|owned_dogs| owned_dogs.mood = "happy"}
  end  

  def feed_cats
    self.cats.each {|owned_cats| owned_cats.mood = "happy"}
  end 

  def pets
    self.dogs + self.cats
  end 

  def sell_pets
    pets.each do |pet|
     @@all.clear  
     pet.mood = "nervous"
     pet.owner = nil
    end 
  end 

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 

end