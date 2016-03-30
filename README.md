# grinco/btsync

[![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/)

Synchronizes data folders between containers using BitTorrent Sync.

## Usage

    docker run -d grinco/btsync <folder1> <folder2> ... <foldern>

Replacing `<folderi>` with any folder you want to synchronize. Each key will be generated hashing the name of the folder, so this implementation will only scale in LAN mode (as is set in the image).

## Deploy on Docker Cloud

Modify the **volumes_from** list with the name of the service you want to sync and the **target_num_containers** with the number of containers from the service you want to synchronize. If the target service belongs to another stack its service unique name is its service name plus the service stack name, separated by ".".

By default grinco/btsync will syncrhonize all volumes mounted on the containers being created, but you can define the folders to sync as metioned above. All traffic goes through the private network created by Weave.

Another way to use this image in Docker Cloud is to define volumes in the btsync service and make the target service/s do a *volumes_from* to the service. In this case the target service/s will share all volumes defined in the btsync service.

## Notes

* When a file is added to the shared folder, the changes start syncing immediately. However, it can take up to ten seconds to be seen by the other peer.
* If you change a file inside a shared folder, sync will start after the file is saved and/or closed.
* If several people make changes to the same file it is only saved the latest version of the file.

## License

bittorrent Sync has a proprietary license included in:

http://www.bittorrent.com/legal/privacy
http://www.bittorrent.com/legal/terms-of-use
http://www.bittorrent.com/legal/eula
