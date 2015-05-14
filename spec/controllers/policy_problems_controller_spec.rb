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

RSpec.describe PolicyProblemsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # PolicyProblem. As you add validations to PolicyProblem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "Title", description: "Description"}
  }

  let(:invalid_attributes) {
    {title: "", description: "Description"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PolicyProblemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @real_problem = create(:real_problem)
    @policy_problem = create(:policy_problem)
    @real_problem.policy_problems.append @policy_problem
    @real_problem.save
  end

  describe "GET index" do
    it "assigns all policy_problems of a real_problem as @policy_problems" do
      create(:policy_problem)
      get :index, {real_problem_id: @real_problem}, valid_session
      expect(assigns(:policy_problems)).to eq([@policy_problem])
    end
  end

  describe "GET show" do
    it "assigns the requested policy_problem as @policy_problem" do
      get :show, {id: @policy_problem, real_problem_id: @real_problem}, valid_session
      expect(assigns(:policy_problem)).to eq(@policy_problem)
    end
  end

  describe "GET new" do
    it "assigns a new policy_problem as @policy_problem" do
      get :new, {real_problem_id: @real_problem}, valid_session
      expect(assigns(:policy_problem)).to be_a_new(PolicyProblem)
    end
  end

  describe "GET edit" do
    it "assigns the requested policy_problem as @policy_problem" do
      get :edit, {id: @policy_problem, real_problem_id: @real_problem}, valid_session
      expect(assigns(:policy_problem)).to eq(@policy_problem)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PolicyProblem" do
        expect {
          post :create, {policy_problem: attributes_for(:policy_problem), real_problem_id: @real_problem}, valid_session
        }.to change(PolicyProblem, :count).by(1)
      end

      it "assigns a newly created policy_problem as @policy_problem" do
        post :create, {policy_problem: attributes_for(:policy_problem), real_problem_id: @real_problem}, valid_session
        expect(assigns(:policy_problem)).to be_a(PolicyProblem)
        expect(assigns(:policy_problem)).to be_persisted
      end

      it "redirects to the created policy_problem" do
        post :create, {policy_problem: attributes_for(:policy_problem), real_problem_id: @real_problem}, valid_session
        expect(response).to redirect_to real_problem_policy_problem_path(@real_problem, PolicyProblem.last)
      end

      it "creates a new Policy Problem, related to a RealProblem" do
        expect{
          post :create, {policy_problem: attributes_for(:policy_problem), real_problem_id: @real_problem}, valid_session
        }.to change(@real_problem.policy_problems, :count).by(1)
        expect(assigns(:policy_problem).real_problem_id).to eq(@real_problem.id)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved policy_problem as @policy_problem" do
        post :create, {policy_problem: attributes_for(:invalid_policy_problem), real_problem_id: @real_problem}, valid_session
        expect(assigns(:policy_problem)).to be_a_new(PolicyProblem)
      end

      it "re-renders the 'new' template" do
        post :create, {policy_problem: attributes_for(:invalid_policy_problem), real_problem_id: @real_problem}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with create_ww" do
      it "creates a policy problem" do
        expect {
          post :create_ww, {policy_problem: attributes_for(:policy_problem), real_problem_id: @real_problem}, valid_session
        }.to change(PolicyProblem, :count).by(1)
      end

      it "is related to a real problem" do
        post :create_ww, {policy_problem: attributes_for(:policy_problem), real_problem_id: @real_problem}
        expect(assigns(:policy_problem).real_problem).to eq @real_problem
        expect(@real_problem.policy_problems).to include(assigns(:policy_problem))
      end

      it "is redirected to step1_2" do
        post :create_ww, {policy_problem: attributes_for(:policy_problem), real_problem_id: @real_problem}
        expect(response).to redirect_to controller: "steps", action: "show", id: "step1_2", rp_id: @real_problem
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      it "updates the requested policy_problem" do
        put :update, {id: @policy_problem, policy_problem: attributes_for(:edit_policy_problem), real_problem_id: @real_problem}, valid_session
        @policy_problem.reload
        expect(@policy_problem.attributes).to include(attributes_for(:edit_policy_problem).stringify_keys)
      end

      it "assigns the requested policy_problem as @policy_problem" do
        put :update, {id: @policy_problem, policy_problem: attributes_for(:edit_policy_problem), real_problem_id: @real_problem}, valid_session
        expect(assigns(:policy_problem)).to eq(@policy_problem)
      end

      it "redirects to the policy_problem" do
        put :update, {id: @policy_problem, policy_problem: attributes_for(:edit_policy_problem), real_problem_id: @real_problem}, valid_session
        expect(response).to redirect_to real_problem_policy_problem_path(@real_problem, @policy_problem)
      end
    end

    describe "with invalid params" do
      it "assigns the policy_problem as @policy_problem" do
        put :update, {id: @policy_problem, policy_problem: attributes_for(:invalid_policy_problem), real_problem_id: @real_problem}, valid_session
        expect(assigns(:policy_problem)).to eq(@policy_problem)
      end

      it "re-renders the 'edit' template" do
        put :update, {id: @policy_problem, policy_problem: attributes_for(:invalid_policy_problem), real_problem_id: @real_problem}, valid_session
        expect(response).to render_template("edit")
      end
    end

    describe "with update_ww" do
      it "updates a policy_problem" do
        put :update_ww, {id: @policy_problem, policy_problem: attributes_for(:edit_policy_problem), real_problem_id: @real_problem}, valid_session
        expect(response).to redirect_to controller: "steps", action: "show", id: "step1_2", rp_id: @real_problem
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested policy_problem" do
      expect {
        delete :destroy, {id: @policy_problem, real_problem_id: @real_problem}, valid_session
      }.to change(PolicyProblem, :count).by(-1)
    end

    it "redirects to the policy_problems list within a real_problem" do
      delete :destroy, {id: @policy_problem, real_problem_id: @real_problem}, valid_session
      expect(response).to redirect_to(real_problem_url(@real_problem))
    end

    describe "with destroy_ww" do
      it "destroy a policy problem" do
        expect {
          delete :destroy_ww, {id: @policy_problem, real_problem_id: @real_problem}, valid_session
        }.to change(PolicyProblem, :count).by(-1)
      end

      it "redirect to the policy problems list" do
        delete :destroy_ww, {id: @policy_problem, real_problem_id: @real_problem}, valid_session
        expect(response).to redirect_to(controller:"steps", action:"show", id: "step1_2", rp_id: @real_problem)
      end
    end
  end

end
