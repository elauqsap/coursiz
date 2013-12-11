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

puts 'Now creating categories'

Category.create( :real_name => 'Calculus', :name => 'calculus')

Category.create( :real_name => 'Statistics', :name => 'statistics')

Category.create( :real_name => 'EPS', :name => 'eps')

Category.create( :real_name => 'Software Engineering', :name => 'softwareengineering')

puts 'Calculus I Questions'

Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'Derivative of 3x^2 +2', :answer => '6x', :false_1 => '3x + 2', :false_2 => '8', :false_3 => '3x^2', :question_number => 1)  

Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'Derivative of pi / (1+ pi) ', :answer => '0', :false_1 => '1/(n+1)^2', :false_2 => 'pi', :false_3 => 'n/(n+1)^2', :question_number => 2)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'Derivative of n / (1+n) +2', :answer => '1/(n+1)^2', :false_1 => 'n', :false_2 => 'ln(n)', :false_3 => 'n/(n+1)^2', :question_number => 3)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'Derivative of sqroot(1+x) / x', :answer => '(-x-2) / (2(x^2)sqroot(x+1))', :false_1 => 'ln(1+x)/ln(x)', :false_2 => '1+x/(2(x^2sqroot(x+1))', :false_3 => '((1+x)/x)^-1/2', :question_number => 4)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'cos(3pi)', :answer => '-1', :false_1 => '0', :false_2 => '1', :false_3 => 'not defined', :question_number => 5)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'limit as x approaches 2: (3x^2 -x -10) / (x^2 -4)', :answer => '0', :false_1 => 'not defined', :false_2 => 'infinity', :false_3 => '2', :question_number => 6)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'limit as x approaches 3: (5x^2 -8x -13) / (x^2 -5)', :answer => '2', :false_1 => 'not defined', :false_2 => 'infinity', :false_3 => '0', :question_number => 7)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'derivative of 3z^(-2) - (1/z)', :answer => '(z-6)/(z^3)', :false_1 => '1/(z^3)', :false_2 => '(z-6)/3(z^2)', :false_3 => '(z)/3(z^2)', :question_number => 8)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'limit as x approaches -2: x/(x+2) ', :answer => '1/2', :false_1 => '1', :false_2 => '2', :false_3 => 'infinity', :question_number => 9)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'second derivative of tan(2x) ', :answer => '8tan(2x)sec^2(2x)', :false_1 => '4tan(x)sec^2(x)', :false_2 => 'sec^2', :false_3 => 'cos(2x)tan(x)', :question_number => 10)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'derivative of (t^2)cos[sqroot(t)] ', :answer => '2(t)cos(sqroot(t)) - .5(t^(3/2)sin(sqroot(t)))', :false_1 => '2(t)cos(t)', :false_2 => '2cos(t)', :false_3 => '2sin(t)', :question_number => 11)  


