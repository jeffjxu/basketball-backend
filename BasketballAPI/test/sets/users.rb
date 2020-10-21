module Contexts
  module Users

    def create_users
      @user1 = FactoryBot.create(:user, username: "michaeljordan", email: "michaeljordan@gmail.com", firstname: "Michael", lastname: "Jordan", dob: 10.years.ago.to_date)
      @user2 = FactoryBot.create(:user, username: "kobebryant", email: "kobebryant@gmail.com", firstname: "Kobe", lastname: "Bryant", dob: 12.years.ago.to_date)
      @user3 = FactoryBot.create(:user, username: "lebronjames", email: "lebronjames@gmail.com", firstname: "LeBron", lastname: "James", dob: 14.years.ago.to_date)
    end

    def destroy_users
      @user1.destroy
      @user2.destroy
      @user3.destroy
    end
  end
end