# Summary

This program is a Rails-based application which serves up only an API, responding with JSON.

## Description

This program has the following actions in the following locations:

* /candidates: Based on a candidates table, with at least name, hometown, district, and party attributes
- index action
- show action
* /voters: Based on a voters table, with at least name and party attributes
- create action
- show action, with token authentication to prove that you are the voter
- update action, with token authentication to prove that you are the voter
* /votes: Based on a votes table, with at least voter_id and candidate_id attributes
- Each voter can cast at most one vote, period.
- create action, with token authentication to show that you are the voter
- destroy action, with token authentication to show that you are the voter
- index action (which shows all candidates and a number of votes for each)

## ERD of Table Structure

![alt tag](https://github.com/Ru-T/voting_api/blob/master/ERD.png)
