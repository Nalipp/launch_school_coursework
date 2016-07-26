# This exercise will ask that you come up with a class design for a fake "Employee Management Application".
#
# An employee management application has information about the employees in the company. All employees have a name, a serial number, and are
# either full-time or part-time.
#
# All executives and managers are full-time employees. Full-time employees that are neither an executive nor a manager are designated as
# regular employees.
#
# Executives receive 20 days of vacation, while managers receive 14 days. Regular employees receive 10 days of vacation. Part-time employees
# do not receive vacations.
#
# Executives work at a desk in a corner office. Managers work at a desk in a regular private office. Regular employees are assigned to desks
# in the cubicle farm. Part-time employees work in an open workspace with no reserved desk.
#
# When displaying or printing an employee's name, we need to prefix the name with "Mgr" if the employee is a manager, or "Exe" if the
# employee is an executive. Other employees do not require a prefix.
#
# Managers and executives can delegate work, while other employees can not.
#
# Create a set of classes based on the description of the employee management application. Your classes should show any inheritance
# relationships, module inclusions, and methods necessary to implement the requirements.
#
# This exercise is about designing class relationships, and how your classes, behaviors, and state are organized. Your methods should
# provide only the minimum detail required to satisfy the requirements. In some cases, you may be able to eliminate the method body entirely.
 # You should not implement any functionality that is not described above. In particular, you do not need to show how employees are added,
 # deleted, updated, and removed, nor do you need to show how the employee details are retrieved.

# name, serial_number

# full_time part_time
# executives = full_time
# managers = full_time

# non-executives / managers = regular_employee

# executives = 20 days of vacation / corner_office / 'Exe'
# managers = 14 days of vacation / private_office / 'Mgr'
# regular_employees = 10 days of vacation / cubicle
# part_time_employees = 0 days of vacation / open_workspace

class Employee
  attr_reader :name, :serial_number, :office

  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
  end
end

class UpperManagment < Employee
  attr_reader :vacation, :prefix
end

class Executive < UpperManagment
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation = 20
    @prefix = 'Exe'
    @office = 'corner office'
  end
end

class Manager < UpperManagment
  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation = 14
    @prefix = 'Mgr'
    @office = 'private_office'
  end
end

class RegularEmployee < Employee
  attr_reader :vacation

  def initialize(name, serial_number)
    super(name, serial_number)
    @vacation = 10
    @office = 'cubicle'
  end
end

class PartTime < Employee
  def initialize(name, serial_number)
    super(name, serial_number)
    @office = 'open workspace'
  end
end


bill = Executive.new('bill', 23332)
p bill.name
p bill.serial_number
p bill.vacation
p bill.prefix
p bill.office
bill = Manager.new('bill', 23332)
p bill.name
p bill.serial_number
p bill.vacation
p bill.prefix
p bill.office
bill = RegularEmployee.new('bill', 23332)
p bill.name
p bill.serial_number
p bill.vacation
p bill.office
bill = PartTime.new('bill', 23332)
p bill.name
p bill.serial_number
p bill.office
