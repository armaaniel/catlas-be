module Types
  class QueryType < Types::BaseObject
    field(:users_by_email_or_name, [Types::UserType], null: true) do 
      argument(:term, String, required: true)
      description('search users by email or name')
    end
    
    field(:users_by_id, Types::UserType, null:true) do
      argument(:id, ID, required:true)
      description('fetch user data by ID')
    end
        
    def users_by_email_or_name(term:)
      User.where("lower(email) LIKE ? OR lower(first_name) LIKE ?", "%#{term.downcase}%", "%#{term.downcase}%").limit(5)
    end
    
    def users_by_id(id:)
      User.find_by(id: id)
    end
    
  end
end
  