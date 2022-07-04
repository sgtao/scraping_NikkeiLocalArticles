#!/bin/sh
merge_article() {
  LOG_FILE=$1;
  csvfile=` basename $LOG_FILE | sed -e "s/txt/csv/" `;
  ASSET_DIR="assets"
  ASSET_FILE=$ASSET_DIR/$csvfile;
  MERGE_DIR="log.merged"
  MERGE_FILE=$MERGE_DIR/$csvfile;

  if [ ! -d $MERGE_DIR ] ; then
    mkdir $MERGE_DIR;
  fi

  head_str="Date,Time,URL,article_title,article_head";
  today_str=` date "+%-m__%-d~~" | sed -e "s/__/月/" -e "s/~~/日/"`;
  yesterday_str=` date --date '1 day ago' "+%-m__%-d~~" | sed -e "s/__/月/" -e "s/~~/日/"`;
  filter_str="$head_str|$today_str,|$yesterday_str,";
  echo $filter_str;
  # get article
  # sh $SCRIPTFILE >  $LOGFILE;
  # cat $LOG_FILE | egrep "$head_str|$today_str,|$yesterday_str," | tee $MERGE_FILE;
  cat $LOG_FILE | egrep "$filter_str" | tee $MERGE_FILE;
  # concatinate old articles
  # cat $ASSET_FILE | egrep -v "$head_str|$today_str,|$yesterday_str," >> $MERGE_FILE;
  cat $ASSET_FILE | egrep -v "$filter_str" >> $MERGE_FILE;
}
#
INTERVAL=3;
# merge articles
for logfile in log/*.txt ; do
  echo "#";
  echo "### $logfile"; 
  sleep $INTERVAL; 
  merge_article $logfile; 
done
#
# copy to assets
# echo " => output to $LOG_FILE "
/bin/cp  $MERGE_DIR/* $ASSET_DIR/.

