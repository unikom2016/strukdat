#!/usr/bin/env python

import string

def create(data):
  for n in range(0,5):
    data.append(0)

def traverseInput(data):
  for i in range(0,5):
    data.append(raw_input("Fill your data: "))

def traverseShow(data):
  for x in range(0,5):
    print(data[x])

def swap(dataA, dataB):
  temp = dataA
  dataA = dataB
  dataB = temp

def sortBubble(data):
  for i in range(0,5):
    for j in range(0, i):
      swap(data[j + 1], data[j])
    

list = []
create(list)
traverseInput(list)
traverseShow(list)