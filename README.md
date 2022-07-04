# scraping_NikkeiLocalArticles
- Nikkei地域面の記事を参照するためスクレイピングをしてみる

## 手順

### 準備
- １. ４７都道府県の地域記事から公開記事数を取得（`01_check_number_of_articles`）
```shell
cd 01_check_number_of_articles
sh -x 01_scraping_each_prefecture.sh
```

- ２．公開記事数分を取得（`02_scraping_whole_articles`）
```shell
cd 02_scraping_whole_articles
sh -x 00_get_nikkei_local_articles.sh
```

- ３．毎日取得して、追加する環境を構築（`11_daily_scraping_articles`）
  - prepare to scraping
```shell
cd 11_daily_scraping_articles
for file in  ../02_scraping_whole_articles/log/*.txt ; do 
  basename $file; 
  filename=` basename $file `
  title_label=` head ../01_check_number_of_articles/log/$filename`
  csvfile=` echo $filename | sed -e "s/\.txt/\.csv/" `
  grep -v "$title_label" ../02_scraping_whole_articles/log/$filename > assets/$csvfile
done
```
  - run scraping
```shell
cd 11_daily_scraping_articles
sh -x 00_get_nikkei_local_articles.sh
```

### 毎日の記事収集
```shell
sh 11_daily_scraping_articles/00_get_nikkei_local_articles.sh;
# cat 11_daily_scraping_articles/articles/recent_articles.csv # for check recents
```

## LICENSE
MIT LICENSE.
