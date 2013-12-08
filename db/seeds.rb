# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
#puts 'ROLES'
#YAML.load(ENV['ROLES']).each do |role|
#  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
#  puts 'role: ' << role
#end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

puts 'Calculus Questions'

Category.create( :real_name => 'Calculus', :name => 'calculus')

Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'Derivative of 3x^2 +2', :answer => '6x', :false_1 => '3x + 2', :false_2 => '8', :false_3 => '3x^2', :question_number => 1)  

Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'Derivative of pi / (1+ pi) ', :answer => '0', :false_1 => '1/(n+1)^2', :false_2 => 'pi', :false_3 => 'n/(n+1)^2', :question_number => 2)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'Derivative of n / (1+n) +2', :answer => '1/(n+1)^2', :false_1 => 'n', :false_2 => 'ln(n)', :false_3 => 'n/(n+1)^2', :question_number => 3)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'Derivative of sqroot(1+x) / x', :answer => '(-x-2) / (2(x^2)sqroot(x+1))', :false_1 => 'ln(1+x)/ln(x)', :false_2 => '1+x/(2(x^2sqroot(x+1))', :false_3 => '((1+x)/x)^-1/2', :question_number => 4)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'cos(3pi)', :answer => '-1', :false_1 => '0', :false_2 => '1', :false_3 => 'not defined', :question_number => 5)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'limit as x approaches 2: (3x^2 -x -10) / (x^2 -4)', :answer => '0', :false_1 => 'not defined', :false_2 => 'infinity', :false_3 => '2', :question_number => 6)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'limit as x approaches 3: (5x^2 -8x -13) / (x^2 -5)', :answer => '2', :false_1 => 'not defined', :false_2 => 'infinity', :false_3 => '0', :question_number => 7)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'derivative of 3z^(-2) - (1/z)', :answer => '(z-6)/(z^3)', :false_1 => '1/(z^3)', :false_2 => '(z-6)/3(z^2)', :false_3 => '(z)/3(z^2)', :question_number => 8)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'limit as x approaches -2: x/(x+2) ', :answer => '1/2', :false_1 => '1', :false_2 => '2', :false_3 => 'infinity', :question_number => 9)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'second derivative of tan(2x) ', :answer => '8tan(2x)sec^2(2x)', :false_1 => '4tan(x)sec^2(x)', :false_2 => 'sec^2', :false_3 => 'cos(2x)tan(x)', :question_number => 10)  


Quiz.create(:category_name => 'calculus',
:category_id => 1,  :difficulty => 1, :question => 'derivative of (t^2)cos[sqroot(t)] ', :answer => '2(t)cos(sqroot(t)) - .5(t^(3/2)sin(sqroot(t)))', :false_1 => '2(t)cos(t)', :false_2 => '2cos(t)', :false_3 => '2sin(t)', :question_number => 11)  


Quiz.create(:category_name => 'calculus',


Quiz.create(
:category_name => 'calculus',
:category_id => 1,  
:difficulty => 2, 
:question => 'absolute maximum and absolute minimum of the function f(x) = sqroot(4-x^2) on the interval [-2,2]', 
:answer => 'Max = 2; Min = 0', 
:false_1 => 'Max = 2; Min = -2', 
:false_2 => 'Max = 4; Min = 0', 
:false_3 => 'Max = 8; Min = 0', 
:question_number => 1)  


Quiz.create(
:category_name => 'calculus',
:category_id => 1, 
:difficulty => 2, 
:question => 'f(x) = (x^2 -3)(e^x)', 
:answer => 'Decreasing (-? , -3) and Increasing (1 , ?)', 
:false_1 => 'Decreasing (-? , 1) and Increasing (3 , ?)',
:false_2 => 'Decreasing (-? , -1) and Increasing (3 , ?)', 
:false_3 => 'Decreasing (-? , -1/3) and Increasing (3 , ?)', 
:question_number => 2)  

Quiz.create(
:category_name => 'calculus',
:category_id => 1,  
:difficulty => 2, 
:question => 'f(x) = x^4 - 8x^2 + 16 is increasing on the intervals:', 
:answer => '(-2 , 0) and (2, ?)', 
:false_1 => '(-2,?)',
:false_2 => '(-?,-2) and (2, ?)', 
:false_3 => '(-?,0) and (2, ?)', 
:question_number => 3)  

Quiz.create(
:category_name => 'calculus',
:category_id => 1,  
:difficulty => 2, 
:question => 'A rectangular plot of farmland will be bounded on one side by a river and on the other three sides by a single-strand electric fence. With 800 meters of wire at your disposal what is the largest area you can enclose in square meters.', 
:answer => '80,000', 
:false_1 => '100,000',
:false_2 => '60,000',
:false_3 => '8,000', 
:question_number => 4)  

Quiz.create(
:category_name => 'calculus',
:category_id => 1,  
:difficulty => 2, 
:question => 'f(x) = x^4 - 8x^2 + 16 is increasing on the intervals:', 
:answer => '(-2 , 0) and (2, ?)', 
:false_1 => '(-2,?)',
:false_2 => '(-?,-2) and (2, ?)', 
:false_3 => '(-?,0) and (2, ?)', 
:question_number => 5)  

Quiz.create(
:category_name => 'calculus',
:category_id => 1,  
:difficulty => 2, 
:question => 'You are designing a rectangular poster to contain 400 square inches of print-
ing with a 2 inch margin at the top and bottom and a 1 inch margin on each
side. If you make a poster that minimizes the amount of paper used then the
length of the shortest side in inches should be:', 
:answer => '12', 
:false_1 => '10',
:false_2 => '16', 
:false_3 => '14', 
:question_number => 6)  

Quiz.create(
:category_name => 'calculus',
:category_id => 1,  
:difficulty => 2, 
:question => 'Limit as x approaches 0. (8x^2)/(cos(x) -1):', 
:answer => '-16', 
:false_1 => '16',
:false_2 => '-8', 
:false_3 => '8', 
:question_number => 7)  

Quiz.create(
:category_name => 'calculus',
:category_id => 1,  
:difficulty => 2, 
:question => 'Integral (s^2 + sqroot(s))/(s^2)', 
:answer => 's - (2/sqroot(s))', 
:false_1 => 's',
:false_2 => '0', 
:false_3 => '-2/sqroot(s)', 
:question_number => 8)  

Quiz.create(
:category_name => 'calculus',
:category_id => 1,  
:difficulty => 2, 
:question => 'Integral from -2 to 0: |x|', 
:answer => '2', 
:false_1 => '1/2',
:false_2 => '4', 
:false_3 => '-2', 
:question_number => 9)  

Quiz.create(
:category_name => 'calculus',
:category_id => 1, 
:difficulty => 2, 
:question => 'The area between the graphs of y =2 -x, and y = -x is given by:', 
:answer => 'Integral -1 to 2: [2-x^2-x] dx', 
:false_1 => 'Integral -2 to 1: [2-x^2-x] dx', 
:false_2 => 'Integral -2 to 1: [2+x^2-x] dx', 
:false_3 => 'Integral -1 to 2: [2-x^2+x] dx', 
:question_number => 10)  




puts 'successfully put Questions'

