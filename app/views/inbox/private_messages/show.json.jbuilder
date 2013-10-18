json.array!(@messages) do |message|
  json.body message.body
  json.recipient_id message.recipient_id
  json.recipient_name message.recipient.full_name
  json.recipient_photo message.recipient.photo.url
  json.sender_id message.sender_id
  json.sender_name message.sender.full_name
  json.sender_photo message.sender.photo.url
end