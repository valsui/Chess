class Employee
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus_multiplier(multiplier)
      @salary * multiplier 
  end
  
  def get_salary
    salary 
  end
  
  private 
  attr_reader :name, :title, :salary, :boss
  
end

class Manager < Employee
  
  def initialize(name, title, salary, boss, subordinates = [])
    @subordinates = subordinates
    super(name, title, salary, boss) 
  end
  
  def bonus_multiplier(multiplier)
    employee_salaries_sum = 0 
    @subordinates.each do |x|
      employee_salaries_sum += x.get_salary
    end
    
    bonus = employee_salaries_sum * multiplier
  end
  
end

if __FILE__ == $0 
  emp1 = Employee.new("bob", "plumber", 500, "rick")
  emp2 = Employee.new("bob-2", "plumber-2", 500, "rick")
  emp3 = Employee.new("bob-3", "plumber-3", 500, "rick")
  
  rick = Manager.new("rick", "manager", 1000, 'ceo', [emp1, emp2, emp3])
  
  puts rick.bonus_multiplier(2)
  puts emp1.bonus_multiplier(2)
end