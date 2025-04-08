class PostsController < ApplicationController
  require 'json'
  require 'open-uri'

  def index
    url = 'https://hacker-news.firebaseio.com/v0/topstories.json'
    lists_serialized = URI.parse(url).read
    lists = JSON.parse(lists_serialized).first(15)

    @posts = []

    lists.each do |id|
      post_url = "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
      post_serialized = URI.parse(post_url).read
      result = JSON.parse(post_serialized)

      @posts << result
    end

    @posts.sort_by! do |post|
      post['score'].to_i
    end
  end

  def show
    post_id = params[:id]

    post_url = "https://hacker-news.firebaseio.com/v0/item/#{post_id}.json"
    post_serialized = URI.parse(post_url).read
    @post = JSON.parse(post_serialized)
  end
end
