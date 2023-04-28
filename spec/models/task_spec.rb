require "rails_helper"


describe "Task Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the chore is present when creating task" do
      task = Task.create(name: "Generic Name", time: 1, description: "Generic Description")
      expect(task.valid?).to eq(false)
    end
    it "should not be able to save task when name missing" do
      task = Task.new(chore: "Generic Chore", time: 1, description: "Generic Description")
      expect(task.save).to eq(false)
    end
    it "should not be able to save task when time missing" do
      task = Task.new(chore: "Generic Chore", name: "Generic Name", description: "Generic Description")
      expect(task.save).to eq(false)
    end
    it "should not be able to save task when description missing" do
      task = Task.new(chore: "Generic Chore", name: "Generic Name", time: 1)
      expect(task.save).to eq(false)
    end
    it "should be able to save task when have chore, name, time, and description" do
      task = Task.new(chore: "Generic Chore", name: "Generic Name", time: 1, description: "Generic Description")
      expect(task.save).to eq(true)
    end
  end
end


describe "Task Attribute Requirements on Edit", :type => :model do
  context "Edit Task" do  
    before (:each) do
      @task = Task.create(chore: "Chore", name: "Name", time: 2, description: "Description")
 
      end
    it "ensures the chore is present when editing task" do
      @task.update(:chore => "Generic Chore")
      expect(@task.chore == "Generic Chore")
    end
    it "ensures the name is present when editing task" do
      @task.update(:name => "Generic Name")
      expect(@task.name == "Generic Name")
    end
    it "ensures the time is present when editing task" do
      @task.update(:time => 1)
      expect(@task.time == 1)
    end
    it "ensures the description is present when editing task" do
        @task.update(:description => "Generic Description")
      expect(@task.description == "Generic Description")
    end
  end
end
