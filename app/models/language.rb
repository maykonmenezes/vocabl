class Language < ApplicationRecord
  validates :name, presence: true,
  validates inclusion: { in: LanguageList::COMMON_LANGUAGES.map(&:name) }
end
