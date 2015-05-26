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
   
   if @first > 0.0
    @result = Math.sqrt(@first).to_f
   end 
    erb :square
  end  

  get '/bmi' do
    @weight = params[:weight].to_f
    if @weight > 0.0
      @height = params[:height].to_f
      @result = @weight/(@height * @height).to_f
    end  
  erb :bmi
  end  

  get '/mortgage' do
    @principal = params[:principal].to_f 
    @interest = params[:interest].to_f
    @months = params[:months].to_i
    
  

    @result = (@principal * (@interest * (1 + @interest)**@months) / ((1+@interest)**@months - 1)).round(2)
    
    erb :mortgage
  end  
  get '/trip' do
    @distance = params[:distance].to_f
    
    if @distance > 0.0
    @speed = params[:speed].to_f
    @mpg =params[:mpg].to_f
    @price = params[:price].to_f

    @hours = @distance/@speed
    @cost = (@distance/@mpg)*@price
  end

  erb :trip
end
