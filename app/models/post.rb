class Post < ApplicationRecord
  enum :kind, { announcement: "announcement", article: "discussion" }
end
