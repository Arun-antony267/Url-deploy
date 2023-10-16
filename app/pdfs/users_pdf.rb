class UsersPdf < Prawn::Document
    def initialize(user)
    super()
    @user = User.order("id ASC").all
    table user_all
    end


    def user_all
    [["ID","Email","Name"]]
    @user.map do |user|
        [user.id,user.email,user.name]
    end
    end
end