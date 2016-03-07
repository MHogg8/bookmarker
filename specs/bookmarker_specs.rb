require('minitest/autorun')
require('minitest/rg')
require_relative('../models/bookmarker')

class TestBookMarker < MiniTest::Test

  def setup
    params = {
        'name' => 'Google',
        'url' => 'www.google.com',
        'genre' => 'Search Engine',
        'description' => 'Find information on absolutely anything ever!'
          }

     @bookmark = Bookmarker.new(params)

  end

  def test_name
    assert_equal('Google', @bookmark.name)
  end

  def test_url
    assert_equal('www.google.com', @bookmark.url)
  end

  def test_genre
    assert_equal('Search Engine', @bookmark.genre)
  end

  def test_description
    assert_equal('Find information on absolutely anything ever!', @bookmark.description)
  end

end