module HashtagsHelper
  def tags_to_links(string_hashtags)
    string_hashtags.map { |tag| link_to(tag, hashtag_path(tag)) }.join(", ")
  end
end
