# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sandbox do
    name "MyString"
    description "MyString"
    graph_data '{"type":"bpmn","cells":[{"size":{"width":240,"height":210},"type":"bpmn.Step","bpmn_name":"Step","tags":"","content":"asdasd","title":"asdasd","position":{"x":1850,"y":250},"angle":0,"id":"2970681f-5c59-4289-b098-96cd3bb45d52","embeds":["c4a36906-8b4b-4f9c-a94f-cdada4fd922f","aed9eea0-af40-4d00-a575-5d31200eed5d"],"z":-2000,"attrs":{".fobj":{"width":240,"height":210},"div":{"style":{"width":240,"height":210},"html":"<div><span class=\"step-tags label label-default\"></span><span class=\"step-date\"></span></div><div class=\"step-title\">asdasd</div><div class=\"step-content\">asdasd</div><div></div>"}}},{"type":"bpmn.External","bpmn_name":"Internal Step","tags":"","content":"","title":"","position":{"x":1495,"y":375},"size":{"width":240,"height":210},"angle":0,"id":"e3874001-b7df-455d-a381-52a846a85b2e","embeds":"","z":-2000,"attrs":{".fobj":{"width":240,"height":210},"div":{"style":{"width":240,"height":210},"html":"<div><span class=\"step-tags label label-default\"></span><span class=\"step-date\"></span></div><div class=\"step-title\"></div><div class=\"step-content\"></div><div></div>"}}},{"type":"bpmn.Person","bpmn_name":"Person","size":{"width":33,"height":33},"eventType":"start","size_type":"small","color":"#0091EA","position":{"x":1972,"y":407.2},"angle":0,"id":"c4a36906-8b4b-4f9c-a94f-cdada4fd922f","embeds":"","z":1000,"parent":"2970681f-5c59-4289-b098-96cd3bb45d52","attrs":{"path":{"display":"block"},"text.user-label-small":{"transform":"translate(25,20)"}}},{"type":"bpmn.Person","bpmn_name":"Person","size":{"width":33,"height":33},"eventType":"start","size_type":"small","color":"#0091EA","position":{"x":1934,"y":407.2},"angle":0,"id":"aed9eea0-af40-4d00-a575-5d31200eed5d","embeds":"","z":1000,"parent":"2970681f-5c59-4289-b098-96cd3bb45d52","attrs":{}},{"type":"bpmn.Person","bpmn_name":"Person","size":{"width":33,"height":33},"eventType":"start","size_type":"small","color":"#0091EA","position":{"x":2200,"y":430},"angle":0,"id":"8fa1ea73-1d2e-466b-b0fa-9b1b71e3a38d","embeds":"","z":1000,"parent":"7dcf6ab3-9954-4ebd-8bd8-cff85e715ec4","attrs":{}},{"type":"bpmn.Organization","bpmn_name":"Organization","size":{"width":33,"height":33},"eventType":"start","position":{"x":1840,"y":510},"angle":0,"id":"8d2fbdca-923f-4f1e-860c-c69111fa64fe","embeds":"","z":1001,"attrs":{}},{"type":"bpmn.GroupOrganization","bpmn_name":"Group Organization","size":{"width":280,"height":190},"position":{"x":2185,"y":295},"angle":0,"id":"7dcf6ab3-9954-4ebd-8bd8-cff85e715ec4","embeds":["8fa1ea73-1d2e-466b-b0fa-9b1b71e3a38d"],"z":-3000,"attrs":{}}]}'

    factory :invalid_sandbox do
      name ""
      description "MyString"
      graph_data "MyString"
    end
    
    factory :sandbox_from_json do
      name "MyString"
      description "MyString"
      graph_data ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/sandbox.json"), :filename => "sandbox.json")
    end
    factory :sandbox_from_json_from_file do
      name "MyString"
      description "MyString"
      graph_data ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/sandbox.json"), :filename => "sandbox.json")
    end
    factory :invalid_sandbox_from_json do
      name ""
      description "MyString"
      graph_data ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/sandbox.json"), :filename => "sandbox.json")
    end
  end
end
