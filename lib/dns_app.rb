class DnsApp

  def initialize(args)

    @action=args[0]	# one of new, edit, rm
    @object=args[1]	# should be zone
    @type=args[2]	# one of master, slave, stub
    @domain=args[3]  # the domain name

  end

  def run

  	case @action
    when "new"
      puts "Creating new #{@type} zone from #{@domain}"
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
      process_input input.chomp
    end
  end

  def process_input(input)

    case input
    when "exit", "x", "q", "quit"
      exit
    when "list"
      puts "No rules yet" if @rules.empty?
      @rules.each_with_index do |r,i|
      	puts "[#{i}] #{r}"
      end
    else
      if input.start_with?("add")
        add input
      else
        puts "Unknown command: #{input}"
      end
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
end