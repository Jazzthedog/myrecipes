require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname:"bob", email: "bob@example.com", password: "password")
    @recipe = @chef.recipes.build(name: "Chicken pot pie", summary: "This is great dish for the outdoors", description: "bring oil to heat, add chicken and broth, done!")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "Chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "recipe name should be valid" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end  
  
  test "name length should not be too short" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "Summary should not be blank" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "Summary should not be too short" do
    @recipe.summary = "aaaaaaaaa"
    assert_not @recipe.valid?
  end
  
  test "Summary should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "Description should not be blank" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "Description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
  test "Description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
end