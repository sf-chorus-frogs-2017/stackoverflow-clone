get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:email], params[:password])
    session[:id] = @user.id
    redirect '/'
  else
    @errors = ["The email or password is incorrect."]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
