FactoryGirl.define do
  factory :text do
    text "Hello, world!"

    factory :uppercase do
      text "HELLO, WORLD!"
    end

    factory :lowercase do
      text "hello, world!"
    end
  end
end