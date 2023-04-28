require rails_helper

RSpec.describe TasksController, :type => :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:task) { Task.create(chore: "Generic Chore",name: "Generic Name", time: 1, description: "Generic Description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end

        context "GET #edit" do
            let!(:task) { Task.create(chore: "Generic Chore",name: "Generic Name", time: 1, description: "Generic Description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        
        context "GET #destroy" do
            let!(:task) { Task.create(chore: "Generic Chore",name: "Generic Name", time: 1, description: "Generic Description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
    end
end
