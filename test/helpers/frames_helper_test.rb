require "test_helper"

class TurboClone::FramesHelperTest < ActionView::TestCase
  setup do
    @task = Task.new(id: 1, title: "foo", description: "bar", status: "todo")
  end

  test "frame with a model" do
    assert_dom_equal %(<turbo-frame id="task_1"></turbo-frame>), turbo_frame_tag(@task)
  end

  test "frame with a string" do
    assert_dom_equal %(<turbo-frame id="tasks"></turbo-frame>), turbo_frame_tag("tasks")
  end

  test "frame with a block" do
    assert_dom_equal %(<turbo-frame id="task_1"><div>foo</div></turbo-frame>),
      turbo_frame_tag(@task) { content_tag(:div, "foo") }
  end
end
