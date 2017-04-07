# get '/questions/:question_id/votes/new' do
#   @answer = Answer.find(params[:question_id])
#   erb :'votes/_answer_vote'
# end

post '/answers/:answer_id/votes' do
  @answer = Answer.find(params[:answer_id])
  @vote = Vote.find_by(voteable: @answer, user: current_user, vote_value: 1)
  if @vote
    @vote.destroy
  else
    Vote.create(voteable: @answer, user: current_user, vote_value: 1)
  end
  redirect "/questions/#{@answer.question.id}"
end

delete '/answers/:answer_id/votes' do
  @answer = Answer.find(params[:answer_id])
  @vote = @answer.votes.find_by(user_id: current_user, vote_value: -1)
  if @vote
    @vote.destroy
  else
    Vote.create(voteable: @answer, user: current_user, vote_value: -1)
  end
  redirect "/questions/#{@answer.question.id}"
end
