class ChallengeMailer < ActionMailer::Base
  default from: "tacopella.app@gmail.com"

  def invite_friends(sender, receiver, challenge)
    @challenge = challenge
    @sender = sender
    mail(to: receiver,  subject: "Your friend sent you a song challenge!")
  end
end
