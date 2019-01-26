class Address < ApplicationRecord
  # optional: trueで外部キーのnilを許可している。ユーザーと住所を同時に登録するので必要。
  belongs_to :user, optional: true
end
