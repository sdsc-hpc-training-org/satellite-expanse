# Satellite Deployment for Expanse

This repo contains the expanse-specific config for satellite
(but not the vpn/wireguard configs which are also necessary).

There's a sub-repo to pull in the upstream satellite repo. To use this either
  ```
  git clone ...
  git submodule update --init
  ```

  or
  `git clone --recurse-submodules ...`


# Deploy

The mkdeployment script will turn the current repo into a production deployment, suitable for `/var/www/satellite`.  This means:
1. Init and update submodule, in case someone forgot to do that.
2. Remove .git directories.
3. Merge upstream and customizations.
4. Set permissions.



