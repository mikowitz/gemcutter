require File.dirname(__FILE__) + '/../test_helper'

class HomeControllerTest < ActionController::TestCase
  context "on GET to index" do
    setup do
      @count = 1337
      stub(Rubygem).total_count { @count }
      stub(Rubygem).latest { [] }
      stub(Rubygem).downloaded { [] }
      stub(Version).updated { [] }
      get :index
    end

    should_respond_with :success
    should_render_template :index
    should_assign_to(:count) { @count }
    should_assign_to(:latest)
    should_assign_to(:downloaded)
    should_assign_to(:updated)

    should "display count" do
      assert_contain "1,337"
    end

    should "load up the total count, latest, and most downloaded gems" do
      assert_received(Rubygem) { |subject| subject.total_count }
      assert_received(Rubygem) { |subject| subject.latest }
      assert_received(Rubygem) { |subject| subject.downloaded }
      assert_received(Version) { |subject| subject.updated }
    end
  end

  context "on GET to most_downloaded" do
    setup do
      get :most_downloaded
    end

    should_respond_with :success
    should_render_template :most_downloaded
    should_assign_to(:most_downloaded)
  end

  context "on GET to just_updated" do
    setup do
      get :just_updated
    end

    should_respond_with :success
    should_render_template :just_updated
    should_assign_to(:just_updated)
  end

  context "on GET to new_gems" do
    setup do
      get :new_gems
    end

    should_respond_with :success
    should_render_template :new_gems
    should_assign_to(:new_gems)
  end
end


