from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls.i18n import i18n_patterns
from django.urls import include, path, re_path

from .views.mapping import OSMasterMap

urlpatterns = [
    path('', include('arches.urls')),
    path("", include("arches_her.urls")),
    re_path(r"^lincoln-os-master/(?P<zoom>[0-9]+|\{z\})/(?P<x>[0-9]+|\{x\})/(?P<y>[0-9]+|\{y\}).pbf$", OSMasterMap.as_view(), name="lincoln-os-master"),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# if settings.SHOW_LANGUAGE_SWITCH is True:
#     urlpatterns = i18n_patterns(*urlpatterns)
