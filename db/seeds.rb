user_1 = User.create(email: 'user1@test.com', password: 'password', password_confirmation: 'password')

languages = LanguageList::COMMON_LANGUAGES.map(&:name)
Language.create(languages.map { |language| { name: language } })

english = Language.find_by(name: "English")
words = ContemporaryWords::all

10.times do
   Word.create(content: words.sample, language: english, user: user_1)
end
