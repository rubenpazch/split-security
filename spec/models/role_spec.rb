require 'rails_helper'

RSpec.describe Role, type: :model do 
  context 'given a role' do 
    let(:role_test) {build(:roles)}

    it 'title is empty' do 
      role_test.title = ''
      role_test.validate
      expect(role_test.errors.full_messages).to match_array(["Role can't be empty"])  
    end

    it 'title is null' do 
      role_test.title = nil
      role_test.validate 
      expect(role_test.errors.full_messages).to match_array(["Role can't be null"])  
    end
    it 'title with long string' do 
      role_test.title =  "test"*1000
      role_test.validate
      expect(role_test.errors.full_messages).to match_array(["Role title length is greater than 255"])  
    end
    
    it 'is super admin' do 
    end

    it 'is admin' do 
    end
    it 'is support' do 
    end
    it 'is author' do 
    end
    it 'is basic user' do 
    end 
  end
end