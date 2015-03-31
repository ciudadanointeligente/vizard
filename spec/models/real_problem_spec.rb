require 'rails_helper'

RSpec.describe RealProblem, :type => :model do

  describe "to_graph_json" do
    it "returns a RealProblem in json format" do
      problem = RealProblem.new
      problem.title = "a real world problem" 
      json = { "real_problem" => { "title" => "a real world problem" }, "policy_problems" => [] }.to_json
      expect(problem.to_graph_json).to eq(json)
    end

    it "returns embedded policy problems in the json" do
      real_problem = RealProblem.new
      real_problem.title = "a real world problem"
      policy_problem_1 = PolicyProblem.new
      policy_problem_1.title = "a policy problem"
      policy_problem_2 = PolicyProblem.new
      policy_problem_2.title = "another policy problem"
      real_problem.policy_problems = [policy_problem_1, policy_problem_2]
      json = { "real_problem" => { "title" => "a real world problem" },
        "policy_problems" => [
          {
            "title" =>  "a policy problem",
            "policy_solutions" => []
          },
          {
            "title" =>  "another policy problem",
            "policy_solutions" => []
          }
        ]
      }.to_json
      expect(real_problem.to_graph_json).to eq(json)
    end

    it "returns embedded policy solutions in the json" do
      real_problem = RealProblem.new
      real_problem.title = "a real world problem"
      policy_problem_1 = PolicyProblem.new
      policy_problem_1.title = "a policy problem"
      policy_problem_2 = PolicyProblem.new
      policy_problem_2.title = "another policy problem"
      real_problem.policy_problems = [policy_problem_1, policy_problem_2]
      policy_solution_1 = PolicySolution.new
      policy_solution_1.title = "a solution for policy problem 1"
      policy_solution_2 = PolicySolution.new
      policy_solution_2.title = "another solution for policy problem 1"
      policy_problem_1.policy_solutions = [policy_solution_1, policy_solution_2]
      policy_problem_2.policy_solutions = []

      json = { "real_problem" => { "title" => "a real world problem" } ,
        "policy_problems" => [
          {
            "title" => "a policy problem",
            "policy_solutions" => [
                    {
                        "title" => "a solution for policy problem 1"
                    },
                    {
                        "title" => "another solution for policy problem 1"
                    }
                ]
          },
          {
            "title" => "another policy problem",
            "policy_solutions" => []
          }
        ]
      }.to_json

      expect(real_problem.to_graph_json).to eq(json)
    end

  end


end
