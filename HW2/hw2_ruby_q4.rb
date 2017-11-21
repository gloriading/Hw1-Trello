# Question 4
# Given a ruby Hash that looks like this:
major_cities = {
  BC: ["Vancouver", "Victoria", "Prince George"],
  AB: ["Edmonton", "Calgary"]}
# Write a piece of code that loops through the object and prints the following to the console:
# BC has 3 main cities: Vancouver, Victoria, Prince George
# AB has 2 main cities: Edmonton, Calgary
#-----------------------------------------------------------------------
# loop through the hash and to print the key and "joined-array" value
major_cities.each do |province,city_arr|
    p "#{province} has #{city_arr.length} main cities: #{city_arr.join(", ")}"
end

#-----------------------------------------------------------------------
# [Stretch]: Make sure that there is an and before the last one:
# BC has 3 main cities: Vancouver, Victoria and Prince George
# AB has 2 main cities: Edmonton and Calgary
#-----------------------------------------------------------------------
# Using the string-adding feature: string + string
# Add "and " to the last element of each array before printing

major_cities.each do |province,city_arr|
  city_arr[city_arr.length-1] = "and " + city_arr[city_arr.length-1]
  p "#{province} has #{city_arr.length} main cities: #{city_arr.join(", ")}"
end
