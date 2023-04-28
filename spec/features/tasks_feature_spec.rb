require "rails_helper"

RSpec.feature "Tasks", type: :feature do
  
  context "Update task" do
    let(:task) { Task.create(chore: "Generic", name: "Generic", time: 2, description: "Generic Description") }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit edit_task_path(task)
    end

    scenario "should be successfull" do
      within("form") do
        fill_in "Chore", with: "New Chore"
      end
      click_button "Update Task"
      expect(page).to have_content("Task was successfully updated")
    end

  end

  context "Login" do
    scenario "should sign up" do
      visit root_path
      click_link 'Sign up'
      within("form") do
        fill_in "Email", with: "testing@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
      end
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end




    scenario "should log in" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content("Logged in")
    end
  end


  context "Create task" do
    before(:each) do 
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_task_path()
    end

    scenario "should succeed" do
      within("form") do
        fill_in "Chore", with: "Generic Chore"
        fill_in "Name", with: "Generic Name"
        fill_in "Time", with: 1;
        fill_in "Description", with: "Generic Description"
      end
      click_button "Create Task"
      expect(page).to have_content("Task was successfully created")
    end
  end

end


=begin
RSpec.feature "Tasks", type: :feature do
    context "Update task" do
      let(:task) { Task.create(chore: "Generic Chore", name: "Generic Name", time: 1, description: "Generic Description") }
      before(:each) do
        visit edit_task_path(task)
      end
 
       
      scenario "should be successful" do
        within("form") do
          fill_in "Chore", with: "New Chore"
        end
        click_button "Update Task"
        expect(page).to have_content("Task was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
            fill_in "Chore", with: ""
        end
        click_button "Update Task"
        expect(page).to have_content("Chore can't be blank")
      end
    end

    context "Create task" do
      before(:each) do 
          visit create_task_path()
      end

      scenario "should succeed" do
        within("form") do
          fill_in "Chore", with: "Generic Chore"
          fill_in "Name", with: "Generic Name"
          fill_in "Time", with: 1;
          fill_in "Description", with: "Generic Description"
        end
        click_button "Create Task"
        expect(page).to have_content("Task was successfully created")
      end
    end
end
=end