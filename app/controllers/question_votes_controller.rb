# get '/questions/:question_id/votes/new' do
#   @question = Question.find(params[:question_id])
#   erb :'votes/_question_vote'
# end

post '/questions/:question_id/votes' do
  p '****' * 30
  p params
  p params[:question_id]
  p '****' * 30
  @question = Question.find(params[:question_id])
  @vote = Vote.find_by(voteable: @question, user: current_user, vote_value: 1)
  if @vote
    @vote.destroy
  else
    Vote.create(voteable: @question, user: current_user, vote_value: 1)
  end
  redirect "/questions/#{@question.id}"
end

delete '/questions/:question_id/votes' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.find_by(user_id: current_user, vote_value: -1)
  if @vote
    @vote.destroy
  else
    Vote.create(voteable: @question, user: current_user, vote_value: -1)
  end
  redirect "/questions/#{@question.id}"
end
