# Copies public key to salt clients

? AAAAB3NzaC1yc2EAAAADAQABAAABAQDXlmuVzPBvChYNj25khXoySjSR7r9nezEvIfrFEn5ZnJkmViBXDL1vXCfFELV6Y73uNcOHltjbnFNN1sK1PLIVLBCPb1V/avjUNaNMReYPtSgBaFZKUatrn6QL16aYsX/I4Mk5ZNFAVGbZMx9zYh0n1VXwe4Ja4fd7PTRLCoc25xOwQCTXl90SsHusDuysOxpK8ax40j+pT8b9d1293jRRFrAr50iA88Ofq1x97GwfS+Kn9a03uPliVMjfJET6KSAqDpr1iWphYyN2pXlvYSKo+F4YME9FoEH2ieIUjWuye2sf11fi+mbhk5+5DHqgN9L1zCv2CQIu5Pwx7jITw5vv 
:
  ssh_auth.present:
    - user: ssops
    - enc: ssh-rsa
