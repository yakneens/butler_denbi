/share:
  file.directory:    
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True 
    
/etc/fstab:    
  file.append:
    - text: "isiloncl1-486.denbi.bioquant.uni-heidelberg.de:/ifs/denbi/manila-prod/share-392589b8-da18-4c5c-8228-4e16f21b5116      /share       nfs     rw      0 0\n"
    - makedirs: True

mount_shares:
  cmd.run:
    - name: mount -a


      