# 02_scraping_whole_articles
- 各都道府県の全記事を取得する

## requirement
- BeautifulSoup4
- requests

## setup
1. prepare venv and install requirement packages
  - refer [DelftStack article](https://www.delftstack.com/ja/howto/python/python-create-requirements.txt/#pip-%25E3%2583%2591%25E3%2583%2583%25E3%2582%25B1%25E3%2583%25BC%25E3%2582%25B8%25E3%2582%25A4%25E3%2583%25B3%25E3%2582%25B9%25E3%2583%2588%25E3%2583%25BC%25E3%2583%25A9%25E3%2583%25BC%25E3%2582%2592%25E4%25BD%25BF%25E7%2594%25A8%25E3%2581%2597%25E3%2581%25A6-requirements.txt-%25E3%2582%2592%25E4%25BD%259C%25E6%2588%2590%25E3%2581%2599%25E3%2582%258B)
```shell
python3 -m venv venv # at once
source venv/bin/activate
pip3 install -r requirements.txt
```

## start scraping
- execute script
```shell
sh -x 00_get_nikkei_local_articles.sh
```