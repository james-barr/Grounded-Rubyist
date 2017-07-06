class Cookbook
  attr_accessor :title, :author
  def initialize
    @recipes = []
  end
  def method_missing(m,*args,&block)
    @recipes.push(m,*args,&block)
  end
end

class Recipe
end

recipe_for_cake = Recipe.new
recipe_for_chicken = Recipe.new

cb = Cookbook.new

cb << recipe_for_cake
cb << recipe_for_chicken

# beef_dishes = cb.select {|recipes| recipe.main_ingredient == "beef"}


p cb.recipes

def method_missing(m,*args,&block)
  raise NameError, "What on earth do you mean #{m}?"
end

# a

# BasicObject.new.a

a?
