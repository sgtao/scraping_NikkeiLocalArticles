# 00_get_nikkei_local_articles.sh
#
# prepare batchfile
BATCH_FILE="01_scraping_each_pref.sh"
if [ ! -f $BATCH_FILE ]; then
  cp ../01_check_number_of_articles/outputs/$BATCH_FILE $BATCH_FILE
fi
# prepare log directory
if [ ! -d log ] ; then
  mkdir log
fi
# start scraping
sh -x $BATCH_FILE
# EOF