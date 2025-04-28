CREATE VIEW runo2 as
SELECT p_pl.p_id AS poem_id, poems.display_name, p_pl.pl_id AS kihelkonna_id, places.name AS Kihelkond, types.name, types.t_id AS tyyp_id 
FROM p_pl, places, p_typ, poems, types
WHERE p_pl.pl_id IN (SELECT pl_id FROM places WHERE places.TYPE = 'parish' AND places.place_orig_id LIKE '%erab%') 
AND LENGTH(types.type_orig_id) = 14 
AND p_pl.pl_id = places.pl_id AND  p_typ.t_id = types.t_id AND p_pl.p_id = p_typ.p_id AND poems.p_id = p_pl.p_id

