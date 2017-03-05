if @message.errors.blank?
  json.(@message, :created_at, :text, :image)
  json.name @message.user.name
else
  json.error @message.errors.full_messages do |message|
    json.message message
  end
end
