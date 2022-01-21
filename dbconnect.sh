#!/bin/bash
PAGER=`which less`
psql 'postgresql://postgres:postgres@localhost:54320/postgres?sslmode=disable'
