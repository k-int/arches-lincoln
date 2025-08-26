from django.core.management.base import BaseCommand, CommandError
from django.contrib.gis.db.models.functions import Centroid
from django.contrib.gis.geos import GEOSGeometry

from arches.app.models.models import Concept as modelConcept
from arches.app.models.concept import Concept
import uuid
import json


class Command(BaseCommand):
    """
    Remove all default AfHER letter template concepts from the RDM. 
    HER specific letter template concepts will be loaded via the project package.
    """

    def handle(self, *arg, **options):
        
        afher_letter_template_concepts = {
            "ca43d87a-b24d-4b1b-ab76-f4be8897064b": "Letter A",
            "bd7c5340-959a-4304-b17a-045d2eded709": "Letter A2",
            "47be4549-8416-4c7b-95fb-e112bb3c2a3d": "Letter B1",
            "b09485e2-0478-48f2-a17b-30a0befb4623": "Letter B2",
            "3a549779-bf62-4ee5-aae1-f64199d8b754": "Letter C",
            "b9469f82-2a7c-4fc4-8895-2a38b42729f5": "Letter D1",
            "3b8d87c6-4576-4012-8fc1-3b5839669732": "Letter D2",
            "27e4efc0-9739-40e9-a633-ec7dd0e1615e": "Letter D3",
            "025eba24-b853-441e-90f4-534a31678119": "Letter F1",
            "42fe5641-6a74-480f-9150-eab87d505c41": "Letter F2",
            "9f83a934-d2e1-4c42-a77c-c41db041abe1": "Letter G - PXA Approval",
            "7d65ef3a-ca85-4c78-9872-be58bae817f8": "Letter H",
            "e34c66c2-5da2-49a4-9be9-d538148da5e6": "Letter I - Bespoke Letter",
            "eb9693f4-c947-492d-84fe-0f88de3fbec7": "Additional Condition Text",
            "6a1db0e0-febe-4cb6-b0ee-5b6236d088af": "Archaeological Recommendation Text",          
        }

        for letter_template_uuid in afher_letter_template_concepts.keys():
            concept = modelConcept.objects.get(conceptid=letter_template_uuid)
            concept.delete()