Quiz.create(:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  :difficulty => 1, :question => 'derivative of e^-x:', :answer => '-3^(-x)*log(3)', :false_1 => '-e^-x', :false_2 => '-x+-e^-x', :false_3 => 'x+e^-x', :question_number => 12)  


Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  
:difficulty => 2, 
:question => 'absolute maximum and absolute minimum of the function f(x) = sqroot(4-x^2) on the interval [-2,2]', 
:answer => 'Max = 2; Min = 0', 
:false_1 => 'Max = 2; Min = -2', 
:false_2 => 'Max = 4; Min = 0', 
:false_3 => 'Max = 8; Min = 0', 
:question_number => 1)  


Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id, 
:difficulty => 2, 
:question => 'f(x) = (x^2 -3)(e^x)', 
:answer => 'Decreasing (-? , -3) and Increasing (1 , ?)', 
:false_1 => 'Decreasing (-? , 1) and Increasing (3 , ?)',
:false_2 => 'Decreasing (-? , -1) and Increasing (3 , ?)', 
:false_3 => 'Decreasing (-? , -1/3) and Increasing (3 , ?)', 
:question_number => 2)  

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  
:difficulty => 2, 
:question => 'f(x) = x^4 - 8x^2 + 16 is increasing on the intervals:', 
:answer => '(-2 , 0) and (2, ?)', 
:false_1 => '(-2,?)',
:false_2 => '(-?,-2) and (2, ?)', 
:false_3 => '(-?,0) and (2, ?)', 
:question_number => 3)  

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  
:difficulty => 2, 
:question => 'A rectangular plot of farmland will be bounded on one side by a river and on the other three sides by a single-strand electric fence. With 800 meters of wire at your disposal what is the largest area you can enclose in square meters.', 
:answer => '80,000', 
:false_1 => '100,000',
:false_2 => '60,000',
:false_3 => '8,000', 
:question_number => 4)  

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  
:difficulty => 2, 
:question => 'f(x) = x^4 - 8x^2 + 16 is increasing on the intervals:', 
:answer => '(-2 , 0) and (2, ?)', 
:false_1 => '(-2,?)',
:false_2 => '(-?,-2) and (2, ?)', 
:false_3 => '(-?,0) and (2, ?)', 
:question_number => 5)  

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  
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
:category_id => Category.find_by_name('calculus').id,  
:difficulty => 2, 
:question => 'Limit as x approaches 0. (8x^2)/(cos(x) -1):', 
:answer => '-16', 
:false_1 => '16',
:false_2 => '-8', 
:false_3 => '8', 
:question_number => 7)  

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  
:difficulty => 2, 
:question => 'Integral (s^2 + sqroot(s))/(s^2)', 
:answer => 's - (2/sqroot(s))', 
:false_1 => 's',
:false_2 => '0', 
:false_3 => '-2/sqroot(s)', 
:question_number => 8)  

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,  
:difficulty => 2, 
:question => 'Integral from -2 to 0: |x|', 
:answer => '2', 
:false_1 => '1/2',
:false_2 => '4', 
:false_3 => '-2', 
:question_number => 9)  

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id, 
:difficulty => 2, 
:question => 'The area between the graphs of y =2 -x, and y = -x is given by:', 
:answer => 'Integral -1 to 2: [2-x^2-x] dx', 
:false_1 => 'Integral -2 to 1: [2-x^2-x] dx', 
:false_2 => 'Integral -2 to 1: [2+x^2-x] dx', 
:false_3 => 'Integral -1 to 2: [2-x^2+x] dx', 
:question_number => 10)  

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'The x-values for the local extrema of the fucntion: f(x) = x^4 -2x^3', 
:answer => '3/2', 
:false_1 => '2/3', 
:false_2 => '3', 
:false_3 => '2',
:question_number => 11) 

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'Find Lmit as x approaches 0": ((e^x) - 1) / (xcos(x))', 
:answer => '1', 
:false_1 => '2', 
:false_2 => '3', 
:false_3 => '4',
:question_number => 12) 

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'A farmer wishes to build a rectangular pen next to a river. He does not need to build a fence along the river. He has 1600 feet of fence. What dimensions maximize the area he can enclose? ', 
:answer => '800 x 400', 
:false_1 => '40 x 40', 
:false_2 => '1600 x 1000', 
:false_3 => '600 x 800',
:question_number => 13)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'Integral 1 to 4: (3/2)sqroot(x) - (4/(x^2)) dx', 
:answer => '4', 
:false_1 => '14', 
:false_2 => '0', 
:false_3 => '-3',
:question_number => 14)


Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'Integral (1/ (e^2t)) - cos(2t) dt', 
:answer => '-.5(1/e^2t) - .5sing(2t) + C', 
:false_1 => '.5(1/e^2t) - .5sing(2t) + C', 
:false_2 => '-.5(1/e^2t) + .5sing(2t) + C', 
:false_3 => '+.5(1/e^2t) + .5sing(2t) + C',
:question_number => 15)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'A train, starting at 11am, travels east at 45 mph while another, starting at noon from the same point, travels south at 60 mph. How fast are they separating at 3pm? ', 
:answer => '105 / sqroot(2)', 
:false_1 => '105', 
:false_2 => '67.5', 
:false_3 => '82.5',
:question_number => 16)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'Integrate 0 to 2: -3e^(2x) dx', 
:answer => '(3/2)((e^4) -1)',
:false_1 => '(3/2)((e^4) +1)', 
:false_2 => '((e^4) -1)', 
:false_3 => '(2/3)((e^4) -1)',
:question_number => 17)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'Suppose y = f(x) and y satisfies the relation 4x^3 - y^4 -3y + 5x + 1 = 0. The derivative of y with respect to x at (1,-2) is:', 
:answer => '-17/29',
:false_1 => '46/29', 
:false_2 => '29/17', 
:false_3 => '-29/17',
:question_number => 18)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'The derivative of the function y = ln(t^3 + 3)^5 is', 
:answer => '15(t^2) / ((t^3)+3)',
:false_1 => '15(t^2)', 
:false_2 => '((t^3)+3)', 
:false_3 => '15(t^2) / ((t^3)-3)',
:question_number => 19)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'The integral sqroot(16x) dx is ', 
:answer => '8/3(sqroot(x^3) +C',
:false_1 => '3/8(sqroot(x^3) +C', 
:false_2 => '(sqroot(x^3) +C', 
:false_3 => '3(sqroot(x^3) +C',
:question_number => 20)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 2, 
:question => 'The integral sqroot(16x) dx is ', 
:answer => '8/3(sqroot(x^3) +C',
:false_1 => '3/8(sqroot(x^3) +C', 
:false_2 => '(sqroot(x^3) +C', 
:false_3 => '3(sqroot(x^3) +C',
:question_number => 21)

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Limit as h approaches 0: (sqroot(3h +1) -1)/h', 
:answer =>  '3/2', 
:false_1 => '3', 
:false_2 => '2', 
:false_3 => '0',
:question_number => 1)

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id, 
:difficulty => 3, 
:question =>'Limit as h approaches 9: (sqroot(x) -3)/(x-9)', 
:answer =>  '1/6', 
:false_1 => '6', 
:false_2 => '3', 
:false_3 => '1/3',
:question_number => 2)

