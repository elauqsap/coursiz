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
Category.create( :real_name => 'Statistics', :name => 'Statistics')

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

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 2, 
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
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 2, 
:question =>'Other things being equal, which of the following actions will reduce the power of a hypothesis test?	I. Increasing sample size.	II. Increasing significance level.	III. Increasing beta, the probability of a',
:answer =>  'III only', 
:false_1 => 'II only', 
:false_2 => 'I only', 
:false_3 => 'All of the above',
:question_number => 2)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 2, 
:question =>'Suppose a researcher conducts an experiment to test a hypothesis. If she doubles her sample size, which of the following will increase?	I. The power of the hypothesis test.	II. The effect size of the hypothesis test.	III. The probability of making a Type II error. ',
:answer =>  'I only', 
:false_1 => 'II only', 
:false_2 => 'III only', 
:false_3 => 'All of the above',
:question_number => 3)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 2, 
:question =>'In hypothesis testing, which of the following statements is always true?	I. The P-value is greater than the significance level.	II. The P-value is computed from the significance level.	III. The P-value is the parameter in the null hypothesis.	IV. The P-value is a test statistic.	V. The P-value is a probability.',
:answer =>  'V only', 
:false_1 => 'II only', 
:false_2 => 'III only', 
:false_3 => 'All of the above',
:question_number => 4)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 2, 
:question =>'Which of the following is not one of the solution steps for a One-tailed Test?',
:answer =>  'Compare data', 
:false_1 => 'Formulate an analysis plan', 
:false_2 => 'Analyze sample data', 
:false_3 => 'Interpret results',
:question_number => 5)



Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 3, 
:question =>'A major metropolitan newspaper selected a simple random sample of 1,600 readers from their list of 100,000 subscribers. They asked whether the paper should increase its coverage of local news. Forty percent of the sample wanted more local news. What is the 99% confidence interval for the proportion of readers who would like more coverage of local news?', 
:answer =>  '0.37 to 0.43', 
:false_1 => '0.35 to 0.45', 
:false_2 => '0.32 to 0.48 ', 
:false_3 => '0.30 to 0.50 ',
:question_number => 1)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 3, 
:question =>'Suppose the Cartoon Network conducts a nation-wide survey to assess viewer attitudes toward Superman. Using a simple random sample, they select 400 boys and 300 girls to participate in the study. Forty percent of the boys say that Superman is their favorite character, compared to thirty percent of the girls. What is the 90% confidence interval for the true difference in attitudes toward Superman?', 
:answer =>  '4 to 16 percent more boys prefer Superman', 
:false_1 => '0 to 20 percent more boys prefer Superman', 
:false_2 => '2 to 18 percent more boys prefer Superman', 
:false_3 => '6 to 14 percent more boys prefer Superman',
:question_number => 2)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 3, 
:question =>'Suppose a simple random sample of 150 students is drawn from a population of 3000 college students. Among sampled students, the average IQ score is 115 with a standard deviation of 10. What is the 99% confidence interval for the students IQ score? ',
:answer =>  '115 + 2.1 ', 
:false_1 => '115 + 0.01', 
:false_2 => '115 + 0.82 ', 
:false_3 => '115 + 2.6 ',
:question_number => 3)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 3, 
:question =>'Suppose that simple random samples of college freshman are selected from two universities - 15 students from school A and 20 students from school B. On a standardized test, the sample from school A has an average score of 1000 with a standard deviation of 100. The sample from school B has an average score of 950 with a standard deviation of 90. What is the 90% confidence interval for the difference in test scores at the two schools, assuming that test scores came from normal distributions in both schools? (Hint: Since the sample sizes are small, use at score as the critical value.)', 
:answer =>  '50 + 55.66 ', 
:false_1 => '50 + 32.74', 
:false_2 => '50 + 28.49 ', 
:false_3 => '50 + 1.70 ',
:question_number => 4)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 3, 
:question =>'The local baseball team conducts a study to find the amount spent on refreshments at the ball park. Over the course of the season they gather simple random samples of 50 men and 100 women. For men, the average expenditure was $20, with a standard deviation of $3. For women, it was $15, with a standard deviation of $2.What is the 99% confidence interval for the spending difference between men and women? Assume that the two populations are independent and normally distributed', 
:answer =>  '$5 + $1.21', 
:false_1 => '$5 + $0.47', 
:false_2 => '$5 + $2.58', 
:false_3 => '$5 + $5.00',
:question_number => 5)


Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 1, 
:question =>'In a nationwide survey, suppose 100 boys and 50 girls are sampled. What is the probability that the male sample will have at most three more days of absences than the female sample?', 
:answer =>  '0.035', 
:false_1 => '0.025', 
:false_2 => '0.055', 
:false_3 => '0.045',
:question_number => 1)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 1, 
:question =>'Which of the following statements is true.	I. When the margin of error is small, the confidence level is high.	II. When the margin of error is small, the confidence level is low.	III. A confidence interval is a type of point estimate.	IV. A population mean is an example of a point estimate.', 
:answer =>  'None of the Ablove', 
:false_1 => 'All of the above', 
:false_2 => 'I, II, and IV', 
:false_3 => 'III only',
:question_number => 2)


Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 1, 
:question =>'Which of the following statements is true.	I. The standard error is computed solely from sample attributes.	II. The standard deviation is computed solely from sample attributes.	III. The standard error is a measure of central tendency.', 
:answer =>  'I only', 
:false_1 => 'II only', 
:false_2 => 'III only', 
:false_3 => 'All of the Above',
:question_number => 3)


Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 1, 
:question =>'Nine hundred (900) high school freshmen were randomly selected for a national survey. Among survey participants, the mean grade-point average (GPA) was 2.7, and the standard deviation was 0.4. What is the margin of error, assuming a 95% confidence level?', 
:answer =>  '0.025', 
:false_1 => '0.013', 
:false_2 => '1.960', 
:false_3 => '0.500',
:question_number => 4)

Quiz.create(
:category_name => 'Statistics',
:category_id => 2,
:difficulty => 1, 
:question =>'Suppose we want to estimate the average weight of an adult male in Dekalb County, Georgia. We draw a random sample of 1,000 men from a population of 1,000,000 men and weigh them. We find that the average man in our sample weighs 180 pounds, and the standard deviation of the sample is 30 pounds. What is the 95% confidence interval.', 
:answer =>  '180 + 1.86 ', 
:false_1 => '180 + 3.0', 
:false_2 => '180 + 5.88', 
:false_3 => '180 + 30',
:question_number => 5)




puts 'successfully put Questions'

