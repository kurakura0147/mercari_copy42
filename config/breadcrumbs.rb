  # Root crumb
crumb :root do
  link "メルカリ", root_path
end
# => アイテム詳細(items/id)
crumb :item_show do |item|
  link "#{item.name}", new_transaction_path
  parent :root
end
crumb :user do
  link "マイページ", user_path(id: current_user.id)
  parent :root
end
crumb :user_signout do
  link "ログアウト", root_path
  parent :user
end
crumb :user_edit do
  link "本人情報の登録", edit_user_registration_path
  parent :user
end
crumb :user_card do
  link "支払い方法", credit_cards_path
  parent :user
end
crumb :card_edit do
  link "クレジットカード情報の入力", user_path(id: current_user.id)
  parent :user_card
end
crumb :user_profile do
  link "プロフィール", user_path
  parent :user
end
