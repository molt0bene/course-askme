require 'cgi'
require 'active_support'

def verify_and_decrypt_session_cookie(cookie, secret_key_base = Rails.application.secret_key_base)
  cookie = CGI::unescape(cookie)
  salt   = 'authenticated encrypted cookie'
  encrypted_cookie_cipher = 'aes-256-gcm'
  serializer = ActiveSupport::MessageEncryptor::NullSerializer

  key_generator = ActiveSupport::KeyGenerator.new(secret_key_base, iterations: 1000)
  key_len = ActiveSupport::MessageEncryptor.key_len(encrypted_cookie_cipher)
  secret = key_generator.generate_key(salt, key_len)
  encryptor = ActiveSupport::MessageEncryptor.new(secret, cipher: encrypted_cookie_cipher, serializer: serializer)

  encryptor.decrypt_and_verify(cookie)
end

puts "Получаем сессию в Rails 5"

puts "Вставьте куку, которую надо расшифровать:"
cookie = gets.chomp

puts "Вставьте ключ"
secret_key_base = gets.chomp

result = verify_and_decrypt_session_cookie(cookie, secret_key_base)

puts result.inspect
