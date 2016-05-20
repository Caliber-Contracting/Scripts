def tasker
    start_time = 0
    end_time = 0
    puts "What Task are you working on?"
    task = gets.chomp
    start_time = Time.now
    finished = "p"
    puts "Great. Please type 'F' when you have completed this.\n"
    begin
        finished = gets.chomp
        puts finished.inspect
        if !(finished == "F" || finished == "f")
            puts "Just type 'F' when you are."
        end
    end until (finished == "F" || finished == "f")
    end_time = Time.now
    total_time = end_time - start_time
    total_time = Time.at(total_time.to_i.abs).utc.strftime "%H:%M:%S"
    puts "Time elapsed #{total_time} for #{task}"
    return task, total_time
end

def worker
    fin = "p"
    log = File.open("work_log.md", "w")
    puts "Welcome, we are interested in how long certain items take to finish.\n"
    puts "Please be descriptive.\n"
    puts "What is your name?\n"
    name = gets.chomp
    puts "What is the name of the project you are working on?"
    proj = gets.chomp
    log << "# #{name} - #{proj}\n"
    log << "## #{Time.now.strftime("%d/%m/%Y %H:%M")}\n"
    begin
        current_task = tasker
        log << "### #{current_task[0]}\n"
        log << " -  Time for Completion: #{current_task[1]}\n"
        log << "\n"
        puts "Great, are you finished? (Y/N)"
        fin = gets.chomp
    end until (fin == "y" || fin == "Y")
    puts "Please enter the commit ID:\n"
    commit = gets.chomp
    log << "### Commit ID: #{commit}\n"
    puts "Please attach the 'work_log.md file to the issue or milestone in Github'"
end

worker
