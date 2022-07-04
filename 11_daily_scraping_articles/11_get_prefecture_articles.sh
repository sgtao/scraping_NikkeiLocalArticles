#!/bin/sh
target=$1;
num_articles=$2;

# set PYTHON
PYTHON=python3
SCRIPT=12_scraping_area_article.py
BASE_URL="https://www.nikkei.com/local/"
FIRST_URL=$BASE_URL$target"/"
# echo $FIRST_URL
# print head of CSV file
echo "Date,Time,URL,article_title,article_head"

# first page
$PYTHON $SCRIPT $FIRST_URL

# python ./nikkei_local_article.py https://www.nikkei.com/local/kanagawa/?bn=21
base_url=$FIRST_URL"?bn="
cnt_no=21; # start
# end_no=20;
# end_no=200;
end_no=$num_articles;

while [ $cnt_no -lt $end_no ] ; do 
  $PYTHON $SCRIPT $base_url$cnt_no; 
  cnt_no=`expr $cnt_no + 20`; 
done

echo "###############################"
echo "\n Copy get articles to CSV file."
