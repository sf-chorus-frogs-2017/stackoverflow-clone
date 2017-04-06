# display all questions
get '/questions' do
  erb :'/questions/index'
end

# New question form
get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question && @question.save
    redirect "/questions/#{question_id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

# Displays a specific question
get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  erb :'/questions/show'
end

# Edit question form
get '/questions/:question_id/edit' do
  @question = Question.find(params[:question_id])
  erb :'/questions/edit'
end

# Edits a question
put '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @question.assign_attributes(params[:question])
  if @question && @question.save
    redirect "/questions/#{question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/edit'
  end
end

# Deletes a question
delete '/questions/:question_id' do
  Question.find(params[:question_id]).destroy
  redirect '/questions'
end

