
{% from "sysinfo/map.jinja" import sysinfo as sysinfo_map with context %}
{% set out_dir = sysinfo_map.get('out_dir','/tmp/outputdata/') %}
{% set files = sysinfo_map.get('files','[]') %}

check_or_create_out_dir:
  file.directory:
    - name: {{ out_dir }}
    - makedirs: True

{% for file in files %}
copy_a_file_{{ file }}:
  file.copy:
    - source : {{ file }}
    - name: {{ out_dir }}/{{ file }}
    - requires: 
      - check_or_create_out_dir
    - makedirs:
      - True
    - subdir:
      - True
{% endfor %}
