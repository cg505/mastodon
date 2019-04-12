# frozen_string_literal: true

class OCFUsernameValidator < ActiveModel::Validator
  def validate(account)
    return if !account.local? || account.user.confirmed?
    if account.user.email != "#{account.username}@ocf.berkeley.edu"
      account.errors.add(:username, "Your Mastodon username should match your OCF username. If you'd like to use another username, please send a request to help@ocf.berkeley.edu.")
    end
  end
end
