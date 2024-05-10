- Purpose of core tools
- Gemfile

- Rubygems
- RVM and Rbenv
- Bundler
- Rake
- concentrate on learning what these tools do, and how they fit into your system

- what these tools do, 
- how they do it, 
- how they interact with your computer, and 
- how you can diagnose and even fix problems that arise from their use.
- formulate a mental model of how the pieces fit together

## Ruby Installation

## Linux

- The Ruby installation is found in `/usr/bin` and `/usr/lib/ruby`
- You can determine the system Ruby version with: `$ /usr/bin/ruby -v`
- You can determine where your system finds the ruby command with this command:`which ruby`

## What gets installed with Ruby?

The core library
The standard Library
The irb REPL (Read Evaluate Print Loop)
The rake utility: a tool to automate Ruby development tasks
The gem command: a tool to manage RubyGems
Documentation tools (rdoc and ri)

## Ruby Core Library and Standard Library

There are large libraries of code that come with Ruby installation. It includes the the core library (code that is directly available to your ruby programs) and the standard library that your programs can add into your program if they need to use it by using the keyword `require 'lib name'`.

Gems, on the other hand, are packages of code that you can download and install on your computer and use within your programs or direclty on the commandline. 

## RubyGems

**Purpose**: There are some very common problems that many programmers face while solving problems with Ruby. Since these problems are so common, programmers in the Ruby community have solved these problems and provided their code for other programmers to use to help them solve the same problems. These packages of priwritten code are called RubyGems. The purpose of these Gems is to help programmers be more efficient by using prewritten code by others in their own programs instead of trying to re-invent the wheel.

These packages of code can be downloaded from remote libraries like `RubyGems.org` and installed on our systems. These packages can then be included in our programs by `require`ing them in our programs or, in some cases, use these gems directly from the command line.

The term RubyGems also refers to the system that manages these different packages of code in our system. The RubyGems system for managing Gems comes as part of standard Ruby Installation. We don't need to install it seperately. After installing a Ruby Version, we can use the `gem` command on the terminal to manage existing Gems and install new Gems.

- The `gem` command manages your Gems
- Gems can be downloaded from remote RubyGems Library
- `gem install GEM_NAME` to install the Gem
- `gem` command connects to the remote library, downloads the necessary files and installs the gem.

### Local Library

- When gem installs a Gem, it places the files that comprise the Gem on your local file system in a location where Ruby and your system can find the files and commands it needs. This location is the local library.

### Gems and your file system

- `$ gem env` gives you the information about where the source files of your installed gems are kept
- Ruby Version: associated with the `gem` command that we just ran.
  - Each version of Ruby on a system has its own `gem` command
  - if there are multiple versions of Ruby, then there are multiple versions of gem installed
- Ruby Executable path: location of the `ruby` command that should be used with the Gems associated with the `gem` command we just ran
- Installation directory: where `gem` installs Gems by default, this location varies based on the Ruby Version number
-  INSTALLATION DIRECTORY: /usr/local/rvm/gems/ruby-3.2.1/gems/freewill-1.0.0/lib : when we `require` a gem in a program, this is where Ruby find the `.rb` file and loads it.

-  Gems are installed within a specific Ruby version; in this way, it's possible to install the same Gem for multiple Rubies because they are installed under the Ruby version-specific directory
- `gem` may install Gems in your home directory instead of system level director

-  EXECUTABLE INSTALLATION DIRECTORY: /usr/local/rvm/gems/ruby-3.2.1/bin: Some gems provide a command that can be run in the command prompt directly. The executable files for these commands are found in this directory.

- The shell;s `PATH` variable tells our shell where to look for executable files for a command we are running. 

## Ruby Version Managers

Ruby is continuosly improved and new versions of Ruby (with new features added and old ones becoming obsolete) are released every few months. Programmers are usually working on multiple projects at the same time each of which relies on a specific version of Ruby  i.e. the standardized version of Ruby for that project. There might be some other applications/projects that rely on old features that are only available in previous versions of Ruby and some applications/projects that rely on new features available in newer versions only.  

So multiple versions of Ruby are required by programmers on the same system as different projects they are working on have different requirements. But operating systems only allow one version of Ruby to be run known as the 'System Ruby'. 

This problem is solved by programs that are known as Ruby Version Managers that help programmers install, manage and use multiple versions of Ruby (and associated tools and libraries known as RubyGems) on the same computer system. There are two major Ruby Version Managers prevalent in the Ruby Community i.e. RVM and Rbenv. Using Ruby Version Managers we cxn install multiple versions of Ruby and switch between versions as needed.

Each installation of Ruby under a Ruby Version Manager has its own set of Ruby tools and Ruby Gems. Each Ruby version has access to only those Ruby Gems and tools that are installed under that Ruby version. So a RubyGem that is required by two different Ruby Versions needs to be installed under both of them.

## Bundler

Each software project or software application has its own set of dependencies. Dependencies are other software programs that a particular project or application relies on to work as expected.

Ruby projects also have their own dependencies which includes specific versions of Ruby, specific versions of RubyGems and other tools. Although Ruby Version Managers can potentially manage these dependencies, the more favored approach among the Ruby community is using a Dependency Manager e.g. Bundler.

A dependency manager like Bundler helps to configure the differnt versions of Ruby and RubyGems that each of our Ruby project uses. It relies on the Ruby Version Manager to provide the different versions of Ruby and RubyGems. You might have multiple versions of a RubyGem installed under one Ruby Version. Bundler helps to load the proper version which is requried by your application. Bundler is itself a RubyGem as well.

Bundler uses a `Gemfile` to help configure which version of Ruby and RubyGems will be used when a particular project is run. A `Gemfile` is a Ruby program that uses a DSL to specify the Ruby Version and the RubyGems (and their versions). 
It provides the instructions to Bundler about which specific Ruby Version and which specific RubyGems and their versions to install for a particular project and the sourse from which to download them from if they are not already present.

When the `bundle install` command is run in a directory that contains a `Gemfile`, Bundler goes through the `Gemfile` and installs any Gems that are not already installed in the Ruby Version specified by the `Gemfile`. It also installs any Gems that Gems specified in our `Gemfile` depend on. It does so by scanning the `Gemfile` for each of the Gems listed in our `Gemfile`. It then creates a `Gemfile.lock` file in the same directory. This file specifies the Ruby version that will be loaded when our project is run and all the versions of the Gems that will be loaded. When a project or appiication is run, Bundler uses the `Gemfile.lock` to load the proper version of Ruby and RubyGems.

## Rake

Rake is a tool used to automate tasks associated with developing, testing, packaging, and installing Ruby programs. It is a RubyGem that nearly all Ruby projects or applications use for task automation. 

When working on any non-trivial project or application that will be used by other people in the future or by ourselves, there are many repetetive tasks that need to be perfomed in a pariticular order by the developer to build, test, package and release the application and its future versions. Performing these tasks manually could lead to potential problems and bugs within the application due to human errors. In order to avoid these issues, it is much better to automate these tasks and be able to run them with just one command. Rake is a RubyGem that is used by almost all Ruby Projects to automate these task and to be able to work on these projects, we need to use Rake as well.

Rake tasks are defined in a `Rakefile` which is a Ruby program using a DSL specific to Rake for task automation. This `Rakefile` is kept in the Main Project directory. We can run tasks defined in the `Rakefile` by simple using the command `rake task_name` in the terminal.