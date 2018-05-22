# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

me = User.create(:first_name => "Noah", :last_name => "Burwell", :username => "nburwell", :email => "domnoa15@evergreen.edu", :password => "my_password")

Subject.create(name: "Games", position: 1, :visible => true)
Subject.create(name: "Food", position: 2, :visible => true)
Subject.create(name: "Books", position: 3)

page_one = Page.new(name: "Pong", permalink: "pong", position: 1, :visible => true) 
page_one.subject = Subject.find(1)
page_one.user = me
page_one.save
 

page_two = Page.new(name: "Halo", permalink: "halo", position: 2)
page_two.subject = Subject.find_by(:name => "Games")
page_two.user = me
page_two.save

page_three = Page.new(name: "Apple", permalink: "apple", position: 3)
page_three.subject = Subject.find_by(:name => "Food")
page_three.user = me
page_three.save

page_four = Page.new(:subject => Subject.find(2), :user => me, name: "Banana", permalink: "banana", position: 4, :visible => true) 
page_four.save

Page.create(:subject => Subject.find_by(:name => "Books"), :user => me, name: "Name of the Wind", permalink: "name_of_the_wind", position: 5, :visible => true) 

Section.create(:page => Page.find_by(:name => "halo"), :name => "Section 1", :position => 1, :visible => true)

SectionEdit.create(:user => me, :section => Section.find(1), :summary => "First Edit")

