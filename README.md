# Challenge 3

## Idea
This repository contains a web service that checks two date values against each other.

## Setup

* clone this repository
* `docker-compose build`
* `docker-compose up`

## Query the Web Service

* In the `docker-compose.yml` the value for `DATE_FIX` is set to `2021-03-15`

Example 2021-03-10 with a 6 day period: 
```
curl --header "Content-Type: application/json" --request POST --data '{"datum":1615392481}' http://localhost:30000/validator/check_date/6

output:
ch3-app    | Started POST "/validator/check_date/6" for 172.19.0.1 at 2021-03-31 21:10:07 +0000
ch3-app    | Processing by ValidatorController#check_date as */*
ch3-app    |   Parameters: {"datum"=>1615392481, "valid_days"=>"6", "validator"=>{"datum"=>1615392481}}
ch3-app    | Completed 204 No Content in 1ms (Allocations: 205)
```

Example 2021-03-10 with a 3 day period: 
```
curl --header "Content-Type: application/json" --request POST --data '{"datum":1615392481}' http://localhost:30000/validator/check_date/3

output:
ch3-app    | Started POST "/validator/check_date/3" for 172.19.0.1 at 2021-03-31 21:11:29 +0000
ch3-app    | Processing by ValidatorController#check_date as */*
ch3-app    |   Parameters: {"datum"=>1615392481, "valid_days"=>"3", "validator"=>{"datum"=>1615392481}}
ch3-app    | Das eingegebene Datum ist nur gültig im Bereich von 12.03.2021 bis 18.03.2021.
ch3-app    | Completed 204 No Content in 2ms (Allocations: 208)
```
