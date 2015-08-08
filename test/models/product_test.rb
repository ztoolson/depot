require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should save a valid product" do
    product = Product.new(
      title: "test",
      description: "test desc",
      image_url: 'test.jpg',
      price: 0.01
    )
    assert product.valid?
    assert product.save
  end

  test "product attributes should not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "test", description: "test desc", image_url: "fake.jpg")

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "validates image_url" do
    product = Product.new(
      title: "test",
      description: "test desc",
      price: 5
    )

    ok =  %w{ fred.gif fred.jpg fred.png FRED.JPG }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |image_url|
      product.image_url = image_url
      assert product.valid?, "#{image_url} should be valid"
    end

    bad.each do |image_url|
      product.image_url = image_url
      assert product.invalid?, "#{image_url} should be invalid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(
      title: products(:valid_product).title,
      description: "asdf",
      image_url: "honey_badger_dont_care.jpg",
      price: 53
    )

    assert product.invalid?
    assert_equal [I18n.translate("errors.messages.taken")], product.errors[:title]
  end

  test "title has a minimum length of 3" do
    product = Product.new(
      title: "dd",
      description: "title is too short",
      image_url: "honey_badger_dont_care.jpg",
      price: 53
    )

    assert product.invalid?
    assert_equal ["is too short (minimum is 3 characters)"], product.errors[:title]
  end
end
