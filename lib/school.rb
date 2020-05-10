class School
  attr_reader :start_time,
              :hours_in_school_day,
              :student_names

  def initialize(start_time, hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names = []
  end

  def add_student_name(name)
    @student_names << name
  end

  def end_time ##Using a local varaible here instead of an instance one. Not super helpful to expose a variable like time to the rest of the methods when it is being referenced here.
    time = @start_time.to_i + @hours_in_school_day
    "#{time}:00"
  end

  def is_full_time?
    @hours_in_school_day > 4 ## if statement is redundant and returns nil for non-full school days
  end

  def standard_student_names
    @student_names.map do |student| ## @ not necessary because of the method defined in the attr_reader
      student.capitalize
    end
  end

  def convert_end_time_to_clock_time
    time = end_time.to_i
    if time > 12
      pm_end_time = time - 12
      "#{pm_end_time}:00"
    else
      "#{time}:00"
    end
  end
end
