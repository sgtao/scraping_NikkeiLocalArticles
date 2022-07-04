#!/bin/sh
# num_articles=20
num_articles=40
if [ ! -d log ] ; then
  mkdir log
fi
# scraping articles
sh 11_get_prefecture_articles.sh  hokkaido $num_articles | tee log/01_hokkaido.txt
sh 11_get_prefecture_articles.sh  aomori $num_articles | tee log/02_aomori.txt
sh 11_get_prefecture_articles.sh  iwate $num_articles | tee log/03_iwate.txt
sh 11_get_prefecture_articles.sh  miyagi $num_articles | tee log/04_miyagi.txt
sh 11_get_prefecture_articles.sh  akita $num_articles | tee log/05_akita.txt
sh 11_get_prefecture_articles.sh  yamagata $num_articles | tee log/06_yamagata.txt
sh 11_get_prefecture_articles.sh  fukushima $num_articles | tee log/07_fukushima.txt
sh 11_get_prefecture_articles.sh  ibaraki $num_articles | tee log/08_ibaraki.txt
sh 11_get_prefecture_articles.sh  tochigi $num_articles | tee log/09_tochigi.txt
sh 11_get_prefecture_articles.sh  gunma $num_articles | tee log/10_gunma.txt
sh 11_get_prefecture_articles.sh  saitama $num_articles | tee log/11_saitama.txt
sh 11_get_prefecture_articles.sh  chiba $num_articles | tee log/12_chiba.txt
sh 11_get_prefecture_articles.sh  tokyo $num_articles | tee log/13_tokyo.txt
sh 11_get_prefecture_articles.sh  kanagawa $num_articles | tee log/14_kanagawa.txt
sh 11_get_prefecture_articles.sh  niigata $num_articles | tee log/15_niigata.txt
sh 11_get_prefecture_articles.sh  toyama $num_articles | tee log/16_toyama.txt
sh 11_get_prefecture_articles.sh  ishikawa $num_articles | tee log/17_ishikawa.txt
sh 11_get_prefecture_articles.sh  fukui $num_articles | tee log/18_fukui.txt
sh 11_get_prefecture_articles.sh  yamanashi $num_articles | tee log/19_yamanashi.txt
sh 11_get_prefecture_articles.sh  nagano $num_articles | tee log/20_nagano.txt
sh 11_get_prefecture_articles.sh  gifu $num_articles | tee log/21_gifu.txt
sh 11_get_prefecture_articles.sh  shizuoka $num_articles | tee log/22_shizuoka.txt
sh 11_get_prefecture_articles.sh  aichi $num_articles | tee log/23_aichi.txt
sh 11_get_prefecture_articles.sh  mie $num_articles | tee log/24_mie.txt
sh 11_get_prefecture_articles.sh  shiga $num_articles | tee log/25_shiga.txt
sh 11_get_prefecture_articles.sh  kyoto $num_articles | tee log/26_kyoto.txt
sh 11_get_prefecture_articles.sh  osaka $num_articles | tee log/27_osaka.txt
sh 11_get_prefecture_articles.sh  hyogo $num_articles | tee log/28_hyogo.txt
sh 11_get_prefecture_articles.sh  nara $num_articles | tee log/29_nara.txt
sh 11_get_prefecture_articles.sh  wakayama $num_articles | tee log/30_wakayama.txt
sh 11_get_prefecture_articles.sh  tottori $num_articles | tee log/31_tottori.txt
sh 11_get_prefecture_articles.sh  shimane $num_articles | tee log/32_shimane.txt
sh 11_get_prefecture_articles.sh  okayama $num_articles | tee log/33_okayama.txt
sh 11_get_prefecture_articles.sh  hiroshima $num_articles | tee log/34_hiroshima.txt
sh 11_get_prefecture_articles.sh  yamaguchi $num_articles | tee log/35_yamaguchi.txt
sh 11_get_prefecture_articles.sh  tokushima $num_articles | tee log/36_tokushima.txt
sh 11_get_prefecture_articles.sh  kagawa $num_articles | tee log/37_kagawa.txt
sh 11_get_prefecture_articles.sh  ehime $num_articles | tee log/38_ehime.txt
sh 11_get_prefecture_articles.sh  kochi $num_articles | tee log/39_kochi.txt
sh 11_get_prefecture_articles.sh  fukuoka $num_articles | tee log/40_fukuoka.txt
sh 11_get_prefecture_articles.sh  saga $num_articles | tee log/41_saga.txt
sh 11_get_prefecture_articles.sh  nagasaki $num_articles | tee log/42_nagasaki.txt
sh 11_get_prefecture_articles.sh  kumamoto $num_articles | tee log/43_kumamoto.txt
sh 11_get_prefecture_articles.sh  oita $num_articles | tee log/44_oita.txt
sh 11_get_prefecture_articles.sh  miyazaki $num_articles | tee log/45_miyazaki.txt
sh 11_get_prefecture_articles.sh  kagoshima $num_articles | tee log/46_kagoshima.txt
sh 11_get_prefecture_articles.sh  okinawa $num_articles | tee log/47_okinawa.txt
# EOF
