user_1 = User.create(email: 'user1@test.com', password: 'password', password_confirmation: 'password')

languages = LanguageList::COMMON_LANGUAGES.map(&:name)
Language.create(languages.map { |language| { name: language } })

english = Language.find_by(name: "English")
portuguese = Language.find_by(name: "Portuguese")
words = ContemporaryWords::all

10.times do
   word = Word.create(content: words.sample, language: english, user: user_1)
   word.translations << Word.create(content: words.sample, language: portuguese, user: user_1)
end
