# Intercom Coding Test

## Code Status

[![Build Status](https://travis-ci.org/rodrigotomonari/intercom-test.svg?branch=master)](https://travis-ci.org/rodrigotomonari/intercom-test)

### Requirements

- Ruby +2.0

No especial library or GEM was used.


### Usage

```
cd project_folder
ruby bin/main.rb
```

or

``` 
chmod +x bin/main.rb
./bin/main.rb
```

The application is configured to use the `customers.txt` file located in the root path 
of the project folder.

An optional parameter can be used to read from another file.
 
```
ruby bin/main.rb PATH_TO_FILE
```

### Tests

To run the test suite:

```
bundle install
rake test 
```

### My considerations:

- I architect the application so that it is easy to maintain and add new features. Also took into account how it can go forward.
- I assumed the customers.txt file would be read from the local machine. But as the application was architected, it would be easy to read the data from others source, such as a remote URL. Just need to create a new Reader class that implements the "rows" methods.
- As the output format was not explicitly specified, I outputted using tabulation. But it would be simple to add other output formats. Just need to create a new output decorator class.
