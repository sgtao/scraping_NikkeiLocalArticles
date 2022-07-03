#!/usr/bin/env python
# -*- coding: utf-8 -*-
# get_nikkei_articles.py
import sys
import requests
from bs4 import BeautifulSoup
import time
import datetime

quote_date = "today"
base_href = "https://www.nikkei.com"
# identify date
def print_today():
  today = datetime.date.today()
  return today.strftime('%-m月%-d日')

def print_date(quote):
  # print('###')
  quote_tmp = quote.find('span', {"class", "m-miM24_text"})
  # print('### ' + quote_tmp.get_text())
  return quote_tmp.get_text()

# print Date, Time, Title and Head
def print_article(quote, quote_date):
  # print("#####")
  # title and href
  quote_tmp = quote.find('h3',{"class","m-miM09_title"})
  quote_atag = quote_tmp.find('span',{"class", "m-miM09_titleL"})
  # print(quote_title.get_text())
  quote_title = quote_atag.get_text()
  # quote_tmp = quote_tmp.find('span',{"class", "m-miM09_titleL"})
  # quote_title = quote_atag.find('a').get_text()
  quote_tmp = quote_tmp.find('a')
  quote_href = base_href + quote_tmp.get("href")
  # keywords
  quote_tmp = quote.find('div', {"class","m-miM09_keyword"})
  # print(quote_tmp.get_text())
  quote_time = quote_tmp.find('span', {"class", "m-miM09_date"}).get_text()
  # header of article
  quote_tmp = quote.find('p')
  quote_header = quote_tmp.get_text().replace(" ", "", 50)
  # form column
  quote_column = (quote_date + "," + quote_time + "," + quote_href + "," + quote_title + "," + quote_header).replace(" , ", ",", 10)
  print(quote_column)
  # print(quote_date, ",", quote_time, ",", quote_title,",", quote_href, ",", quote_header)

#################################################
# start script
#################################################
args = sys.argv

# res = requests.get('https://www.nikkei.com/local/kanagawa/')
res = requests.get(args[1])

soup = BeautifulSoup(res.text, 'html.parser')

title_text = soup.find('title').get_text()
print(title_text)
contents = soup.find('div', {'id': 'CONTENTS_MAIN'})
# print(contents)

# set initial_date
quote_date = print_today()

# quote_elms = contents.find_all('div', {'class': 'm-miM09'})
# quote_elms = contents.find_all()

# print(contents.find_all(["h2", "div"]))
for quote_elem in contents.find_all(["h2", "div"]):
  # print(quote_elem)
  # print_date
  if quote_elem.name == 'h2' and quote_elem.get('class') == ['m-miM24']:
    quote_date = print_date(quote_elem)
  # print_article
  if quote_elem.name == 'div' and quote_elem.get('class') == ['m-miM09']:
    print_article(quote_elem, quote_date)
  #
  # # (temporary) print_number_of_article
  # if quote_elem.name == 'div' and quote_elem.get('class') == ['m-pageNation']:
  #   print("# num of articles: ", quote_elem.find('p').get_text())



time.sleep(3)
quit()

# trial each functions
# for quote_elem in contents.find_all("h2", {"class", "m-miM24"}):
#   print_date(quote_elem)

# for quote_elem in contents.find_all("div", {'class', 'm-miM09'}):
#   print_article(quote_elem)

# quit()




