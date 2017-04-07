get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login_user
  else
    @errors = ["Missing registration info"]
    erb :'users/new'
  end
end

