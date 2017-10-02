# URL redirection

Консольное ruby-приложение для анализа URL на наличие редиректа. 
Проверка осуществляется с помощью проверки получаемого кода ответа (301 и 302) и наличия  header "Location".
Кроме самой проверки на редирект, также выполняются проверки на валидность url, на наличие интеренет соединения, на наличие интеренет соединения до хоста.   
   
## Запуск

1. Устанавливаем необходимые зависимости через [bundler](http://bundler.io):
   ```
   cd /path/to/project/dir
   bundle install
   ```
     
1. Запуск без параметров (используется url по-умолчанию):
   ```
   ruby redirect.rb
   ```
   
1. Запуск с указанием url:
   ```
   ruby redirect.rb google.com
   ```   