Quiz.create(
:category_name => 'calculus',
:category_id => Category.find_by_name('calculus').id, 
:difficulty => 3, 
:question =>'Limit as y approaches 0: sin(3y) / 4y', 
:answer =>  '3/4', 
:false_1 => '1/4', 
:false_2 => '4/3', 
:false_3 => '2/3',
:question_number => 3)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Derivative of w = 3z^-2 -(1/z)', 
:answer =>  '(z-6)/(z^3)', 
:false_1 => '(6-z)/(z^3)', 
:false_2 => '(-5)/(z^2)', 
:false_3 => '(z+6)/(z^3)',
:question_number => 4)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Derivative of (1 + x - 4sqroot(x))/x', 
:answer =>  '(-1 +2sqroot(x))/(x^2)', 
:false_1 => '(-1 +2x+2sqroot(x)/(x^2)', 
:false_2 => '(1 +2x+2sqroot(x)/(x^2)', 
:false_3 => '(1 -2x+2sqroot(x)/(x^2)',
:question_number => 5)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Derivative of y = x(e^-x) + (e^x)', 
:answer =>  '(1-x)/(e^x) + (e^x)', 
:false_1 => '(1+x)/(e^x) + (e^x)', 
:false_2 => '(x-1)/(e^x) + (e^x)', 
:false_3 => '(x+1)/(e^x) + (e^x)',
:question_number => 6)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Find dy/dx if (x^2)y + x(y^2) = 6', 
:answer =>  '(-2xy - y^2)/(x^2 + 2xy)', 
:false_1 => '(-2y -(y^2))/(x+2y)', 
:false_2 => '(-2-y)/(x+2y)', 
:false_3 => '(2+y)/(x+2)',
:question_number => 7)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'derivative of y = sin^-1(sqroot(2)*t)', 
:answer =>  'sqroot(2)/(sqroot(1-2t^2))', 
:false_1 => '1/(sqroot(1-2t))', 
:false_2 => '-sqroot(2)/(sqroot(1-2t^2))', 
:false_3 => '1/(sqroot(1+2t))',
:question_number => 8)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Find the absolute max and min of g(x) = xe^(-x) on the interval -1<=x<=1', 
:answer =>  'Max = 1/3 and Min = -e', 
:false_1 => 'Max = 3 and Min = 0', 
:false_2 => 'Max = 1/3 and Min = 0', 
:false_3 => 'Max = e and Min = 0',
:question_number => 9)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Find the intervals of increase and decrease for y = 4x^3 - x^4', 
:answer =>  'Increasing on (-infinity, 3) and Decreasing on (3,infinity)', 
:false_1 => 'Increasing on (-infinity, 0) and Decreasing on (0,3)', 
:false_2 => 'Decreasing on (-infinity, 3) and Increasing on (3,infinity)', 
:false_3 => 'Increasing on (-3,0) and Decreasing on (3,infinity)',
:question_number => 10)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Find the intervals of increase and decrease for y = x^5 -5x^4', 
:answer =>  'Increasing on (-infinity, 0) and (4,infinity) Decreasing on (0,4)', 
:false_1 => 'Increasing on (-infinity, 4) Decreasing on (1,4)', 
:false_2 => 'Increasing on (-infinity, -1) Decreasing on (4,infinity)', 
:false_3 => 'Increasing on (-infinity, -4) Decreasing on (1,4)',
:question_number => 11)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Limit as theta approaches pi/2: (1-sin(theta)) / (1+ cos(2theta))', 
:answer =>  '1/4', 
:false_1 => '1/2', 
:false_2 => '-1/2', 
:false_3 => '0',
:question_number => 12)


Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'integral 2x(1-3(x^-3))dx', 
:answer =>  'x^2 + 6/x + C', 
:false_1 => 'x^2 + 3/x + C', 
:false_2 => 'x^2 + 1/x + C', 
:false_3 => 'x^2 + 2/x + C',
:question_number => 13)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'integral sqroot(3 -2s)ds', 
:answer =>  '-(1/3)(3-2s)^(3/2) +C', 
:false_1 => '(1/3)(3-2s)^(3/2) +C', 
:false_2 => '-(3-2s)^(3/2) +C', 
:false_3 => '-(1/3)(3-2s)^(1/2) +C',
:question_number => 14)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'integral 1/((sqroot(x)((1+sqroot(x))^2)dx', 
:answer =>  '-2/(1+sqroot(x)) +C', 
:false_1 => '1/(1+sqroot(x)) +C', 
:false_2 => '-1/(1+sqroot(x)) +C', 
:false_3 => '2/(1+sqroot(x)) +C',
:question_number => 15)


Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Find the area enclosed by the curves y = x^4 and y = 8x', 
:answer =>  '48/5', 
:false_1 => '48/3', 
:false_2 => '16', 
:false_3 => '16/3',
:question_number => 16)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Find Integral 0 to 1: 16x / (8(x^2) + 2)', 
:answer =>  'ln 5', 
:false_1 => 'ln 4', 
:false_2 => 'ln 3', 
:false_3 => 'ln 0',
:question_number => 17)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Find Integral e^(sqroot(w)) / sqroot(w)  dw', 
:answer =>  '2e^(sqroot(w))', 
:false_1 => 'e^(sqroot(w))', 
:false_2 => 'e^(sqroot(2w))', 
:false_3 => '2e^(sqroot(2w))',
:question_number => 18)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Find Integral x ln x dx', 
:answer =>  '((x^2)/2)*ln(x) - (1/4)(x^2) + C', 
:false_1 => '((x^2)/2)*ln(x) - (x^2) + C', 
:false_2 => '((x^2)/2)*ln(x) + C', 
:false_3 => 'ln(x) - (1/4)(x^2) + C',
:question_number => 19)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Integral y / (y^2 - 2y - 3) dy', 
:answer =>  '(1/4) (ln|y-3|)^3|y+1| + C', 
:false_1 => '(ln|y-3|)^3|y+1| + C', 
:false_2 => '(4)(ln|y-3|)^3|y+1| + C', 
:false_3 => '(ln|y-3|)^3 + C', 
:question_number => 20)


Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Integral 4x^32', 
:answer =>  '(4x^33)/33 + C', 
:false_1 => '(4x^32)/33', 
:false_2 => '(4x^33)/32+C', 
:false_3 => '(4x^31)/32', 
:question_number => 21)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Integral x^12', 
:answer =>  '(x^13)/13 + C', 
:false_1 => '(x^12)/13', 
:false_2 => '(x^13)/12 + C', 
:false_3 => '(12x^11)', 
:question_number => 22)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Integral sin(x) * cos(x)', 
:answer =>  '-.5cos^2(x) + C', 
:false_1 => '.5cos^2(x) + C', 
:false_2 => 'cos^2(x) + C', 
:false_3 => '-cos^2(x) + C', 
:question_number => 23)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Integral sin^2(x)', 
:answer =>  '.5(x-sin(x)*cos(x))+C', 
:false_1 => '-.5(x-sin(x)*cos(x))+C', 
:false_2 => '-(x-sin(x)*cos(x))+C', 
:false_3 => '(x-sin(x)*cos(x))+C', 
:question_number => 24)

Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Derivative 5x^2 + 6x) / e^x', 
:answer =>  '2(e^-x)((5(e^x)-3)x +3)', 
:false_1 => '(e^-x)((5(e^x)-3)x +3)', 
:false_2 => '.5(e^-x)((5(e^x)-3)x +3)', 
:false_3 => '-.5(e^-x)((5(e^x)-3)x +3)', 
:question_number => 25)


