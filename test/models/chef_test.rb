require "test_helper"

class ChefTest < ActiveSupport::TestCase

   def setup 
   @chef = Chef.new(chefname: "Max", email: "max@example.com")
   end
   
   test "chef should be valid" do
       assert @chef.valid?
   end
    
    
    test "chef name should be valid" do
        @chef.chefname = ""
        assert_not @chef.valid?
    end
    
    test "chef name shouldn't be too short" do 
        @chef.chefname = "a"
        assert_not @chef.valid?
    end
    
    test "chef name shouldn't be too long" do
        @chef.chefname = "a" * 101
        assert_not @chef.valid?
    end
    
    test "chef email should be present" do
        @chef.email = ""
        assert_not @chef.valid?
        
    end
    
    test "chef email shouldn't be too long" do
        @chef.email = "a" * 100 + "@example.com"
        assert_not @chef.valid?
    end
    
    test "chef email should be unique" do
        dup_chef = @chef.dup
        dup_chef.email = @chef.email.upcase
        @chef.save
        assert_not dup_chef.valid?
    end
    
    test "email validation should accept valid emails" do
        valid_addresses = %w[ljabv4253t@fbd.com ASDLGBJ_@sd.com artnov@iti55004.com]
        valid_addresses.each do |v|
            @chef.email = v
            assert @chef.valid?, "#{v.inspect} should be valid"
        end
    end
    
    
    test "email validation should reject invalid emails" do
        valid_addresses = %w[ljabv4253t@fbdcom, asdfa_fbs.com, lknbl5]
        valid_addresses.each do |v|
            @chef.email = v
            assert_not @chef.valid?, "#{v.inspect} shouldn't be valid"
        end
           
    end 
    
    
end