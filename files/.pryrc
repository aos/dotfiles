Pry.config.editor = 'nvim'

# awesome_print
$LOAD_PATH << '/Users/adabbagh/.rvm/gems/ruby-2.4.1/gems/awesome_print-1.8.0/lib/awesome_print.rb'
require 'awesome_print'

# Add some byebug command alias
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
