# Загрузка, скачивание и удаление на Nexus через cURL.

## Upload
<!-- TODO using $(basename) in filename-->
```bash
read -s -p "Enter Nexus password: " pass && find /tmp/RPMs/ -type f | \
xargs -I {} -n 1 bash -c 'echo {} \
&& curl -u "admin:'$pass'" --request "POST" \
"http://prod-lnx-1:8081/service/rest/v1/components?repository=rpm-release"  \
-H "accept: application/json" \
-H "Content-Type: multipart/form-data" \
-H "X-Nexus-UI: true" \
-F "yum.directory=Directory" \
-F "yum.asset=@{}" \
-F "yum.asset.filename=$(basename {})" \
&& unset pass'
```

== 123 ==

<mark>I'm HIGHLIGHTED</mark>

## Download

`dnf download --disablerepo=* --enablerepo=nexus packages from file`

`yumdownloader --disablerepo=* --enablerepo=nexus cups`

## Delete

```bash
read -s -p "Enter Nexus password: " pass \
  && curl \
    --request DELETE \
    -u "admin:$pass" \
    http://nexus_address:8081/repository/rpm-release/Directory/cups-1.6.3-51.el7.x86_64.rpm \
  && unset pass
``` 
from file list + regex (API list request)

