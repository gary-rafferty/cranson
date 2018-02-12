# Cranson

A lightweight parser for Irish planning applicatons.
Currently supports parsing applications for the following authorities.
* Fingal ([dataset](http://data.fingal.ie/datasets/xml/Planning_Applications.xml))
* Dublin City Council ([dataset](http://opendata.dublincity.ie/PandDOpenData/DCC_PlanApps.csv))

The endgoal here is to provide a better way of retrieving and searching for planning applications. The current offering is clunky and awkward.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cranson'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cranson

## Usage

The parser implements the Observer pattern, and you should subscribe using a class that responds to an `update` method.

```ruby

class Observer

  # this method will be invoked with a
  # planning application object when one
  # has been parsed
  def update(planning_app)
    p planning_app
  end
end
```

Fingal applications are stored in XML format and parsed using a sax parser.  
Usage:
```ruby
fingal_document = Cranson::Parsers::Fingal.new              # instantiate the document parser
fingal_document.add_observer(Observer.new)                  # and then add your observer
fingal_parser = Nokogiri::XML::SAX::Parser.new(document)    # instantiate the sax parser
fingal_parser.parse(File.open("./input/fingal_1216.xml"))   # parse the file
```

Dublin City Council applications are stored in CSV format and parsed by iterating over rows.  
Usage:
```ruby
dcc_parser = Cranson::Parsers::Dcc.new                      # instantiate the document parser
dcc_parser.parse(File.open("./input/dcc_0218.csv"))         # parse the file
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gary-rafferty/cranson


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

