# SBL Verses

[Last Release](https://github.com/theDeniZ/SBL-Verses/releases)

SBL Verses is an app created to assist in adding a vast amount of Bible verses into a Lesson book.

### Workflow

 - Open a file (most likely a html file, but other text file will also do)
 - Specify a template. It can be either English, German or Russian
 - If needed, expand the detail settings page and change needed requirements. See more in chapter "Detail settings"
 - Process the file. The progress will be shown in the app, the current logs are now printed into Console
 - Save the file replacing the one you opened

### General info

The app is just an advanced 'Search and replace' app: It searches some text using regex and replaces it with the same text + found bible verses from this text. 
You can specify which bible version is to be used, which file language is it, which regex is used to find stuff, how end result is formatted

### Detail settings

In the detail settings you can specify Regex. It will be used to find

 - a question in the file
 - all verses in the question
 - the name of the book in each verse
 
Please note: The Question Regex is the one responsible for finding all the question lines, the Verse Regex responsible for Verses inside of a question, the Book Regex finds all books inside of an line of Verses.
 
The Verse Regex is the complicated one: it should be versatile enough to find all possible verses in each question. Such syntax like "Genesis 1:4; 3:1-5, 10, 15-17; Exodus 25:10; 1 Kings 1:1." should be found completely. 


The last detail section is dedicated to formatting the output verses. First 2 textfields control the container of all verses, second 2 - container of each verse, last one - formatting of verse location. 

