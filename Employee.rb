class Employee
  attr_accessor :boss
  attr_reader :salary, :employees
  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
    @employees = []
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, employees = [])
    super(name, title, salary)
    @employees = employees
  end

  def bonus(multiplier)

    salaries = employees.map {|employee| employee.salary }
    total_salaries = salaries.reduce(:+)
    bonus = total_salaries * multiplier
  end

  def add_employee(employee)
    @employees << employee
    employee.boss = self
    unless employee.employees.empty?
      employee.employees.each do |el|
        @employees << el
      end
    end
  end



end

ned = Manager.new("NED", "FOUNDER", 1000000)
darren = Manager.new("Darren","TA MANAGER", 78000)
shawna = Employee.new("shawna", "TA", 12000)
david = Employee.new("David", "TA", 10000)
