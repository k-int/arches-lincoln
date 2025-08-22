-- Remove sources and layers to begin, so we can update without conflicts
DELETE FROM map_sources WHERE name IN ('early_modern_agenda_zone', 'roman_military_agenda_zone', 'roman_colonia_agenda_zone', 'industrial_agenda_zone', 'prehistoric_agenda_zone', 'high_medieval_agenda_zone', 'early_medieval_agenda_zone', 'townscape_assessment', 'conservation_areas', 'scheduled_monument');
DELETE FROM map_layers WHERE maplayerid in ('140224c1-c84c-4453-8651-b66d510f0808', '4e5ead2f-61fc-4a4f-afaa-6ad8b3399906', '6772c1be-162c-401a-97f3-38968ed9a575', '4db660e0-44df-4f73-8cfa-60936c6b01b8', '38936e09-cd6b-4255-a787-e2d14262bce7', 'f4a65290-99d5-417b-9869-d31cb6648b99', 'b0a9e0e4-3682-478a-992f-7a20141f9b86', '84fab551-8b38-432c-9e51-9ffd5581e2f8', 'a7dfee7a-8596-46c5-bae2-53c0dd1441a5', '4fdc7fb2-f871-4508-aec9-c05b3edb0c4c');

-- Early Modern Research Agenda Zone
INSERT INTO map_sources(name, source)
VALUES ('early_modern_agenda_zone', '{"type": "vector", "tiles": ["/pgtileserv/public.lincoln_early_modern_agenda_zone/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('140224c1-c84c-4453-8651-b66d510f0808', 
           'Early Modern Agenda Zone', 
           '[{"id": "early_modern_agenda_zone", "type": "fill", "paint": {"fill-color": "red", "fill-opacity": 0.25, "fill-outline-color": "black"}, "source": "early_modern_agenda_zone", "source-layer": "default"}]', 
           TRUE,
           'fa fa-location-arrow',
           TRUE,
           FALSE,
           FALSE,
           0,
           TRUE
           );

-- Roman Military Research Agenda Zone
INSERT INTO map_sources(name, source)
VALUES ('roman_military_agenda_zone', '{"type": "vector", "tiles": ["/pgtileserv/public.lincoln_roman_military_agenda_zone/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('4e5ead2f-61fc-4a4f-afaa-6ad8b3399906', 
           'Roman Military Agenda Zone', 
           '[{"id": "roman_military_agenda_zone", "type": "fill", "paint": {"fill-color": "red", "fill-opacity": 0.25, "fill-outline-color": "black"}, "source": "roman_military_agenda_zone", "source-layer": "default"}]', 
           TRUE,
           'fa fa-location-arrow',
           TRUE,
           FALSE,
           FALSE,
           0,
           TRUE
           );

-- Roman Colonia Research Agenda Zone
INSERT INTO map_sources(name, source)
VALUES ('roman_colonia_agenda_zone', '{"type": "vector", "tiles": ["/pgtileserv/public.lincoln_roman_colonia_agenda_zone/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('6772c1be-162c-401a-97f3-38968ed9a575', 
           'Roman Colonia Agenda Zone', 
           '[{"id": "roman_colonia_agenda_zone", "type": "fill", "paint": {"fill-color": "red", "fill-opacity": 0.25, "fill-outline-color": "black"}, "source": "roman_colonia_agenda_zone", "source-layer": "default"}]', 
           TRUE,
           'fa fa-location-arrow',
           TRUE,
           FALSE,
           FALSE,
           0,
           TRUE
           );

-- Industrial Research Agenda Zone
INSERT INTO map_sources(name, source)
VALUES ('industrial_agenda_zone', '{"type": "vector", "tiles": ["/pgtileserv/public.lincoln_industrial_agenda_zone/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('4db660e0-44df-4f73-8cfa-60936c6b01b8', 
           'Industrial Agenda Zone', 
           '[{"id": "industrial_agenda_zone", "type": "fill", "paint": {"fill-color": "red", "fill-opacity": 0.25, "fill-outline-color": "black"}, "source": "industrial_agenda_zone", "source-layer": "default"}]', 
           TRUE,
           'fa fa-location-arrow',
           TRUE,
           FALSE,
           FALSE,
           0,
           TRUE
           );

