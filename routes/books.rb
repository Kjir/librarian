get '/api/books' do
  Book.all.to_json
end

get '/api/books/:id' do |id|
  book = Book.get(id)
  halt 404 if book.nil?
  book.to_json
end

post '/api/books' do
  data = JSON.parse request.body.read
  book = Book.create({
    title: data['title'],
    author: data['author'],
    pages: data['pages']
  })

  [201, book.to_json]
end

put '/api/books/:id' do |id|
  book = Book.get(id)
  halt 404 if book.nil?
  data = JSON.parse request.body.read
  halt 500, "Can't update book" unless book.update({
    title: data['title'],
    author: data['author'],
    pages: data['pages']
  })
  book.to_json
end

delete '/api/books/:id' do |id|
  book = Book.get(id)
  halt 404 if book.nil?
  unless book.destroy
    halt 500, "Couldn't remove book"
  end
end
