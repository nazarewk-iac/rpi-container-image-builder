FROM nazarewk/buildah-arm64:v1.14.8

RUN set -euo pipefail \
 && yum -y update \
 && yum -y install git \
 && rm -rf /var/cache /var/log/dnf* /var/log/yum.*
