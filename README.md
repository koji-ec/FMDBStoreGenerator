[![Build Status](https://travis-ci.org/ko2ic/FMDBStoreGenerator.png?branch=master)](https://travis-ci.org/ko2ic/FMDBStoreGenerator)
Source Generator For FMDB
======================
This is a macosx application that generates many program sources for FMDB.

# Features #
* Generation of Entity and Store Class (include basic data handling method) for FMDB.
* Generation of Core Class that will be become easy to use transaction and handle db data .
* Convention over configuration.(generated by rule of table name and column name)

It will become unnecessary to write simple code for handling a database.  
these have already been prepared as follows,
```
- (id) findByPk:(id) entity;
- (NSMutableArray*) findAll;
- (BOOL) insert: (id) entity;
- (BOOL) insertWithAutoIncrementPk:(id) entity;
- (int) insertAll: (NSArray*) entities;
- (BOOL) update: (id) entity;
- (BOOL) updateExcludesNil: (id) entity;
- (int) updateAll: (NSArray*) entities;
- (BOOL) deleteByPk: (id) entity;
- (BOOL) deleteAll;
```

# Installation #
` git clone https://github.com/ko2ic/FMDBStoreGenerator.git `

# Usage #
1. open "FMDBStoreGenerator.xcworkspace" with Xcode.
1. run application. (⌘ + R)
1. specify path of "SQLite File" that create table in advance.
1. specify path of "Output Directory" that generates program sources.
1. specify "Class Prefix" of all generated sources.
1. specify "Store Class Prefix" of generated database access object class. 
1. specify "Entity Class Prefix" of generated entity class.
![ScreenShot](https://raw.github.com/ko2ic/ImageRepository/master/FMDBStoreGenerator/screenshot.png) 
1. press generate button.
1. put generated sources to a target project in XCode.



# Convention #
* If table and column Name is snake case, source will become camel case.
* If prefix of table is "t_" (that means transaction table), it will be removed in sources.
* If prefix of table is "m_" (that means master table), it will be added as suffix.
* If column name is "id", it will be table name + id.
* If column name contains "DateTime", type will be NSDate.
* If column name contains "Flag", type will be BOOL.
* If column type is INTEGER, type will be NSInteger.
* If column type is REAL, type will be NSNumber.
* If column type is TEXT, type will be NSString.

# Sample #
https://github.com/ko2ic/FMDBStoreGeneratorSample  
this is sample Project that made by FMDBStoreGenerator.

especially, it will become easy to understand by comparing sqlite file and generated sourse.
https://github.com/ko2ic/FMDBStoreGeneratorSample/blob/master/FMDBStoreGeneratorSample/Supporting%20Files/Sample.sqlite

# License #
MIT License

