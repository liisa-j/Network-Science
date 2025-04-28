echo "[Creating dbmeta table]"
mariadb -D runodb -u runo -prunopw < tables/dbmeta.sql
echo "[Creating p_clust table & inserting]"
mariadb --local-infile=1 -D runodb -u runo -prunopw < tables/p_clust.sql
echo "[Creating p_clust_freq table & inserting]"
mariadb -D runodb -u runo  -prunopw < tables/p_clust_freq.sql
echo "[Creating v_clust table & inserting]"
mariadb --local-infile=1 -D runodb -u runo -prunopw < tables/v_clust.sql
echo "[Creating v_clust_freq table & inserting]"
mariadb -D runodb -u runo  -prunopw < tables/v_clust_freq.sql

echo "[Handling make dbexport]"
make dbexport

echo "[Creating word_freq table & inserting]"
mariadb --local-infile=1 -D runodb -u runo  -prunopw < tables/word_freq.sql
echo "[Creating place_stats table & inserting]"
mariadb --local-infile=1 -D runodb -u runo -prunopw < tables/place_stats.sql

echo "[Done with dbmeta.sh]"