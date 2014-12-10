enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end

post '/signup' do
  @user = User.create(params[:user])

  erb :success
end

post '/login' do
  if @user ==nil
    redirect to ('/error')
  else
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    session[:lastname] = @user.lastname
    redirect to ('/secretpage')
  end
end

get '/secretpage' do
  if session[:lastname] == nil
    redirect to ('/')
  end

  erb :secretpage
end

get '/error' do

  erb :error
end

get '/logout' do
  session[:lastname] = nil
  redirect to ('/')
end