Quiz.create(
:category_name => 'calculus', 
:category_id => Category.find_by_name('calculus').id,
:difficulty => 3, 
:question =>'Derivative of e^(e^x)', 
:answer =>  'e^(x+e^x)', 
:false_1 => '-e^(e^x)', 
:false_2 => 'e^(x)', 
:false_3 => 'e^(e^x)', 
:question_number => 26)

puts 'Statistics Questions'

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 1, 
:question =>'In a nationwide survey, suppose 100 boys and 50 girls are sampled. What is the probability that the male sample will have at most three more days of absences than the female sample?', 
:answer =>  '0.035', 
:false_1 => '0.025', 
:false_2 => '0.055', 
:false_3 => '0.045',
:question_number => 1)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 1, 
:question =>'Which of the following statements is true.	I. When the margin of error is small, the confidence level is high.	II. When the margin of error is small, the confidence level is low.	III. A confidence interval is a type of point estimate.	IV. A population mean is an example of a point estimate.', 
:answer =>  'None of the Ablove', 
:false_1 => 'All of the above', 
:false_2 => 'I, II, and IV', 
:false_3 => 'III only',
:question_number => 2)


Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 1, 
:question =>'Which of the following statements is true.	I. The standard error is computed solely from sample attributes.	II. The standard deviation is computed solely from sample attributes.	III. The standard error is a measure of central tendency.', 
:answer =>  'I only', 
:false_1 => 'II only', 
:false_2 => 'III only', 
:false_3 => 'All of the Above',
:question_number => 3)


Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 1, 
:question =>'Nine hundred (900) high school freshmen were randomly selected for a national survey. Among survey participants, the mean grade-point average (GPA) was 2.7, and the standard deviation was 0.4. What is the margin of error, assuming a 95% confidence level?', 
:answer =>  '0.025', 
:false_1 => '0.013', 
:false_2 => '1.960', 
:false_3 => '0.500',
:question_number => 4)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 1, 
:question =>'Suppose we want to estimate the average weight of an adult male in Dekalb County, Georgia. We draw a random sample of 1,000 men from a population of 1,000,000 men and weigh them. We find that the average man in our sample weighs 180 pounds, and the standard deviation of the sample is 30 pounds. What is the 95% confidence interval.', 
:answer =>  '180 + 1.86 ', 
:false_1 => '180 + 3.0', 
:false_2 => '180 + 5.88', 
:false_3 => '180 + 30',
:question_number => 5)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 2, 
:question =>'A major metropolitan newspaper selected a simple random sample of 1,600 readers from their list of 100,000 subscribers. They asked whether the paper should increase its coverage of local news. Forty percent of the sample wanted more local news. What is the 99% confidence interval for the proportion of readers who would like more coverage of local news?', 
:answer =>  '0.37 to 0.43', 
:false_1 => '0.35 to 0.45', 
:false_2 => '0.32 to 0.48 ', 
:false_3 => '0.30 to 0.50 ',
:question_number => 1)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 2, 
:question =>'Suppose the Cartoon Network conducts a nation-wide survey to assess viewer attitudes toward Superman. Using a simple random sample, they select 400 boys and 300 girls to participate in the study. Forty percent of the boys say that Superman is their favorite character, compared to thirty percent of the girls. What is the 90% confidence interval for the true difference in attitudes toward Superman?', 
:answer =>  '4 to 16 percent more boys prefer Superman', 
:false_1 => '0 to 20 percent more boys prefer Superman', 
:false_2 => '2 to 18 percent more boys prefer Superman', 
:false_3 => '6 to 14 percent more boys prefer Superman',
:question_number => 2)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 2, 
:question =>'Suppose a simple random sample of 150 students is drawn from a population of 3000 college students. Among sampled students, the average IQ score is 115 with a standard deviation of 10. What is the 99% confidence interval for the students IQ score?', 
:answer =>  '115 + 2.1 ', 
:false_1 => '115 + 0.01', 
:false_2 => '115 + 0.82 ', 
:false_3 => '115 + 2.6 ',
:question_number => 3)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 2, 
:question =>'Suppose that simple random samples of college freshman are selected from two universities - 15 students from school A and 20 students from school B. On a standardized test, the sample from school A has an average score of 1000 with a standard deviation of 100. The sample from school B has an average score of 950 with a standard deviation of 90. What is the 90% confidence interval for the difference in test scores at the two schools, assuming that test scores came from normal distributions in both schools? (Hint: Since the sample sizes are small, use at score as the critical value.)', 
:answer =>  '50 + 55.66 ', 
:false_1 => '50 + 32.74', 
:false_2 => '50 + 28.49 ', 
:false_3 => '50 + 1.70 ',
:question_number => 4)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 2, 
:question =>'The local baseball team conducts a study to find the amount spent on refreshments at the ball park. Over the course of the season they gather simple random samples of 50 men and 100 women. For men, the average expenditure was $20, with a standard deviation of $3. For women, it was $15, with a standard deviation of $2.What is the 99% confidence interval for the spending difference between men and women? Assume that the two populations are independent and normally distributed', 
:answer =>  '$5 + $1.21', 
:false_1 => '$5 + $0.47', 
:false_2 => '$5 + $2.58', 
:false_3 => '$5 + $5.00',
:question_number => 5)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 3,
:question =>'The local utility company surveys 101 randomly selected customers. For each survey participant, the company collects the following: annual electric bill (in dollars) and home size (in square feet). Output from a regression analysis appears below.
Regression equation:   Annual bill = 0.55 * Home size + 15
Predictor 	Coef 	SE Coef 	T 	P
Constant 	15 	3 	5.0 	0.00
Home size 	0.55 	0.24 	2.29 	0.01
What is the 99% confidence interval for the slope of the regression line?', 
:answer =>  '-0.08 to 1.18', 
:false_1 => '0.25 to 0.85', 
:false_2 => '0.02 to 1.08', 
:false_3 => '0.30 to 1.40',
:question_number => 1)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 3, 
:question =>'Other things being equal, which of the following actions will reduce the power of a hypothesis test?	I. Increasing sample size.	II. Increasing significance level.	III. Increasing beta, the probability of a',
:answer =>  'III only', 
:false_1 => 'II only', 
:false_2 => 'I only', 
:false_3 => 'All of the above',
:question_number => 2)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 3, 
:question =>'Suppose a researcher conducts an experiment to test a hypothesis. If she doubles her sample size, which of the following will increase?	I. The power of the hypothesis test.	II. The effect size of the hypothesis test.	III. The probability of making a Type II error. ',
:answer =>  'I only', 
:false_1 => 'II only', 
:false_2 => 'III only', 
:false_3 => 'All of the above',
:question_number => 3)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 3, 
:question =>'In hypothesis testing, which of the following statements is always true?	I. The P-value is greater than the significance level.	II. The P-value is computed from the significance level.	III. The P-value is the parameter in the null hypothesis.	IV. The P-value is a test statistic.	V. The P-value is a probability.',
:answer =>  'V only', 
:false_1 => 'II only', 
:false_2 => 'III only', 
:false_3 => 'All of the above',
:question_number => 4)

