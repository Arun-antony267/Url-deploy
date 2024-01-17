class UserDetailsPdf < Prawn::Document
  def initialize(user, last_url)
    super()
    @user = user
    @last_url = last_url

    generate_user_table
    generate_last_url_table
  end

  def generate_user_table
    text "User Details ", size: 14, style: :bold, align: :left
    move_down 10

    user_data = [["ID", "Name", "Email"]]
    user_data << [@user.id, @user.name, @user.email]

    table(user_data)
  end

  def generate_last_url_table
    move_down 20
    text "Last URL Details ", size: 14, style: :bold, align: :left
    move_down 10

    last_url_data = [["Original Url", "Shortened Url"]]
    last_url_data << [@last_url.original_url, @last_url.shortened_url]

    table(last_url_data)
  end
end
