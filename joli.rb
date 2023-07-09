require 'net/http'

url = URI.parse('https://www.jolicloset.com/fr/client/listItems')

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

request = Net::HTTP::Post.new(url.request_uri)
request['Accept'] = 'application/json, text/plain, */*'
request['User-Agent'] = 'KittBar/1.0'
request['Cookie'] = '{ "uuid": "1.7xXeY3SD5UUqSyDo3R58S9an4W9BJPzzvtm7jppIy2RmlgYYE82g4hCYt9gSrZfOMtHNBrFKuZoczNoKHuDtwtqAUhJIkHj57bP1ZG39EOJZlXACuuQgLtrT", "version": 3, "domain": "jolicloset.com", "ts": 1686853012693 }'

response = http.request(request)

# Process the response as needed
puts response.body
