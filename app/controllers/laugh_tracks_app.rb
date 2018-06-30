class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params.include?(:age)
      @comedians = Comedian.where(age:params[:age]).includes(:specials)
    else
      @comedians = Comedian.all.includes(:specials)
    end
    @average_age = @comedians.average(:age)
    erb :'/comedians/index'
  end
end
