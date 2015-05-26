require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ObjectivesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Objective. As you add validations to Objective, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "Title", description: "Description"}
  }

  let(:invalid_attributes) {
    {title: "", description: "Description"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ObjectivesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @project = create(:project)
  end

  describe "GET index" do
    it "assigns all objectives as @objectives" do
      objective = Objective.create! valid_attributes
      get :index, {project_id: @project}, valid_session
      expect(assigns(:objectives)).to eq([objective])
    end
  end

  describe "GET show" do
    it "assigns the requested objective as @objective" do
      objective = Objective.create! valid_attributes
      get :show, {project_id: @project, :id => objective.to_param}, valid_session
      expect(assigns(:objective)).to eq(objective)
    end
  end

  describe "GET new" do
    it "assigns a new objective as @objective" do
      get :new, {project_id: @project}, valid_session
      expect(assigns(:objective)).to be_a_new(Objective)
    end
  end

  describe "GET edit" do
    it "assigns the requested objective as @objective" do
      objective = Objective.create! valid_attributes
      get :edit, {project_id: @project, :id => objective.to_param}, valid_session
      expect(assigns(:objective)).to eq(objective)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Objective" do
        expect {
          post :create, {project_id: @project, :objective => valid_attributes}, valid_session
        }.to change(Objective, :count).by(1)
      end

      it "assigns a newly created objective as @objective" do
        post :create, {project_id: @project, :objective => valid_attributes}, valid_session
        expect(assigns(:objective)).to be_a(Objective)
        expect(assigns(:objective)).to be_persisted
      end

      it "redirects to the created objective" do
        post :create, {project_id: @project, :objective => valid_attributes}, valid_session
        expect(response).to redirect_to([@project, Objective.last])
      end

      it "relates an objective to an array of actors" do
        actor = create(:actor)
        post :create, {project_id: @project, :objective => valid_attributes.merge({actor_ids: [actor]})}, valid_session
        expect(assigns(:objective).actor_ids).to include(actor.id)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved objective as @objective" do
        post :create, {project_id: @project, :objective => invalid_attributes}, valid_session
        expect(assigns(:objective)).to be_a_new(Objective)
      end

      it "re-renders the 'new' template" do
        post :create, {project_id: @project, :objective => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with create_ww" do
      it "creates a new Objective" do
        expect {
          post :create_ww, {project_id: @project, :objective => valid_attributes}, valid_session
        }.to change(Objective, :count).by(1)
      end

      it "assigns a newly created objective as @objective" do
        post :create_ww, {project_id: @project, :objective => valid_attributes}, valid_session
        expect(assigns(:objective)).to be_a(Objective)
        expect(assigns(:objective)).to be_persisted
      end

      it "redirects to wizard step2" do
        post :create_ww, {project_id: @project, :objective => valid_attributes}, valid_session
        expect(response).to redirect_to(controller: :steps, action: :step2)
      end
    end
  end

  describe "PUT update" do
    let(:new_attributes) {
      {title: "New Title"}
    }
    describe "with valid params" do

      it "updates the requested objective" do
        objective = Objective.create! valid_attributes
        put :update, {project_id: @project, :id => objective.to_param, :objective => new_attributes}, valid_session
        objective.reload
        expect(assigns(:objective).attributes).to include(new_attributes.stringify_keys)
      end

      it "assigns the requested objective as @objective" do
        objective = Objective.create! valid_attributes
        put :update, {project_id: @project, :id => objective.to_param, :objective => valid_attributes}, valid_session
        expect(assigns(:objective)).to eq(objective)
      end

      it "redirects to the objective" do
        objective = Objective.create! valid_attributes
        put :update, {project_id: @project, :id => objective.to_param, :objective => valid_attributes}, valid_session
        expect(response).to redirect_to([@project, objective])
      end
    end

    describe "with invalid params" do
      it "assigns the objective as @objective" do
        objective = Objective.create! valid_attributes
        put :update, {project_id: @project, :id => objective.to_param, :objective => invalid_attributes}, valid_session
        expect(assigns(:objective)).to eq(objective)
      end

      it "re-renders the 'edit' template" do
        objective = Objective.create! valid_attributes
        put :update, {project_id: @project, :id => objective.to_param, :objective => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end

    describe "with update_ww" do
      it "updates the requested objective" do
        objective = Objective.create! valid_attributes
        put :update_ww, {project_id: @project, :id => objective.to_param, :objective => new_attributes}, valid_session
        objective.reload
        expect(assigns(:objective).attributes).to include(new_attributes.stringify_keys)
      end

      it "assigns the requested objective as @objective" do
        objective = Objective.create! valid_attributes
        put :update_ww, {project_id: @project, :id => objective.to_param, :objective => valid_attributes}, valid_session
        expect(assigns(:objective)).to eq(objective)
      end

      it "redirects to wizard step2 with no objective param" do
        objective = Objective.create! valid_attributes
        put :update_ww, {project_id: @project, :id => objective.to_param, :objective => valid_attributes}, valid_session
        expect(response).to redirect_to(controller: :steps, action: :step2)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested objective" do
      objective = Objective.create! valid_attributes
      expect {
        delete :destroy, {project_id: @project, :id => objective.to_param}, valid_session
      }.to change(Objective, :count).by(-1)
    end

    it "redirects to the objectives list" do
      objective = Objective.create! valid_attributes
      delete :destroy, {project_id: @project, :id => objective.to_param}, valid_session
      expect(response).to redirect_to(project_objectives_url(@project))
    end

    describe "with destroy_ww" do
      it "destroys the requested objective" do
        objective = Objective.create! valid_attributes
        expect {
          delete :destroy_ww, {project_id: @project, :id => objective.to_param}, valid_session
        }.to change(Objective, :count).by(-1)
      end

      it "redirects to the objectives list" do
        objective = Objective.create! valid_attributes
        delete :destroy_ww, {project_id: @project, :id => objective.to_param}, valid_session
        expect(response).to redirect_to(controller: :steps, action: :step2)
      end
      
    end
  end

end
