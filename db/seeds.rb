# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create!(
  title: 'CoffeeScript',
  description:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
        functionality wrapped in a cleaner, more succinct syntax. In the first
        book on this exciting new language, CoffeeScript guru Trevor Burnham
        shows you how to hold onto all the power and flexibility of JavaScript
        while writing clearer, cleaner, and safer code.
      </p>},
  image_url: 'cs.jpg',
  price: 36.00
)

Product.create!(
  title: 'Programming Ruby 1.9 & 2.0',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  image_url: 'cs.jpg',
  price: 36.00
)

Product.create!(
  title: 'Programming Elixir',
  description:
    %{<p>
        You want to explore functional programming, but are put off by the 
        academic feel (tell me about monads just one more time). You know 
        you need concurrent applications, but also know these are almost 
        impossible to get right. Meet Elixir, a functional, concurrent language
        built on the rock-solid Erlang VM. Elixir’s pragmatic syntax and 
        built-in support for metaprogramming will make you productive and
        keep you interested for the long haul. This book is the introduction
        to Elixir for experienced programmers.
      </p>},
  image_url: 'elixir.jpg',
  price: 36.00
)
