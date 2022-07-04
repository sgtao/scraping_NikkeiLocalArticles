# 00_get_nikkei_local_articles.sh
#
# prepare for running
WORKING_DIR="11_daily_scraping_articles";
ARTICLE_DIR="articles";
RECENT_FILE="recent_articles.csv";
prepare_directory() {
  if [ ! -d $1 ] ; then
    mkdir $1;
  fi
}
if [ -d $WORKING_DIR ] ; then
  cd $WORKING_DIR;
fi
prepare_directory outputs;
prepare_directory $ARTICLE_DIR;
#
# run scraping
sh 01_scraping_each_prefecture.sh ;
sh 02_merge_articles.sh | tee outputs/02_merge_log.txt;
#
# run scraping
head_str="Date,Time,URL,article_title,article_head";
today_str=` date "+%-m__%-d~~" | sed -e "s/__/月/" -e "s/~~/日/"`;
yesterday_str=` date --date '1 day ago' "+%-m__%-d~~" | sed -e "s/__/月/" -e "s/~~/日/"`;
filter_str="$head_str|$today_str,|$yesterday_str,";
echo $head_str > $ARTICLE_DIR/$RECENT_FILE;
grep -v "$head_str" outputs/02_merge_log.txt >> articles/recent_articles.csv
#
# EOF