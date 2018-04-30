require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    a = Robot.new
    a.needs_repairs = true
    a.foreign_model = true

    # act

    required_action = a.station
    required_result = 1

    # assert
    assert_equal(required_action, required_result)

  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    a = Robot.new
    a.vintage_model = true
    a.needs_repairs = true

    # act
    required_action = a.station
    required_result = 2

    # assert
    assert_equal(required_action, required_result)

  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    a = Robot.new
    a.needs_repairs = true

    # act
    required_action = a.station
    required_result = 3

    # assert
    assert_equal(required_action, required_result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    a = Robot.new

    # act
    required_action = a.station
    required_result = 4

    # assert
    assert_equal(required_action, required_result)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    a = Robot.new

    # act
    required_action = a.prioritize_tasks

    # assert
    assert_same(required_action.negative?, true)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    a = Robot.new
    task = ["task1"]
    a.todos = task
    # act
    required_action = a.prioritize_tasks

    # assert
    assert_equal(required_action, task.max)

  end

  def test_workday_on_day_off_returns_false

    # arrange
    a = Robot.new
    a.day_off = 'Sunday'

    # act
    required_action = a.workday?('Sunday')

    # assert
    assert_same(required_action, false)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    a = Robot.new
    a.day_off = 'Sunday'

    # act
    required_action = a.workday?('Monday')

    # assert
    assert_same(required_action, true)
  end

end
