json.messages @messages do |msg|
  json.created_at msg.created_at
  json.text  msg.text
  json.image msg.image
  json.name  msg.user.name
end
