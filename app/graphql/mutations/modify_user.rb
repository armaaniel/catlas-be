module Mutations
  class ModifyUser < BaseMutation
    argument(:first_name, String, required:true)
    argument(:last_name, String, required:true)
    argument(:email, String, required:true)
    argument(:age, String, required:true)
    argument(:gender, String, required:true)
    
    field(:user, Types::UserType, null:true)
    field(:errors, [String], null:false)
    
    def resolve(first_name:, last_name:, email:, age:, gender:)
      user = User.find_by(email: email)
      
      user.update(first_name: first_name, last_name: last_name, email: email, age: age, gender: gender )
      
      if user.save
        {user: user, errors: []}
      else
        {user: nil, errors: user.errors.full_messages}
      end
    end
  end
end