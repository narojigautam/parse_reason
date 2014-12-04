Reasons Parser
==============
Simple ruby script to parse out and clean reasons provided in a CSV

Usage
--------------

1. require "./lib/reason_parser"
2. Instantiate the class ReasonParser.new
3. Use method `clean_csv` to generate a cleaned csv
  - This method takes the path to an unclean CSV as its argument
  - It generates a new CSV file with _temp in its name, and adds the cleaned data in it.
