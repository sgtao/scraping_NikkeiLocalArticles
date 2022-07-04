# 00_get_nikkei_local_articles.sh
sh 01_scraping_each_prefecture.sh ;
sh 02_merge_articles.sh | tee outputs/02_merge_log.txt;
# EOF
