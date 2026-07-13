import re
from django_hosts import patterns, host

host_patterns = patterns(
    "",
    host(re.sub(r"_", r"-", r"lincoln_her"), "lincoln_her.urls", name="lincoln_her"),
)
