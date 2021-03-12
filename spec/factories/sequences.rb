FactoryBot.define do
  sequence :uuid do |n|
    SecureRandom.uuid
  end
end
