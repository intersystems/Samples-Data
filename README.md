# Samples-Data
This is the README file for SAMPLES-DATA. 
The end of the file has setup instructions.
************************************************************************************
Use or operation of this code is subject to acceptance of the license available in the code 
repository for this code.
************************************************************************************
SAMPLES-DATA is meant for use with the InterSystems IRIS.
There are three purposes for these classes:
* To provide sample data that you can query via InterSystems IRIS SQL, for any basic 
  proof-of-concept testing. You can query this data via the SQL shell, via the Management Portal, 
  via JDBC or ODBC, or via server-side code.

* To give you a way to explore some of the basic concepts of InterSystems IRIS object classes.
  Features include serial objects, relationships, indexes, calculated properties, and a class query.

  Because InterSystems IRIS persistent classes let you access data either via SQL or via the object
  methods, this simple set of classes lets you become familiar with creating, retrieving, updating, and 
  deleting data, via either mechanism. You can also use the classes to become familiar with 
  the SQL projections of persistent classes. 

* To provide a simple demonstration of the built-in data population utility (%Library.Populate), which
  you can use to generate data for other proof-of-concept scenarios.

The InterSystems ObjectScript documentation and the InterSystems SQL documentation use these tables and 
classes extensively. 

## Contents of the Sample package
* `Sample.Person` represents a person. This class is projected to SQL as the table `Sample.Person`.
  Of note:
  - The properties `Home` and `Office` are references to the serial object class `Sample.Address`.
  - `Age` is a calculated property.
  - `ByName` is a class query.
* `Sample.Address` is a serial object class, representing a street address. `Sample.Person` uses
  this class as the type of the `Home` and `Office` properties.
* `Sample.Employee` is a subclass of `Sample.Person`. This class is projected to SQL as the table 
  `Sample.Employee`. The records for `Sample.Employee` are also included in the table `Sample.Person`.
* `Sample.Company` represents a company. This class is projected to SQL as the table `Sample.Company`.
  Each company has a relationship properties that connects to the `Sample.Employee` class.
* `Sample.Customer` is another sample serial object class.
* `Sample.Vendor` demonstrates how to use the `%Library.CacheSQLStorage` storage class to provide 
  custom storage for a persistent class.

## Setup instructions

1. Download the repo to your local disk and uncompress it.
2. Open the InterSystems IRIS Terminal.
3. Enter the following command (replacing with the namespace where you want to load the sample):

   ZN "mynamespace"
4. Enter the following commands (replacing with the full path of the buildsample/buildsampledata.mac file):

   do $system.OBJ.Load("full-path-to-buildsampledata.mac","ck")

   do ^buildsampledata
5. Then answer any prompts.
