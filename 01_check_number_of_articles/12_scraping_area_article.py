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

# identify area


def check_area(keylist, title, head):
    area = keylist[0]
    for key in keylist:
        _key_abbr = key[0:(len(key)-1)]
        if (key in head):
            return True
        if (_key_abbr in title):
            return True
    return False

# print Date, Time, Title, Head and Area


def print_article(quote, quote_date):
    # print("#####")
    # title and href
    quote_tmp = quote.find('h3', {"class", "m-miM09_title"})
    quote_atag = quote_tmp.find('span', {"class", "m-miM09_titleL"})
    # print(quote_title.get_text())
    quote_title = quote_atag.get_text()
    # quote_tmp = quote_tmp.find('span',{"class", "m-miM09_titleL"})
    # quote_title = quote_atag.find('a').get_text()
    quote_tmp = quote_tmp.find('a')
    quote_href = base_href + quote_tmp.get("href")
    # keywords
    quote_tmp = quote.find('div', {"class", "m-miM09_keyword"})
    # print(quote_tmp.get_text())
    quote_time = quote_tmp.find('span', {"class", "m-miM09_date"}).get_text()
    # header of article
    quote_tmp = quote.find('p')
    quote_header = quote_tmp.get_text().replace(" ", "", 50)
    # form column
    quote_column = (quote_date + "," + quote_time + "," + quote_href +
                    "," + quote_title + "," + quote_header).replace(" , ", ",", 10)
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

# check number of articles


def extract_pagenation_msg(quote):
    for quote_elem in quote.find_all(["p"]):
        pagenation_msg = quote_elem.get_text()
        # print(pagenation_msg)
        return pagenation_msg


pagenation = soup.find('div', {'class': 'm-pageNation'})
page_msg = extract_pagenation_msg(pagenation)
number_of_articles = page_msg.split('件中')[0]
print(number_of_articles + ' 件')

time.sleep(3)
quit()

# trial each functions
# for quote_elem in contents.find_all("h2", {"class", "m-miM24"}):
#   print_date(quote_elem)

# for quote_elem in contents.find_all("div", {'class', 'm-miM09'}):
#   print_article(quote_elem)

# quit()
