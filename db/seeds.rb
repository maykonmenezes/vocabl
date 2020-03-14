languages = LanguageList::COMMON_LANGUAGES.map(&:name)
Language.create(languages.map { |language| { name: language } })
