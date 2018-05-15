from django.conf.urls import include, url
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    url(r'^', include('arches.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
