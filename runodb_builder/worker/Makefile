tmp_dir = data
mysql = mariadb --local-infile=1 -D $(MARIADB_DATABASE) -u $(MARIADB_USER) -p$(MARIADB_PASSWORD)

dbexport: \
  collectors.tbl \
  places.tbl \
  p_col.tbl \
  p_pl.tbl \
  p_year.tbl \
  p_typ.tbl \
  pol_pl.tbl \
  polygons.tbl \
  raw_meta.tbl \
  poems.tbl \
  refs.tbl \
  types.tbl \
  verse_poem.tbl \
  verses.tbl \
  verses_cl.tbl \
  words.tbl \
  word_occ.tbl \
  p_clust.tbl \
  v_clust.tbl \
  word_freq.tbl \
  place_stats.tbl


%.tbl: $(tmp_dir)/%.tbl.csv
	$(mysql) < tables/$*.sql