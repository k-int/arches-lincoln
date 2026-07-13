from django.core.management.base import BaseCommand, CommandError
from django.contrib.gis.db.models.functions import Centroid
from django.contrib.gis.geos import GEOSGeometry

from arches.app.models.tile import Resource
from arches.app.models.graph import Graph
from arches.app.models.models import Node
from arches.app.models.card import Card
from arches.app.models.models import CardXNodeXWidget
from arches.settings import SYSTEM_SETTINGS_RESOURCE_ID

import uuid
import json


class Command(BaseCommand):
    """
    Change all resource models geojson-feature-collection nodes to system settings map extent
    """

    def handle(self, *arg, **options):

        sys_settings = Resource.objects.get(pk=SYSTEM_SETTINGS_RESOURCE_ID)
        sys_settings.load_tiles()
        for tiles in sys_settings.tiles:
            if tiles.nodegroup_id == uuid.UUID("0e8fdef0-4148-11e7-8330-c4b301baab9f"):
                map_extent = tiles.data["0e8ffbcf-4148-11e7-a95a-c4b301baab9f"]
                break

        geojson_features = map_extent["features"]
        geojson_geometry = GEOSGeometry(json.dumps(geojson_features[0]["geometry"]))
        centroid = geojson_geometry.centroid

        graphs = Graph.objects.filter(isresource=True).exclude(
            graphid="ff623370-fa12-11e6-b98b-6c4008b05c4c"
        )
        graphs = [x.graphid for x in graphs]

        nodes = Node.objects.filter(
            datatype="geojson-feature-collection", graph_id__in=graphs
        )

        self.set_map_cards_xy(centroid, nodes)
        self.set_gfc_node_syling(nodes)

    def set_map_cards_xy(self, centroid, nodes):
        # Alter all graph map card X & Y configs to centroid of sys settings map extent
        nodegroups = [x.nodegroup_id for x in nodes]
        node_ids = [x.nodeid for x in nodes]
        # Set for card config
        cards = Card.objects.filter(nodegroup_id__in=nodegroups)
        for c in cards:
            c.config["centerX"] = centroid.x
            c.config["centerY"] = centroid.y
            c.save()

        # Set for card_x_node_x_widget config
        cardsxnodesxwidgets = CardXNodeXWidget.objects.filter(node_id__in=node_ids)
        for c in cardsxnodesxwidgets:
            c.config["centerX"] = centroid.x
            c.config["centerY"] = centroid.y
            c.save()

    def set_gfc_node_syling(self, nodes):
        map_styling = {
            "b9e0701e-5463-11e9-b5f5-000d3ab1e588": {
                "addToMap": False,
                # point
                "pointColor": "rgba(19,0,255,0.7)",
                "pointHaloColor": "rgba(19,0,255,0.7)",
                "radius": "2",
                "haloRadius": "4",
                # line
                "lineColor": "rgba(19,0,255,0.7)",
                "lineHaloColor": "rgba(19,0,255,0.7)",
                "weight": "2",
                "haloWeight": "4",
                # polygon
                "fillColor": "rgba(19,0,255,0.7)",
                "outlineColor": "rgba(19,0,255,0.7)",
                "outlineWeight": "2",
            },  # activity
            "076f9381-7b00-11e9-8d6b-80000b44d1d9": {
                "addToMap": False,
                # point
                "pointColor": "rgba(255,0,0,0.5)",
                "pointHaloColor": "rgba(221,34,34,0.5)",
                "radius": "2",
                "haloRadius": "4",
                # line
                "lineColor": "rgba(255,0,0,0.25)",
                "lineHaloColor": "rgba(221,34,34,0.25)",
                "weight": "2",
                "haloWeight": "4",
                # polygon
                "fillColor": "rgba(255,0,0,0.25)",
                "outlineColor": "rgba(221,34,34,0.25)",
                "outlineWeight": "4",
            },  # monument
            "979aaf0b-7042-11ea-9674-287fcf6a5e72": {
                "addToMap": False,
                # point
                "pointColor": "rgba(78,0,240,0.5)",
                "pointHaloColor": "rgba(0,39,255,0.7)",
                "radius": "2",
                "haloRadius": "4",
                # line
                "lineColor": "rgba(78,0,240,0.5)",
                "lineHaloColor": "rgba(0,39,255,0.7)",
                "weight": "2",
                "haloWeight": "4",
                # polygon
                "fillColor": "rgba(78,0,240,0.5)",
                "outlineColor": "rgba(0,39,255,0.7)",
                "outlineWeight": "2",
            },  # area
            "42ce82f6-83bf-11ea-b1e8-f875a44e0e11": {
                "addToMap": False,
                # point
                "pointColor": "rgba(0,255,9,0.7)",
                "pointHaloColor": "rgba(0,255,9,0.7)",
                "radius": "2",
                "haloRadius": "4",
                # line
                "lineColor": "rgba(0,255,9,0.7)",
                "lineHaloColor": "rgba(0,255,9,0.7)",
                "weight": "3",
                "haloWeight": "4",
                # polygon
                "fillColor": "rgba(0,255,9,0.7)",
                "outlineColor": "rgba(0,255,9,0.7)",
                "outlineWeight": "2",
            },  # app area
            "343cc20c-2c5a-11e8-90fa-0242ac120005": {
                "addToMap": False,
                # point
                "pointColor": "rgba(31,240,12,0.7)",
                "pointHaloColor": "rgba(31,240,12,0.2)",
                "radius": "2",
                "haloRadius": "4",
                # line
                "lineColor": "rgba(31,240,12,0.7)",
                "lineHaloColor": "rgba(31,240,12,0.2)",
                "weight": "2",
                "haloWeight": "4",
                # polygon
                "fillColor": "rgba(31,240,12,0.7)",
                "outlineColor": "rgba(31,240,12,0.2)",
                "outlineWeight": "2",
            },  # artefact
            "8d41e49e-a250-11e9-9eab-00224800b26d": {
                "addToMap": False,
                # point
                "pointColor": "rgba(0,255,9,0.7)",
                "pointHaloColor": "rgba(0,255,9,0.7)",
                "radius": "2",
                "haloRadius": "4",
                # line
                "lineColor": "rgba(0,255,9,0.7)",
                "lineHaloColor": "rgba(0,255,9,0.7)",
                "weight": "2",
                "haloWeight": "4",
                # polygon
                "fillColor": "rgba(0,255,9,0.7)",
                "outlineColor": "rgba(0,255,9,0.7)",
                "outlineWeight": "2",
            },  # consultations
            "360a22d8-7097-11ed-b2a8-09a7eb3130f4": {
                "addToMap": True,
                # point
                "pointColor": "rgba(255,0,0,0.7)",
                "pointHaloColor": "rgba(221,34,34,0.5)",
                "radius": "2",
                "haloRadius": "4",
                # line
                "lineColor": "rgba(255,0,0,0.7)",
                "lineHaloColor": "rgba(221,34,34,0.5)",
                "weight": "2",
                "haloWeight": "4",
                # polygon
                "fillColor": "rgba(255,0,0,0.7)",
                "outlineColor": "rgba(221,34,34,0.5)",
                "outlineWeight": "2",
            },  # listed buildings
        }

        for n in nodes:
            if str(n.graph_id) in map_styling.keys():
                n.config["addToMap"] = map_styling[str(n.graph_id)]["addToMap"]
                n.config["pointColor"] = map_styling[str(n.graph_id)]["pointColor"]
                n.config["pointHaloColor"] = map_styling[str(n.graph_id)][
                    "pointHaloColor"
                ]
                n.config["radius"] = map_styling[str(n.graph_id)]["radius"]
                n.config["haloRadius"] = map_styling[str(n.graph_id)]["haloRadius"]
                n.config["lineColor"] = map_styling[str(n.graph_id)]["lineColor"]
                n.config["lineHaloColor"] = map_styling[str(n.graph_id)][
                    "lineHaloColor"
                ]
                n.config["weight"] = map_styling[str(n.graph_id)]["weight"]
                n.config["haloWeight"] = map_styling[str(n.graph_id)]["haloWeight"]
                n.config["fillColor"] = map_styling[str(n.graph_id)]["fillColor"]
                n.config["outlineColor"] = map_styling[str(n.graph_id)]["outlineColor"]
                n.config["outlineWeight"] = map_styling[str(n.graph_id)][
                    "outlineWeight"
                ]
                n.config["clusterMaxZoom"] = 0  # improve performance
                n.save()
