require('pg')
class Bookmarker

attr_reader :id, :name, :url, :genre, :description

  def initialize (params)
    @id = nil || params['id']
    @name = params['name']
    @url = params['url']
    @genre = params['genre']
    @description = params['description']

  end

  def save
    sql = "INSERT INTO bookmark (name, url, genre, description) VALUES
          ('#{name}', '#{url}', '#{genre}', '#{description}')"
    Bookmarker.run_sql(sql)      
  end


  def self.all
    bookmarks = Bookmarker.run_sql("SELECT * FROM Bookmark")
    result = bookmarks.map {|bookmark| Bookmarker.new(bookmark) }
    return result
  end

  def self.select(id)
    bookmark = Bookmarker.run_sql("SELECT * FROM bookmark WHERE id = #{id}")
    result = Bookmarker.new(bookmark[0])
    return result
  end

  def self.update(params)
    sql = "UPDATE bookmark SET
    name = '#{params['name']}',
    url = '#{params['url']}',
    genre = '#{params['genre']}',
    description = '#{params['description']}'"
    Bookmarker.run_sql(sql)
  end

  def self.destroy(id)
    Bookmarker.run_sql("Delete FROM bookmark WHERE id = #{id}")
  end


private

  def self.run_sql(sql)
    begin
      db= PG.connect({dbname: 'bookmarks', host:'localhost'})
      result = db.exec(sql)
      return result
    ensure
      db.close
    end
  end




end