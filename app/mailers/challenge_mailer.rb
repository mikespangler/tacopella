class ChallengeMailer < ActionMailer::Base
  default from: "tacopella.app@gmail.com"

  def invite_friends(sender, receivers, challenge)
    @challenge = challenge
    @sender = sender
    mail(to: Proc.new { receivers },  subject: "Your friend sent you a song challenge!")
  end
end