Quiz.create(
:category_name => 'statistics',
:category_id => Category.find_by_name('statistics').id,
:difficulty => 3, 
:question =>'Which of the following is not one of the solution steps for a One-tailed Test?',
:answer =>  'Compare data', 
:false_1 => 'Formulate an analysis plan', 
:false_2 => 'Analyze sample data', 
:false_3 => 'Interpret results',
:question_number => 5)

puts 'EPSII Questions'

Quiz.create(
:category_name => 'eps', 
:category_id => Category.find_by_name('eps').id,
:difficulty => 1, 
:question => 'Which of the following are true about the following C statements?
int i, j;
float x;', 
:answer => '3 memory locations are being reserved, 1 floating point, and 2 integers.', 
:false_1 => '2 memory locations are being reserved.',
:false_2 => '2 memory locations are being reserved', 
:false_3 => 'Variables i and j must contain the same value because they are declared in the same statement.',
:question_number => 1)

Quiz.create(
:category_name => 'eps', 
:category_id => Category.find_by_name('eps').id,
:difficulty => 1, 
:question => 'What value is contained in the variable y at the end of execution of the following statements?
int x = 7; int y;
x = 7 + x;
y = x + y;', 
:answer => 'Cant be determined', 
:false_1 => '14',
:false_2 => '21', 
:false_3 => '7',
:question_number => 2)