-- Prehistoric Research Agenda Zone
INSERT INTO map_sources(name, source)
VALUES ('prehistoric_agenda_zone', '{"type": "vector", "tiles": ["/pgtileserv/public.lincoln_prehistoric_agenda_zone/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('38936e09-cd6b-4255-a787-e2d14262bce7', 
           'Prehistoric Agenda Zone', 
           '[{"id": "prehistoric_agenda_zone", "type": "fill", "paint": {"fill-color": "red", "fill-opacity": 0.25, "fill-outline-color": "black"}, "source": "prehistoric_agenda_zone", "source-layer": "default"}]', 
           TRUE,
           'fa fa-location-arrow',
           TRUE,
           FALSE,
           FALSE,
           0,
           TRUE
           );

-- High Medieval Research Agenda Zone
INSERT INTO map_sources(name, source)
VALUES ('high_medieval_agenda_zone', '{"type": "vector", "tiles": ["/pgtileserv/public.lincoln_high_medieval_agenda_zone/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('f4a65290-99d5-417b-9869-d31cb6648b99', 
           'High Medieval Agenda Zone', 
           '[{"id": "high_medieval_agenda_zone", "type": "fill", "paint": {"fill-color": "red", "fill-opacity": 0.25, "fill-outline-color": "black"}, "source": "high_medieval_agenda_zone", "source-layer": "default"}]', 
           TRUE,
           'fa fa-location-arrow',
           TRUE,
           FALSE,
           FALSE,
           0,
           TRUE
           );

-- Early Medieval Research Agenda Zone
INSERT INTO map_sources(name, source)
VALUES ('early_medieval_agenda_zone', '{"type": "vector", "tiles": ["/pgtileserv/public.lincoln_early_medieval_agenda_zone/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('b0a9e0e4-3682-478a-992f-7a20141f9b86', 
           'Early Medieval Agenda Zone', 
           '[{"id": "early_medieval_agenda_zone", "type": "fill", "paint": {"fill-color": "red", "fill-opacity": 0.25, "fill-outline-color": "black"}, "source": "early_medieval_agenda_zone", "source-layer": "default"}]', 
           TRUE,
           'fa fa-location-arrow',
           TRUE,
           FALSE,
           FALSE,
           0,
           TRUE
           );

-- Lincoln Townscape Assessment
INSERT INTO map_sources(name, source)
VALUES ('townscape_assessment', '{"type": "vector", "tiles": ["/pgtileserv/public.lincoln_townscape_assessment/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('84fab551-8b38-432c-9e51-9ffd5581e2f8', 
           'Lincoln Townscape Assessment', 
           '[{"id": "lincoln_townscape_assessment", "type": "fill", "paint": {"fill-color": "red", "fill-opacity": 0.25, "fill-outline-color": "black"}, "source": "lincoln_townscape_assessment", "source-layer": "default"}]', 
           TRUE,
           'fa fa-location-arrow',
           TRUE,
           FALSE,
           FALSE,
           0,
           TRUE
           );

-- Conservation Areas
INSERT INTO map_sources(name, source)
VALUES ('conservation_areas', '{"type": "vector", "tiles": ["/pgtileserv/public.afher_conservation_areas/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('a7dfee7a-8596-46c5-bae2-53c0dd1441a5', 
           'Conservation Areas', 
           '[{"id": "conservation_areas", "type": "fill", "paint": {"fill-color": "rgba(59,76,232,0.5)", "fill-opacity": 0.5, "fill-outline-color": "rgba(59,76,232,0.5)"}, "source": "conservation_areas", "source-layer": "default"}]', 
           TRUE,
           'fa fa-map-marker',
           TRUE,
           TRUE,
           FALSE,
           0,
           TRUE
           );

-- Scheduled Monument
INSERT INTO map_sources(name, source)
VALUES ('scheduled_monument', '{"type": "vector", "tiles": ["/pgtileserv/public.afher_scheduled_monument/{z}/{x}/{y}.pbf"], "maxzoom": 22, "minzoom": 0}');

INSERT INTO map_layers(maplayerid, name, layerdefinitions, isoverlay, icon, activated, addtomap, searchonly, sortorder, ispublic)
   VALUES ('4fdc7fb2-f871-4508-aec9-c05b3edb0c4c', 
           'Scheduled Monument', 
           '[{"id": "scheduled_monument", "type": "fill", "paint": {"fill-color": "rgba(232,59,59,0.5)", "fill-opacity": 0.5, "fill-outline-color": "rgba(232,59,59,0.5)"}, "source": "scheduled_monument", "source-layer": "default"}]', 
           TRUE,
           'fa fa-map-marker',
           TRUE,
           TRUE,
           FALSE,
           0,
           TRUE
           );
