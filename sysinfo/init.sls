{% set out_dir = pillar.get('out_dir','/tmp/outputdata/') %}

check_or_create_out_dir:
  file.directory:
    - name: {{ out_dir }}
    - makedirs: True

save_cpuinfo:
  file.copy:
    - name: {{ out_dir }}/proc_cpuinfo.txt
    - source: /proc/cpuinfo
    - requires: 
      - check_or_create_out_dir

save_meminfo:
  file.copy:
    - name: {{ out_dir }}/proc_meminfo.txt
    - source: /proc/meminfo
    - requires: 
      - check_or_create_out_dir
  


  

