# Run the code. Change it so that it looks like the required output.


require 'erb'

recipe = {
  name: "Roasted Brussels Sprouts",
  ingredients: [
    "1 1/2 pounds Brussels sprouts",
    "3 tablespoons good olive oil",
    "3/4 teaspoon kosher salt",
    "1/2 teaspoon freshly ground black pepper"
  ],
  directions: [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
  ]
}

recipe_title = "Recipe: #{recipe[:name]}"

@recipe_ingredients = ""
recipe[:ingredients].each do |ingredient|
  @recipe_ingredients +=  "#{ingredient}\n"
end

@recipe_directions = ""
recipe[:directions].each_with_index do |direction, index|
  @recipe_directions += "#{index+1}. #{direction}\n\n"
end

result = ""
result += "#=#{"=" * recipe_title.length}=#\n"
result += "# #{recipe_title} #\n"
result += "#=#{"=" * recipe_title.length}=#\n\n"
result += "Ingredients\n"
result += "-----------\n\n"
recipe[:ingredients].each do |ingredient|
  result +=  "#{ingredient}\n"
end

result += "\nDirections\n"
result += "----------\n\n"
recipe[:directions].each_with_index do |direction, index|
  result += "#{index+1}. #{direction}\n\n"
end

puts result

recipe_template = <<-ERB

#=<%= "=" * recipe_title.length %>=#
# <%= recipe_title %> #
#=<%= "=" * recipe_title.length %>=#

Ingredients
-----------

<%= @recipe_ingredients %>
Directions
----------

<%= @recipe_directions %>

ERB

erb = ERB.new(recipe_template)
puts erb.result
