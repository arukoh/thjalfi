# Thjalfi

Thhjalfi is skeleton generator of CLI gem use Thor.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thjalfi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thjalfi

## Usage

```bash
$ thjalfi new sample
      create  sample/Gemfile
      create  sample/Rakefile
      create  sample/LICENSE.txt
      create  sample/README.md
      create  sample/.gitignore
      create  sample/sample.gemspec
      create  sample/lib/sample.rb
      create  sample/lib/sample/version.rb
Initializing git repo in /path/to/sample
      create  sample/bin/sample
      create  sample/lib/sample/cli.rb
```

```
$ cd sample/
$ bin/sample 
Commands:
  sample goodbye                 # say goodbye to the world
  sample hello NAME --from=FROM  # say hello to NAME
  sample help [COMMAND]          # Describe available commands or one specific command

Options:
  [--verbose], [--no-verbose]  
```

```
$ bin/sample help hello
Usage:
  sample hello NAME --from=FROM

Options:
  --from=FROM                  
  [--yell], [--no-yell]        
  [--verbose], [--no-verbose]  

say hello to NAME
```

```
$ bin/sample hello world --from arukoh
from: arukoh
Hello world
```

```
$ bin/sample help goodbye
Usage:
  sample goodbye

Options:
  [--verbose], [--no-verbose]  

say goodbye to the world
```

```
$ bin/sample goodbye
Goodbye World
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/thjalfi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
