#!/bin/sh
# 21_split_article_each_year.sh
SCRIPT_NAME=` basename $0 `;
usage() {
  echo "
$SCRIPT_NAME <+|-> <year> <csvfile> 
  +|- : ommit flag. when + , extract year. when - , omit year
  year : [2017,2018,2019,2020,2021]
  csvfile : article file of economy, bussiness and technology
"
}
#
# varidate argments
omitflag=$1;
year=$2;
csvfile=$3;
if [ $# -lt 3 ]; then
  usage; exit 1;
fi
if [ ! -f $csvfile ]; then
  usage; exit 1;
fi
#
grep_str="$year年..月..日,"
echo "$grep_str" match articles : ;
#
grep -c "$grep_str" $csvfile
if [ $? -ne 0 ] ; then
    exit 1;
fi
#
# prepare extract articles
csvfilename=` basename $csvfile `;
outputpath="$year/$csvfilename"
if [ ! -d $year ] ; then
    mkdir $year;
fi
head -1 $csvfile > $outputpath;
if [ "$omitflag" = "+" ]; then
    grep "$grep_str" $csvfile >> $outputpath;
    echo "# output matched articles to $outputpath";
else
    grep -v "$grep_str" $csvfile > $outputpath;
    echo "# output un-matched articles to $outputpath";
fi
exit 0;
#
# EOF
