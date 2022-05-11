class BookCreator
  def initialize(title:, description:, author_id:, genre_id:)
    @title = title
    @description = description
    @author_id = author_id
    @genre_id = genre_id
  end


  def create_book
    Book.create!(
      title: @title,
      description: @description,
      author_id: @author_id,
      genre_id: @genre_id 
    )
    rescue ActiveRecord::RecordNotUnique => e
    
  end
end