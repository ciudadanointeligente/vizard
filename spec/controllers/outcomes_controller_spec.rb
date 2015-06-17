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

RSpec.describe OutcomesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Outcome. As you add validations to Outcome, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "Title", description: "Description"}
  }

  let(:invalid_attributes) {
    {title: "", description: "Description"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OutcomesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @project = create(:project)
    @objective = create(:objective)
    @outcome = create(:outcome)
    @project.objectives.append(@objective)
    @objective.outcomes.append(@outcome)
    @objective.save
  end

  describe "GET index" do
    it "assigns all outcomes as @outcomes" do
      get :index, {project_id: @project, objective_id: @objective}, valid_session
      expect(assigns(:outcomes)).to eq([@outcome])
    end
    it "assigns all outcomes as @outcomes as JSON" do
      get :index, {project_id: @project, objective_id: @objective}, valid_session, :format => 'json'
      expect(response).to be_success
      expect(assigns(:outcomes).length).to eq(1)
      expect(assigns(:outcomes).first.title).to eq('MyText')
    end
  end

  describe "GET show" do
    it "assigns the requested outcome as @outcome" do
      get :show, {project_id: @project, objective_id: @objective, :id => @outcome}, valid_session
      expect(assigns(:outcome)).to eq(@outcome)
    end
  end

  describe "GET new" do
    it "assigns a new outcome as @outcome" do
      get :new, {project_id: @project, objective_id: @objective}, valid_session
      expect(assigns(:outcome)).to be_a_new(Outcome)
    end
  end

  describe "GET edit" do
    it "assigns the requested outcome as @outcome" do
      get :edit, {project_id: @project, objective_id: @objective, :id => @outcome}, valid_session
      expect(assigns(:outcome)).to eq(@outcome)
    end
  end

  describe "GET Categories" do
    it "return a JSON with categories" do
      get :categories, {:format => 'json'}, valid_session
      expect(JSON.parse(response.body)).to include "Political will"
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Outcome" do
        expect {
          post :create, {project_id: @project, objective_id: @objective, outcome: attributes_for(:outcome)}, valid_session
        }.to change(Outcome, :count).by(1)
      end

      it "assigns a newly created outcome as @outcome" do
        post :create, {project_id: @project, objective_id: @objective, outcome: attributes_for(:outcome)}, valid_session
        expect(assigns(:outcome)).to be_a(Outcome)
        expect(assigns(:outcome)).to be_persisted
      end

      it "redirects to the created outcome" do
        post :create, {project_id: @project, objective_id: @objective, outcome: attributes_for(:outcome)}, valid_session
        expect(response).to redirect_to project_objective_outcome_path(@project, @objective, Outcome.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved outcome as @outcome" do
        post :create, {project_id: @project, objective_id: @objective, outcome: attributes_for(:invalid_outcome)}, valid_session
        expect(assigns(:outcome)).to be_a_new(Outcome)
      end

      it "re-renders the 'new' template" do
        post :create, {project_id: @project, objective_id: @objective, outcome: attributes_for(:invalid_outcome)}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested outcome" do
        put :update, {project_id: @project, objective_id: @objective, :id => @outcome, :outcome => attributes_for(:edit_outcome)}, valid_session
        @outcome.reload
        expect(@outcome.attributes).to include(attributes_for(:edit_outcome).stringify_keys)
      end

      it "assigns the requested outcome as @outcome" do
        put :update, {project_id: @project, objective_id: @objective, :id => @outcome, :outcome => attributes_for(:edit_outcome)}, valid_session
        expect(assigns(:outcome)).to eq(@outcome)
      end

      it "redirects to the outcome" do
        put :update, {project_id: @project, objective_id: @objective, :id => @outcome, :outcome => attributes_for(:edit_outcome)}, valid_session
        expect(response).to redirect_to project_objective_outcome_path(@project, @objective, @outcome)
      end
    end

    describe "with invalid params" do
      it "assigns the outcome as @outcome" do
        put :update, {project_id: @project, objective_id: @objective, :id => @outcome, :outcome => attributes_for(:invalid_outcome)}, valid_session
        expect(assigns(:outcome)).to eq(@outcome)
      end

      it "re-renders the 'edit' template" do
        outcome = Outcome.create! valid_attributes
        put :update, {project_id: @project, objective_id: @objective, :id => @outcome, :outcome => attributes_for(:invalid_outcome)}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested outcome" do
      expect {
        delete :destroy, {project_id: @project, objective_id: @objective, :id => @outcome}, valid_session
      }.to change(Outcome, :count).by(-1)
    end

    it "redirects to the parent objective" do
      delete :destroy, {project_id: @project, objective_id: @objective, :id => @outcome}, valid_session
      expect(response).to redirect_to project_objective_url(@project, @objective)
    end
  end

end
