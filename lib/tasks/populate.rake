# coding: utf-8

require 'csv'
require 'faker'
require 'populator'

namespace :db do
  task :import_hroniks => :environment do
    
    Hronik.destroy_all
    
    Hronik.populate 30 do |hronik|
      hronik.title = Faker::Lorem.words(1)[0].capitalize
      hronik.date = Date.today + rand(200)
      hronik.text = Populator.sentences(30..50)
      hronik.watched = 0
      hronik.comments_qty = 0
    end
    Hronik.all.each { |hronik| hronik.tags << Tag.all.sample; hronik.save! }
    Hronik.all.each { |hronik| hronik.cover = File.open(Dir.glob(File.join(Rails.root, 'covers', '*')).sample); hronik.save! }
    
    puts "Hroniks created!"
    
  end
  
  task :import_tags => :environment do
    
    Tag.destroy_all
    
    Tag.populate 10 do |tag|
      tag.title = Faker::Lorem.words(1)[0].capitalize
    end
    
    puts "Tags created!"
    
  end
  
  task :import_issues => :environment do
    
    Issue.destroy_all
    
    Issue.populate 10 do |issue|
      issue.title = Faker::Lorem.words(1)[0].capitalize
      issue.date = Date.today + rand(200)
    end
    
    Issue.all.each { |issue| issue.image = File.open(Dir.glob(File.join(Rails.root, 'covers', '*')).sample); issue.save! }
    
    puts "Issues created!"
    
  end
  
  task :import_articles => :environment do
    
    Article.destroy_all
    
    Article.populate 30 do |article|
      article.title = Faker::Lorem.words(1)[0].capitalize
      article.date = Date.today + rand(200)
      article.text = Populator.sentences(30..50)
      article.comments_qty = 0
    end
    Article.all.each { |article| article.tags << Tag.all.sample; article.save! }
    Article.all.each { |article| article.image = File.open(Dir.glob(File.join(Rails.root, 'covers', '*')).sample); article.save! }
    
    puts "Articles created!"
    
  end
  
  task :import_olds => :environment do
    
    Old.destroy_all
    
    Old.populate 30 do |old|
      old.title = Faker::Lorem.words(1)[0].capitalize
      old.date = Date.today + rand(200)
      old.text = Populator.sentences(30..50)
      old.issue_id = Issue.all.sample.id
      old.comments_qty = 0
    end
    Old.all.each { |old| old.tags << Tag.all.sample; old.save! }
    Old.all.each { |old| old.image = File.open(Dir.glob(File.join(Rails.root, 'covers', '*')).sample); old.save! }
    
    puts "Olds created!"
    
  end
end


