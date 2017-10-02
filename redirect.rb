require 'faraday'
require 'net/ping'
require 'socket'
require 'uri'

# Пинг по указанному url
def ping(url)
  Net::Ping::External.new(url).ping?
end

# Проверка на доступность хоста
def check_host(url)
  begin
    ip = IPSocket::getaddress(url)
    unless ping(ip)
      return true
    end
  rescue
    return true
  end
end

# Проверка на наличие корректного подключения к сети
def self.check_network
  begin
    unless ping('google.com') && ping('yandex.ru')
      return true
    end
  rescue
    return true
  end
end

# Проверка на валидность url
def check_url(url)
  unless 'http://' + url =~ URI::regexp
    return true
  end
end

# Проверка на наличие редиректа по указанной url
def check_redirect(url)
  res = Faraday.head('http://' + url)
  puts "Responce code: #{res.status}"
  if res.status == 301 || res.status == 302 || res.headers['Location'].nil?
    puts "Location: #{res.headers['Location']}" unless res.headers['Location'].nil?
    puts 'Redirect from page is detected'
  else
    puts 'Redirect from page is not detected'
  end
end

def run(url)
  return puts "Incorrect url! Try another url" if check_url(url)
  return puts "Problem with network connection!" if check_network
  return puts "Problem with host connection!" if check_host(url)
  check_redirect(url)
end

# Если не получаем аргумент из консоли - берем значение по-умолчанию
ARGV[0] = 'onetwotrip.com' if ARGV[0].nil?
run(ARGV[0])