Quiz.create(
:category_name => 'eps', 
:category_id => Category.find_by_name('eps').id,
:difficulty => 1, 
:question => 'Which statement is false about the following command?
gcc myProgram.c -o myProgram.exe
[Note: gcc -o myProgram.exe myProgram.c is the same]', 
:answer => 'The executable myProgram will run as a result of this command', 
:false_1 => 'The source program myProgram.c is being compiled',
:false_2 => 'An executable file called myProgram.exe will be created if no syntax errors are found in myProgram.c', 
:false_3 => 'Any syntax errors in myProgram.c will be reported to the user',
:question_number => 3)

Quiz.create(
:category_name => 'eps', 
:category_id => Category.find_by_name('eps').id,
:difficulty => 1, 
:question => 'The KDevelop IDE for C/C++ environment used in this course is:', 
:answer => 'A sophisticated graphical interface to help edit, compile and test programs.', 
:false_1 => 'A program compiler',
:false_2 => 'A C program debugger', 
:false_3 => 'A new kind of nuclear powered food processor.',
:question_number => 4)

Quiz.create(
:category_name => 'eps', 
:category_id => Category.find_by_name('eps').id,
:difficulty => 1, 
:question => 'Which  of    the    following    expressions    are    true    for    the    initial    conditions    shown?    
     
int i=3, j=4;
float z=3.4;
', 
:answer => '(i + j) > z', 
:false_1 => 'i > z',
:false_2 => '(2 * (i + j)) < z', 
:false_3 => '(2*z) <  (j-i)',
:question_number => 5)

Quiz.create(
:category_name => 'eps', 
:category_id => Category.find_by_name('eps').id,
:difficulty => 1, 
:question => 'Which statement is false', 
:answer => 'The    statements    in    an    if    statement    must    be    indented.    ', 
:false_1 => 'Whitespace   characters   such   as   tabs,   newlines   and   spaces   are   generally     ignored   by     the   C    
compiler.  ',
:false_2 => 'Placing       a       blank       line       before       and       after       every       control       structure       can       improve       program  
readability.  
', 
:false_3 => 'There    can    be    (but    should    not    be)    more    than    one    statement    per    line.    ',
:question_number => 6)


Quiz.create(
:category_name => 'eps', 
:category_id => Category.find_by_name('eps').id,
:difficulty => 1, 
:question => 'Which of the following is a bad programming practice', 
:answer => 'using floating-point values as the counter in counter-controlled repetition', 
:false_1 => 'indenting the statements in the body  of each control structure',
:false_2 => 'using more than  two levels of nesting', 
:false_3 => 'placing vertical spacing above and below control structures     ',
:question_number => 7)

