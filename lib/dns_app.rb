class DnsApp

  def initialize(args)

    @action=args[0]	# one of new, edit, rm
    @domain=args[1]  # the domain name

  end

  def run

  	case @action
    when "new"
      puts "Creating new master zone for #{@domain}"
      @rules = []
      show_prompt
    else
      puts "usage"
    end
  end

  def show_prompt

    while true do
      print "dns> "
      input = STDIN.gets

      begin
        process_input input.chomp
      rescue => e
        puts "Error occured!"
        puts e.message
        puts e.backtrace
      end
    end
  end

  def process_input(input)

    case input
    when "exit", "x", "q", "quit"
      exit
    when "list"
      list
    when "save"
      save
    else
      case
      when input.start_with?("add")
        add input
      when input.start_with?("rm")
        rm input
      else
        puts "Unknown command: #{input}"
      end
    end
  end

  def list
    puts "No rules yet" if @rules.empty?
    @rules.each_with_index do |r,i|
      puts "[#{i}] #{r}"
    end
  end

  def add(args)
  	args = args.split(" ")
  	type = args[1].upcase
  	from = args[2]
  	to = args[3]
    @rules << "#{from}\tIN\t#{type}\t#{to}"
    puts "Added #{type} record for #{from}.#{@domain} to #{to}"
  end

  def rm(args)
    index = args.split(" ")[1].to_i
    @rules.delete_at(index)
  end

  def save
    puts "save the rules"
  end
end