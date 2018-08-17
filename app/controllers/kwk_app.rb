class KwkApp < Sinatra::Base
  
  use Rack::Session::Cookie, :key => 'rack.session'

  get '/' do
    erb :"index"
  end
  
  get '/question_one' do
    erb :"questions/question_one"
  end
  
  get '/environment' do
    erb :"environment"
  end
  
  get '/gender_equality' do
    erb :"gender_equality"
  end
  
  get '/wealth' do
    erb :"wealth"
  end
  
  get '/rm_environment' do
    erb :"rm_environment"
  end
  
  get '/rm_gender' do
    erb :"rm_gender"
  end 
  
  get '/rm_wealth' do
    erb :"rm_wealth"
  end 
  
  
  post '/question_one' do #telling it to do a post action 
    answer_one = params[:question_one] #save user's answer (saying the answer is the value for this key in the parameter)
    session[:answers] = {}
    session[:answers][:question_one] = answer_one #add user's answer to session hash (by saying the key = the value) session is a hash that stores keys and values throughout the whole session
    redirect "/question_two" #redirect to controller action
  end
  
  get '/question_two' do 
    erb :"questions/question_two"
  end
  
  post '/question_two' do 
    answer_two = params[:question_two]
    session[:answers][:question_two] = answer_two 
    redirect "/question_three"
  end 
  
  get '/question_three' do
    erb :"questions/question_three"
  end

  post '/question_three' do
    answer_three = params[:question_three]
    session[:answers][:question_three] = answer_three 
    redirect "/question_four"
  end
    
  get '/question_four' do
    erb :"questions/question_four"
  end
  
  post '/question_four' do 
    answer_four = params[:question_four]
    session[:answers][:question_four] = answer_four 
    redirect "/question_five" 
  end 
    
  get '/question_five' do 
    erb :"questions/question_five"
  end 
  
  post '/question_five' do
    answer_five = params[:question_five]
    session[:answers][:question_five] = answer_five
    
    environment = 0
    wealth = 0 
    gender = 0 

    session[:answers].each do |question_number, answer|
      if answer == "environment" 
         environment = environment + 1
      elsif answer == "wealth-distribution" 
        wealth = wealth + 1 
      elsif answer == "gender-inequality"
        gender = gender + 1
      end 
    end 
    
  
    if environment >= wealth && environment >= gender
      session[:answers][:result] = "Based on the quiz, you are interested in environmental causes. Please continue to the environment section under organizations."
    elsif wealth >= environment && wealth >= gender 
      session[:answers][:result] = "Based on the quiz, you are interested in issues regarding wealth distribution. Please continue to the wealth distribution section under organizations."
    elsif gender >= wealth && gender >= environment 
      session[:answers][:result] = "Based on the quiz, you are interested in social justice issues, such as gender equality. Please continue to the gender equality section under organizations." 
    end
    redirect "/result"
  end  
  
    get "/result" do 
      @result = session[:answers][:result]
      erb :"result"
    end 
    
end
  
  
      
      # 3 variables
      # environment = 0
      # wealth = 0
      # gender = 0
      # if answer == 'environment'
        #add 1 to our environment variable
      # elsif answer == 'wealth'
        #add 1 to our wealth variable
      # elsif answer == 'gender'
        #add 1 to our gender variable
      #end if statement
    
    
    #environment = 3
    # wealth = 1
    # gender = 1
    
    # if environment > wealth AND environment > gender
      # @result = write string of personalized message
    # repeat above step for wealth and environment
