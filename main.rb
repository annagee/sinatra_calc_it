require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do
  @operator = params[:operator]
    if @operator
     @first = params[:first].to_f
     @second = params[:second].to_f
     
     @result = case @operator
      when '+' then @first + @second
      when '-' then @first - @second
      when '*' then @first * @second
      when '/' then @first / @second
      end 
  end     
  erb :home
end

 get '/power' do
  @first = params[:first].to_f

  if @first
    @second = params[:second].to_f
    @result = @first ** @second
  end
  erb :power
end  

  get '/square' do
    @first = params[:first].to_f
   
   if @first
    @result = Math.sqrt(@first).to_f
   end 
    erb :square
  end  

  get '/bmi' do
    @weight = params[:weight].to_f
    if @weight
      @height = params[:height].to_f
      @result = @weight/(@height * @height).to_f
    end  
  
  erb :bmi
  end  

  # Your BMI is #{weight_m/(height_m**2)}"


