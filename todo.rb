#!/usr/bin/env ruby

class Task
  require 'Date'
  require 'rainbow'
  
  include Comparable

  attr_accessor :item, :complete, :due_date
  attr_reader :overdue

  def initialize (item, due_date = Date.today.next_day)
    @item = item
    @complete = false
    @due_date = due_date
    @overdue = (@due_date < Date.today)
  end

  def <=>(anOther)
    @due_date <=> anOther.due_date
  end

  def to_s
    "#{item}\t#{due_date}\t#{complete ? "Completed" : "Not Completed"}#{overdue ? " - Overdue!": ""}"
  end

end


class TaskList
  attr_accessor :task_list

  def initialize
    @task_list = []
  end

  def empty?
    @task_list.empty?
  end

  def add(new_task)
    @task_list << new_task
  end

  def delete(task_to_nuke)
    @task_list.delete(task_to_nuke)
  end

  def display_tasks
    if @task_list.empty?
      print "You have no current tasks.\n"
    else
      print "Item\t\t\t\t\tDue Date\tStatus\n"
      80.times { print "-"}
      print "\n"
      @task_list.each_with_index do |i, index|
        print "#{index + 1} - #{i}\n"
      end
    end
  end

end

require 'Date'

tlist = TaskList.new

# case ARGV[0]
# when 'add'
#   if ARGV[2] == nil
#     tlist.add(Task.new(ARGV[1]))
#     tlist.display_tasks
#   else
#     tlist.add(Task.new(ARGV[1], Date.parse(ARGV[2])))
#     tlist.display_tasks
#   end
# when 'list'
#   tlist.display_tasks
# when 'help', nil
# else
#   puts "D'oh!"
# end


# ARGV.each do|a|
#   case a
#   when 'list'
#     tlist.display_tasks
#   when 'add'
#     tlist.add(Task.new(ARGV[1]))
#   else
#     puts "Sorry, can't do that."
#   end
# end

t1 = Task.new("Feed the kitty.", Date.parse('2013-04-01'))
tlist.add(t1)

t2 = Task.new("Get a haircut", Date.parse('2013-03-30'))
tlist.add(t2)

t3 = Task.new("Pickup Susie", Date.parse('2013-03-24'))
tlist.add(t3)

t4 = Task.new("Buy milk", Date.parse('2013-05-23'))
tlist.add(t4)

t1.complete = true

tlist.display_tasks

