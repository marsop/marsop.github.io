require 'minitest/autorun'
require 'jekyll'
require_relative '../_plugins/img-tag-transform'

class MockPost
  attr_accessor :content, :extname

  def initialize(content, extname = '.md')
    @content = content
    @extname = extname
  end
end

class TestImgTagTransform < Minitest::Test
  def test_replaces_image_tags_in_markdown
    post = MockPost.new("Here is an image: ![alt text](image.png)")
    payload = {
      'site' => {
        'markdown_ext' => 'md,markdown'
      }
    }

    Jekyll::Hooks.trigger :posts, :pre_render, post, payload

    assert_equal "Here is an image: {% responsive_image path: image.png alt: alt text  %}", post.content
  end

  def test_does_not_replace_in_non_markdown
    post = MockPost.new("Here is an image: ![alt text](image.png)", '.html')
    payload = {
      'site' => {
        'markdown_ext' => 'md,markdown'
      }
    }

    Jekyll::Hooks.trigger :posts, :pre_render, post, payload

    assert_equal "Here is an image: ![alt text](image.png)", post.content
  end

  def test_multiple_images
    post = MockPost.new("![alt1](img1.png) and ![alt2](img2.jpg)")
    payload = {
      'site' => {
        'markdown_ext' => 'md'
      }
    }

    Jekyll::Hooks.trigger :posts, :pre_render, post, payload

    assert_equal "{% responsive_image path: img1.png alt: alt1  %} and {% responsive_image path: img2.jpg alt: alt2  %}", post.content
  end
end
