class Book
  include DataMapper::Resource
  property :id, Serial
  property :title, String, required: true
  property :author, String
  property :pages, Integer
end