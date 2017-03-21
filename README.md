# PROBLEM INSTRUCTIONS

For brevity, we will stick to just models here. Do not worry about controllers or routing or acceptance testing.   You can use default SQLite and not even start a server.  

I created a FileLoad model, with tests, that loads a csv file when created.   (This is a highly simplified version of a file-based data importer, which is important to MEC.)     Right now, it just loads the data into the "results" column.   

## Problem steps: 

### 0. Clone the repo and set up  
Optional:  fork and clone, then submit as pull request in step 3.  
bundle install should set you up

### 1. Store the data being read
* Create a new food shop model, with basic tests, to store the data seen in the test file.           
    * The model should store the column names seen in FileLoad#load_file. 
    * name and code should be required
* change the FileLoad model to actually save the data

### 2. Adapt FileLoad to *also* handle a different file format
* Add a field to FileLoad to indicate the format.   
* new format:  test/fixtures/file/service-vendors.csv
* create a new model, or modify the food shop model.  
  * the merchant code should be created by combining group & member with a hyphen, e.g. "77-2435"
  * instead of food_type, there "service_type" column should hold a readable combination of the two Service columns, e.g. "Tech Hosting".
  * name and code should still be required

Again, there should be some core tests for these.  If you run out of time in the hour, you can first ask for 15min more.   Soon after that, you can submit what you have, and we can just discuss the next steps.  

### 3. commit and push
If you forked, push to your own, then submit a pull request to mine.  


### 4. discuss

In addition to anything remainin from 1 & 2, we will discuss potential approaches to moving forward with this multi-format importer.  
* How might you handle invalid entries, like a non-unique merchant code?  
* How might you expand the merchant types, DRYly?   e.g.,  after Food Shop and Service, there were then Restaurants and Electrical stores, etc, each with some overlapping and some custom fields.   








