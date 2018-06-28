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

- I architected the application so that it is easy to maintain and add new features. Also took into account how it
  can go forward.
- I assumed the customers.txt file would be read from the local machine. But as the application was architected, it
  would be easy to read the data from others source, such as a remote URL. Just need to create a new Reader class that
  implements the "rows" methods.
- As the output format was not explicitly specified, I outputted using tabulation. But it would be simple to add other
  output formats. Just need to create a new output decorator class.


## THE TEST

Customer Records

We have some customer records in a text file (customers.txt) -- one customer per line, JSON lines formatted. We want
to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read
the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

- You can use the first formula from this Wikipedia article to calculate distance. Don't forget, you'll need to convert
  degrees to radians.
- The GPS coordinates for our Dublin office are 53.339428, -6.257664.
- You can find the Customer list here.

We're looking for you to produce working code, with enough room to demonstrate how to structure components in a small program.

- Poor answers will be in the form of one big function. It’s impossible to test anything smaller than the entire
  operation of the program, including reading from the input file. Errors are caught and ignored.
- Good answers are well composed. Calculating distances and reading from a file are separate concerns. Classes or
  functions have clearly defined responsibilities. Test cases cover likely problems with input data.
- It’s an excellent answer if we've learned something from reading the code.

We recommend you use whatever language you feel strongest in. It doesn't have to be one we use!

Please submit code as if you intended to ship it to production. The details matter. Tests are expected, as is well
written, simple idiomatic code.
