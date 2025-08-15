-- Create functional layers for all 7 research agenda zones and townscape assessment.

-- Early Modern Research Agenda Zone
CREATE OR REPLACE
FUNCTION public.lincoln_early_modern_agenda_zone(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = 'a4a81528-efa9-11eb-9abd-a87eeabdefba'::uuid AND (tiles.tiledata ->> 'a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Early Modern Research Agenda Zone'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.lincoln_early_modern_agenda_zone IS 'Layer for all Arches Area resources with the protection type "Early Modern Research Agenda Zone".';

-- Roman Military Research Agenda Zone
CREATE OR REPLACE
FUNCTION public.lincoln_roman_military_agenda_zone(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = 'a4a81528-efa9-11eb-9abd-a87eeabdefba'::uuid AND (tiles.tiledata ->> 'a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Roman Military Research Agenda Zone'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.lincoln_roman_military_agenda_zone IS 'Layer for all Arches Area resources with the protection type "Roman Military Research Agenda Zone".';

-- Roman Colonia Research Agenda Zone
CREATE OR REPLACE
FUNCTION public.lincoln_roman_colonia_agenda_zone(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = 'a4a81528-efa9-11eb-9abd-a87eeabdefba'::uuid AND (tiles.tiledata ->> 'a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Roman Colonia Research Agenda Zone'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.lincoln_roman_colonia_agenda_zone IS 'Layer for all Arches Area resources with the protection type "Roman Colonia Research Agenda Zone".';

-- Industrial Research Agenda Zone
CREATE OR REPLACE
FUNCTION public.lincoln_industrial_agenda_zone(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = 'a4a81528-efa9-11eb-9abd-a87eeabdefba'::uuid AND (tiles.tiledata ->> 'a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Industrial Research Agenda Zone'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.lincoln_industrial_agenda_zone IS 'Layer for all Arches Area resources with the protection type "Industrial Research Agenda Zone".';

-- Prehistoric Research Agenda Zone
CREATE OR REPLACE
FUNCTION public.lincoln_prehistoric_agenda_zone(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = 'a4a81528-efa9-11eb-9abd-a87eeabdefba'::uuid AND (tiles.tiledata ->> 'a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Prehistoric Research Agenda Zone'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.lincoln_prehistoric_agenda_zone IS 'Layer for all Arches Area resources with the protection type "Prehistoric Research Agenda Zone".';

-- High Medieval Research Agenda Zone
CREATE OR REPLACE
FUNCTION public.lincoln_high_medieval_agenda_zone(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = 'a4a81528-efa9-11eb-9abd-a87eeabdefba'::uuid AND (tiles.tiledata ->> 'a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'High Medieval Research Agenda Zone'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.lincoln_high_medieval_agenda_zone IS 'Layer for all Arches Area resources with the protection type "High Medieval Research Agenda Zone".';

-- Early Medieval Research Agenda Zone
CREATE OR REPLACE
FUNCTION public.lincoln_early_medieval_agenda_zone(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = 'a4a81528-efa9-11eb-9abd-a87eeabdefba'::uuid AND (tiles.tiledata ->> 'a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Early Medieval Research Agenda Zone'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.lincoln_early_medieval_agenda_zone IS 'Layer for all Arches Area resources with the protection type "Early Medieval Research Agenda Zone".';

-- Lincoln Townscape Assessment
CREATE OR REPLACE
FUNCTION public.lincoln_townscape_assessment(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = '8a7fd81f-ee34-11eb-b34a-a87eeabdefba'::uuid AND (tiles.tiledata ->> '8a7fd828-ee34-11eb-ab43-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['8a7fd828-ee34-11eb-ab43-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Lincoln Townscape Assessment'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.lincoln_townscape_assessment IS 'Layer for all Arches Area resources with the external cross reference source "Lincoln Townscape Assessment".';

-- Conservation Areas
CREATE OR REPLACE
FUNCTION public.afher_conservation_areas(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = 'a4a81528-efa9-11eb-9abd-a87eeabdefba'::uuid AND (tiles.tiledata ->> 'a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['a4a816e6-efa9-11eb-b0de-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Conservation Area'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.afher_conservation_areas IS 'Layer for all Arches Area resources with the protection type "Conservation Area".';

-- Scheduled Monument
CREATE OR REPLACE
FUNCTION public.afher_scheduled_monument(
            z integer, x integer, y integer)
RETURNS bytea
AS $$
    WITH
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
	tile_data AS (
		SELECT geojson_geometries.id, geojson_geometries.geom,
        tiles.tiledata, geojson_geometries.resourceinstanceid 
		FROM geojson_geometries
			LEFT JOIN tiles ON geojson_geometries.resourceinstanceid = tiles.resourceinstanceid
			WHERE tiles.nodegroupid = '6af2a0cb-efc5-11eb-8436-a87eeabdefba'::uuid AND (tiles.tiledata ->> '6af2a0ce-efc5-11eb-88d1-a87eeabdefba'::text) IS NOT NULL		
	),
	extracted_values AS (
        SELECT tile_data.id, tile_data.geom,
        tile_data.resourceinstanceid,
        json_extract_path_text(tile_data.tiledata::json, VARIADIC ARRAY['6af2a0ce-efc5-11eb-88d1-a87eeabdefba'::text]) AS value_uuid
        FROM tile_data
	),
	concept_value AS (
		SELECT extracted_values.id, extracted_values.geom,
        extracted_values.resourceinstanceid,
        "values".value AS val
        FROM extracted_values
            LEFT JOIN "values" ON extracted_values.value_uuid::uuid = values.valueid
			WHERE values.value = 'Scheduled Monument'
	),	
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(geometries.geom, 3857), bounds.geom) AS geom      
      FROM concept_value geometries, bounds
    )
    SELECT ST_AsMVT(mvtgeom, 'default') FROM mvtgeom;
$$
LANGUAGE 'sql'
STABLE
PARALLEL SAFE;

COMMENT ON FUNCTION public.afher_scheduled_monument IS 'Layer for all Arches Monument resources with the protection type "Conservation Area".';
