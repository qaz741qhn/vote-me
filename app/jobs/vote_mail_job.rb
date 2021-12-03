class VoteMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    VoteMailer.vote_notify('qaz741qhn@gmail.com').deliver
  end
end
