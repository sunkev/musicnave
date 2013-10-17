json.array!(@messages) do |message|
  json.body message.body
  json.recipient_id message.recipient_id
  json.sender_id message.sender_id
  json.recipient_name message.recipient.full_name
  json.photo message.recipient.photo
end