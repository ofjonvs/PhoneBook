# PhoneBook
Part 2 (PhoneBook class)
In part 2, you will be implementing a PhoneBook class. It is up to you to decide how to store the data (i.e., how to define a phonebook instance's fields) so that you can correctly implement all the required methods.

Even though the data structure you will implement is up to you, keep the following in mind:

The Phonebook will hold names and phone numbers, as well as a note on whether each name and phone number pair is listed or not.
By listed, we mean that they are marked as so (not simply stored). You might want to use a boolean to determine it so.
The Phonebook might contain listed and unlisted entries. How you should add them will be specified in the add method below.
initialize
Description: This is the constructor. You should initialize the fields that you think your class needs for successful evaluation of the remaining methods. We do not test the constructor directly, but we do test it indirectly by testing the remaining methods.
add(name, number, is_listed)
Description: This method attempts to add a new entry to the PhoneBook. name is the name of the person and number is that person's phone number. The is\_listed parameter identifies if this entry should be listed or unlisted in the PhoneBook (true if listed, false if unlisted). Return true if the operation was successful, and false otherwise. Here are the requirements for the add method:

If the person already exists, then the entry cannot be added to the PhoneBook.
If number is not in the format NNN-NNN-NNNN, the entry cannot be added to the PhoneBook.
A number can be added as unlisted any number of times, but can only be added as listed once. This means that if number already exists and is listed in the PhoneBook, the new entry can only be added if the entry will be unlisted.
Type: (String, String, Bool) -> Bool

Assumptions: No phone number will start with 0.

Examples:

@phonebook = PhoneBook.new
@phonebook.add("John", "110-192-1862", false) == true
@phonebook.add("Jane", "220-134-1312", false) == true
@phonebook.add("John", "110-192-1862", false) == false
@phonebook.add("Ravi", "110", true) == false
Here is another example:

@phonebook2 = PhoneBook.new
@phonebook2.add("Alice", "123-456-7890", false) == true
@phonebook2.add("Bob", "123-456-7890", false) == true
@phonebook2.add("Eve", "123-456-7890", true) == true
@phonebook2.add("Rob", "123-456-7890", true) == false
@phonebook2.add("Johnny B. Good", "123-456-7890", false) == true
lookup(name)
Description: Looks up name in the PhoneBook and returns the corresponding phone number in the format NNN-NNN-NNNN ONLY if the entry is listed. Otherwise, return nil.
Type: (String) -> String or nil
Examples:
@phonebook = PhoneBook.new
@phonebook.add("John", "110-192-1862", false) == true
@phonebook.add("Jane", "220-134-1312", true) == true
@phonebook.add("Jack", "114-192-1862", false) == true
@phonebook.add("Jessie", "410-124-1131", true) == true
@phonebook.add("Ravi", "110", true) == false

@phonebook.lookup("John") == nil
@phonebook.lookup("Jack") == nil
@phonebook.lookup("Jane") == "220-134-1312"
@phonebook.lookup("Jessie") == "410-124-1131"
@phonebook.lookup("Ravi") == nil
lookupByNum(num)
Description: Returns the name associated with a given number only if the entry is listed. Otherwise, return nil.
Type: (String) -> String or nil
Examples:
@phonebook = PhoneBook.new
@phonebook.add("John", "110-192-1862", false) == true
@phonebook.add("Jane", "220-134-1312", true) == true
@phonebook.add("Jack", "114-192-1862", false) == true
@phonebook.add("Jessie", "410-124-1131", true) == true

@phonebook.lookupByNum("110-192-1862") == nil
@phonebook.lookupByNum("114-192-1862") == nil
@phonebook.lookupByNum("220-134-1312") == "Jane"
@phonebook.lookupByNum("410-124-1131") == "Jessie"
namesByAc(areacode)
Description: Returns an array of all names in the PhoneBook who have phone numbers beginning with areacode, including unlisted names.
Type: (String) -> Array
Examples:
@phonebook = PhoneBook.new
@phonebook.add("John", "110-192-1862", false) == true
@phonebook.add("Jane", "220-134-1312", true) == true
@phonebook.add("Jack", "114-192-1862", false) == true
@phonebook.add("Jessie", "110-124-1131", true) == true
# Note that Jessie's number here is a little different than in the other examples!

@phonebook.namesByAc("110") == ["John", "Jessie"]
@phonebook.namesByAc("114") == ["Jack"]
@phonebook.namesByAc("111") == []
