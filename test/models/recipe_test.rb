require "test_helper"

class RecipeTest < ActiveSupport::TestCase

    def setup
        @chef = Chef.create(chefname: "bob", email: "bob@example.com")
        @recipe = @chef.recipes.build(name: "chicken sausage", summary: "best chicken sausage in the world", 
                  description: "totally the best thinga asdf asdf adsf asdf ")
    end
    
    test "recipe should be valid" do
       assert @recipe.valid?
    end
    
    test "recipe should have a chef_id" do
        assert @recipe.valid?
    end
    
    
    test "name should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
    
    test "name length should not be too long" do
        @recipe.name = "a" * 101
        assert_not @recipe.valid?
    end
    
    test "name length should not be too short" do
        @recipe.name = "a"
        assert_not @recipe.valid?
    end
    
    test "summary length should be present" do
        @recipe.summary = ""
        assert_not @recipe.valid?
    end
    
    test "summary length should not be too long" do
        @recipe.summary = "asdf" * 300
        assert_not @recipe.valid?
    end
    
    test "summary length should not be too short" do
        @recipe.summary = "asdf"
        assert_not @recipe.valid?
    end
    
    test "description should be present" do
        @recipe.summary = ""
        assert_not @recipe.valid?
    end
        
    test "description should not be too long" do
        @recipe.summary = "asdf" * 1000
        assert_not @recipe.valid?
    end  
    
    test "description should not be too short" do
        @recipe.summary = "asdf" * 100
        assert_not @recipe.valid?
    end   
    
end
