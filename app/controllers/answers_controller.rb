post '/answers' do
  @answer = Answer.new(params[:answer])
  @answer.user_id = current_user.id
  if @answer.save
    puts "HELLOOOO"
    redirect "questions/#{params[:answer][:question_id]}"
  else
    @errors = @answer.errors.full_messages
    @question = Question.find(params[:answer][:question_id])
    erb 'questions/show'
  end
end
