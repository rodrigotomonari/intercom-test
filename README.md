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

To run the tests just run:

```
bundle install
rake test 
```
