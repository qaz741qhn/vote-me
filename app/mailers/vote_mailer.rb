class VoteMailer < ApplicationMailer
  def vote_notify(email)
    mail to: email, subject: 'Voted!'
  end
end
