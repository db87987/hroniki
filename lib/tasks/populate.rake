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
end