Quiz.create(
:category_name => 'eps', 
:category_id => Category.find_by_name('eps').id,
:difficulty => 1, 
:question => 'When a number gets assigned to a variable that already has a value ', 
:answer => 'the new number overwrites the previous value at that memory location', 
:false_1 => 'the new number gets assigned to a neighboring memory location',
:false_2 => 'the computer issues an erro', 
:false_3 => 'the new value is destroyed and the old value remains',
:question_number => 8)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'What is Java?', 
:answer =>  'A computer programming language', 
:false_1 => 'A strong cup of coffee', 
:false_2 => 'An energy corporation', 
:false_3 => 'The chinese word for dog',
:question_number => 1)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'What is an applet?', 
:answer =>  'A simple computer application', 
:false_1 => 'A widget', 
:false_2 => 'An application on Macintosh computers', 
:false_3 => 'A type of fruit',
:question_number => 2)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'Given
- A and E are classes
- B and D are interfaces 
- C is an abstract class', 
:answer =>  'class F implements B{}', 
:false_1 => 'class F implements B,C{}', 
:false_2 => 'class F implements E{}', 
:false_3 => 'class F extends E{}',
:question_number => 3)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'What is the correct way to implement modular division?',
:answer =>  '%', 
:false_1 => '/', 
:false_2 => 'Math.mod()', 
:false_3 => 'mod()',
:question_number => 4)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'How many significant digits does a floating-point number provide?', 
:answer =>  '15', 
:false_1 => '8', 
:false_2 => '6', 
:false_3 => '16',
:question_number => 5)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'Object-Oriented Programming means...', 
:answer =>  'Writing an algorithm before writing your program and having a test plan', 
:false_1 => 'Being objective about what you develop', 
:false_2 => 'Designing the application based on the objects discovered when analysing the problem', 
:false_3 => 'Writing a program composed of Java classes',
:question_number => 6)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'If none of the private/protected/public is specified for a member, that member ...', 
:answer =>  'is only accessible from within the class', 
:false_1 => 'is accessible publicly', 
:false_2 => 'in only accessible by other classes of the same package', 
:false_3 => 'is accessible by the class and its subclasses',
:question_number => 7)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'Choose the appropriate data type for this value: "volitile"', 
:answer =>  'string', 
:false_1 => 'int', 
:false_2 => 'bool', 
:false_3 => 'double',
:question_number => 8)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'A class cannot be declared:', 
:answer =>  'Private', 
:false_1 => 'Default', 
:false_2 => 'Static', 
:false_3 => 'Canceled',
:question_number => 9)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'An array holds:', 
:answer =>  'similar values of same data type', 
:false_1 => 'different values of same data type', 
:false_2 => 'different values of different data types', 
:false_3 => 'same values of different data types',
:question_number => 10)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'In a for loop, what section of the loop is not included in the parenteses after for?', 
:answer =>  'Loop Body', 
:false_1 => 'Test statement', 
:false_2 => 'Initialization', 
:false_3 => 'Update',
:question_number => 11)


Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'What is the correct syntax for java main method?', 
:answer =>  'none of the above', 
:false_1 => 'public void main(String[] args)', 
:false_2 => 'public static void main(String[] args)', 
:false_3 => 'public static void main()',
:question_number => 12)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'Choose the appropriate data type for this value: female', 
:answer =>  'boolean', 
:false_1 => 'int', 
:false_2 => 'char', 
:false_3 => 'double',
:question_number => 13)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'What is an assignment statement?', 
:answer =>  'Assigning a value to a variable', 
:false_1 => 'Assigning a multiplication', 
:false_2 => 'Assigning a name to a variable', 
:false_3 => 'Adding a number to an int',
:question_number => 14)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 1, 
:question =>'A class is...',
:answer =>  'An abstract definition of an object',
:false_1 => 'an object',
:false_2 => 'an executable piece of code',
:false_3 => 'a variable',
:question_number => 15)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'What does GUI stand for?', 
:answer =>  'Graphical User Interface', 
:false_1 => 'Gimme Ur Internet', 
:false_2 => 'Grand User Interface', 
:false_3 => 'Graphical Useful Interface',
:question_number => 1)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'With inheritance, a derived sublcass object can be directly accessible by any ', 
:answer =>  'public superclass member', 
:false_1 => 'private superclass member', 
:false_2 => 'protected, public, or private superclass member', 
:false_3 => 'public or private superclass member',
:question_number => 2)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'An abstract class can have non-abstract methods.', 
:answer =>  'True', 
:false_1 => 'False', 
:false_2 => 'I don\'t know', 
:false_3 => 'I don\'t care',
:question_number => 3)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'Which of the following is not correct?', 
:answer =>  'Class and object are just different names for the same thing', 
:false_1 => 'A class needs to be instantiated as an object before being used', 
:false_2 => 'An object exists in memory in run time', 
:false_3 => 'An object is a variable, where its type is the class used to declare the variable',
:question_number => 4)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'The following code will result in which type of error: float num = 5/0', 
:answer =>  'Runtime Exception', 
:false_1 => 'Complilation error: DivideByZeroException', 
:false_2 => 'Complilation error: Divisions must be in a try block', 
:false_3 => 'No Error',
:question_number => 5)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'Java runs on ________', 
:answer =>  'All of the Above', 
:false_1 => 'Unix/Linix', 
:false_2 => 'Mac', 
:false_3 => 'Windows',
:question_number => 6)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'If none of the private/protected/public is specified for a member, that member ...', 
:answer =>  'is only accessible by other classes of the same package', 
:false_1 => 'is only accessible from within the class', 
:false_2 => 'is accessible publicly', 
:false_3 => 'is accessible by the class and its subclasses',
:question_number => 7)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'Which of the following is not a Java keyword?', 
:answer =>  'integer', 
:false_1 => 'main', 
:false_2 => 'String', 
:false_3 => 'try',
:question_number => 8)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'An object could be ...', 
:answer =>  'anything', 
:false_1 => 'an algorithm', 
:false_2 => 'a program', 
:false_3 => 'a data container',
:question_number => 9)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'A UML association is ...', 
:answer =>  'implemented as a Java attribute member', 
:false_1 => 'implemented as a Java method', 
:false_2 => 'implemented as a String constructor returning the name of the association targer', 
:false_3 => 'implemented as a sub-class',
:question_number => 10)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'What is essential in making sure that your loop is not infinite?', 
:answer =>  'That your boolean statement will at some point be false', 
:false_1 => 'That your boolean statement will at some point be true', 
:false_2 => 'That your boolean statement will be somewhere in your code', 
:false_3 => 'All of the above',
:question_number => 11)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'Which package do you need to use widgets such as JApplet, JFrame, JPanel, and JButton?', 
:answer =>  'javax.swing', 
:false_1 => 'java.swing', 
:false_2 => 'java.awt', 
:false_3 => 'javax.gui',
:question_number => 12)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'What does AWT stand for?', 
:answer =>  'Abstract window toolkit', 
:false_1 => 'Advanced wireless tools', 
:false_2 => 'Abstract window toolkit', 
:false_3 => 'Arranging with titles',
:question_number => 13)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'What is the size of a Char in Java?', 
:answer =>  '16 bits', 
:false_1 => '7 bits', 
:false_2 => '8 bits', 
:false_3 => '4 bits',
:question_number => 14)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 2, 
:question =>'Which one could be used as the main container in Java application?', 
:answer =>  'JFrame', 
:false_1 => 'JApplet', 
:false_2 => 'JButton', 
:false_3 => 'JPanel',
:question_number => 15)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'What is the keyword used in java to create an object?',
:answer =>  'new', 
:false_1 => 'this', 
:false_2 => 'sync', 
:false_3 => 'new()',
:question_number => 1)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'If you want your conditional to depend on two conditions BOTH being true, what is the proper notation to put between the two Boolean statements?',
:answer =>  '&&', 
:false_1 => '&', 
:false_2 => '|', 
:false_3 => '||',
:question_number => 2)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'Which of the following always need a Capital letter ?',
:answer =>  'class names and Strings', 
:false_1 => 'data types and fields', 
:false_2 => 'objects and class names', 
:false_3 => 'fields and Strings',
:question_number => 3)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'A member of a class is a ',
:answer =>  'attribute or method', 
:false_1 => 'a method', 
:false_2 => 'a sub-class', 
:false_3 => 'an attribute',
:question_number => 4)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'What is the difference between private and public functions ?',
:answer =>  'Public functions can be used by anyone, private can only be used by other code in the class you are writing', 
:false_1 => 'Public functions are  the only ones you can download', 
:false_2 => 'Public functions can be used by no one',
:false_3 => 'Public functions are free, you have to buy private ones',
:question_number => 5)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'The size of frame is set using ....',
:answer =>  'the method setSize()', 
:false_1 => 'automatically in run-time', 
:false_2 => 'the width and height attributes of the class JFrame', 
:false_3 => 'WIDTH and HEIGHT properties of the window menu in Eclipse',
:question_number => 6)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'How cna you prevent a member variable from becoming serialized?',
:answer =>  'by marking it transient', 
:false_1 => 'by marking it private', 
:false_2 => 'you can not do this', 
:false_3 => 'by marking it volitile',
:question_number => 7)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'Class B inherits from Class A, what cannot be said?',
:answer =>  'B has access to private members of A', 
:false_1 => 'A is a super-class of B', 
:false_2 => 'B is a sub-class of A', 
:false_3 => 'B has access to protected members of A',
:question_number => 8)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'The following prototype shows that a Cylinder subclass is derived from a superclass called Circle',
:answer =>  'class Cylinder extends Circle', 
:false_1 => 'class Circle derived Cylinder', 
:false_2 => 'class Circle extends Cylinder', 
:false_3 => 'class Cylinder derived Circle',
:question_number => 9)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'What is an instanceof?',
:answer =>  'An operator and a keyword', 
:false_1 => 'a method in an object', 
:false_2 => 'a keyword only', 
:false_3 => 'an operator only',
:question_number => 10)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'The last value in an array called ar can be found at index:',
:answer =>  'ar.length -1', 
:false_1 => 'ar.length', 
:false_2 => '0', 
:false_3 => '-1',
:question_number => 11)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'A null reference may be used to access a static variable or method.',
:answer =>  'False', 
:false_1 => 'True', 
:false_2 => 'I give up', 
:false_3 => 'Maybe',
:question_number => 12)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'What is the role of the constructor?',
:answer =>  'To create an instance of a class(an object)', 
:false_1 => 'To create some type of change in the state of an object', 
:false_2 => 'To create names for methods', 
:false_3 => 'To establish relationships between classes',
:question_number => 13)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'Which two of the following methods are defined in class Thread?
1. start()
2. wait()
3. notify()
4. run()
5. terminate()',
:answer =>  '1 and 4', 
:false_1 => '2 and 3', 
:false_2 => '2 and 4', 
:false_3 => '3 and 4',
:question_number => 14)

