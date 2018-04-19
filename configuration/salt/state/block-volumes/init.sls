/dev/vdb:
  blockdev.formatted:
    - fs_type: ext4

/mnt/vol1:
  mount.mounted:
    - device: /dev/vdb
    - fstype: ext4
    - mkmnt: True
    - opts:
      - defaults