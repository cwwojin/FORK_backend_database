# FORK_backend_database

## Table of Contents

- [FORK\_backend\_database](#fork_backend_database)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Authors](#authors)

---

## Introduction

- This repository is a submodule for [FORK_backend](https://github.com/cwwojin/FORK_backend)
- This repository contains SQL scripts for replication of our database schema

---

## Installation

- DBMS : PostgreSQL
  
### 1. Setup a PostgreSQL Database

### 2. Import the Schema

- Run the SQL script [FORK_public_schema.sql](database/setup/FORK_public_schema.sql)

### 3. (Optional) Run the Seeder to add initial data

1. Run the SQL script [FORK_seeder_preferences.sql](database/seeder/FORK_seeder_preferences.sql)
2. Run the SQL script [FORK_seeder_facilities.sql](database/seeder/FORK_seeder_facilities.sql)

---

## Authors

Woojin Choi <cwwojin@gmail.com> <br/>