Quiz.create(
:category_name => 'softwareengineering',
:category_id => Category.find_by_name('softwareengineering').id,
:difficulty => 3, 
:question =>'Which of the following are Java reserved words?
1. run
2. import
3. default
4. implement',
:answer =>  '2 and 3', 
:false_1 => '1 and 2', 
:false_2 => '2 and 4', 
:false_3 => '3 and 4',
:question_number => 15)

puts 'successfully put Questions'
puts 'Add AdminTasks to DB'

AdminTask.create(:user_id => 1, 
	:request_type => "Site Issue", 
	:request => "There seems to be an issue whenever I log out of the site as an Admin. The sign out page errors out and I am not longer able to sign back in. Please help me, I need to add a quiz for tomorrow!")

AdminTask.create(:user_id => 1,
	:request_type => "Question Review",
	:request => "7,8,9")

AdminTask.create(:user_id => 1,
	:request_type => "Quiz Review",
	:request => "Quiz #2 for Calculus does not seem to be functioning correctly, please take a look")

AdminTask.create(:user_id => 5,
	:request_type => "Add Feature",
	:request => "As a user I would like to review some statistics on how I compare to my fellow students!")

AdminTask.create(:user_id => 5,
	:request_type => "Quiz Review",
	:request => "Quiz #1 for EPS does not seem to be functioning correctly, please take a look")

AdminTask.create(:user_id => 5,
	:request_type => "Quiz Review",
	:request => "Quiz #2 for EPS does not seem to be functioning correctly, please take a look")

AdminTask.create(:user_id => 5,
	:request_type => "Question Review",
	:request => "15,16")

AdminTask.create(:user_id => 12, 
	:request_type => "Site Issue", 
	:request => "Whenever I hit the back button in a quiz it take me back to another quiz question but it is not the same question as before!")

AdminTask.create(:user_id => 12,
	:request_type => "Question Review",
	:request => "30,31,32")