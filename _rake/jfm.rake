require 'fileutils'

namespace :jfm do

  desc "Upload weblog to Amazon S3"
  task :s3 do
    system "s3cmd sync _site/ s3://www.jmesnil.net/"
  end

  # Usage: rake post title="A Title" [date="2012-02-09"]
  desc "Begin a new post in #{CONFIG['posts']}"
    task :post do
      abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])
      title = ENV["title"] || "new-post"
      slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      begin
        date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
        datetime = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d %H:%M:%S')
      rescue Exception => e
        puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
        exit -1
      end
    filename = File.join(CONFIG['posts'], "#{date}-#{slug}.#{CONFIG['post_ext']}")
    if File.exist?(filename)
      abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
    end
  
    puts "Creating new post: #{filename}"
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: post"
      post.puts "title: \"#{title.gsub(/-/,' ')}\""
      post.puts "date: '#{datetime}'"
      post.puts "category: "
      post.puts "tags: []"
      post.puts "---"
    end
  end # task :post
end
