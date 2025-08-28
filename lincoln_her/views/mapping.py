from django.views.generic import View
from django.http import HttpResponse, Http404
import requests

from lincoln_her.settings import OS_MASTER_MAP_KEY

class OSMasterMap(View):
    def get(self, request, zoom, x, y):

        try:
            url = f"https://api.os.uk/maps/vector/v1/vts/tile/{zoom}/{y}/{x}.pbf?srs=3857&key={OS_MASTER_MAP_KEY}"
            response = requests.get(url)
            return HttpResponse(response.content, content_type="application/x-protobuf")
        
        except:
            return HttpResponse(status=503)