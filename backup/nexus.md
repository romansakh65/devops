#  Blob store backup
Файловая система или хранилище объектов, содержащее большие двоичные объекты, отдельно от репозитория Nexus.

`cp -R $data-dir/blobs /somedir/`

# Node ID Backup
Каждый экземпляр репозитория Nexus связан с отдельным идентификатором.

`cp -R $data-dir/keystores/node/ /somedir`

# DB backup
Создать и запустить задание Admin - Export databases for backup указавы директорию для экспорта данных ($data-dir - корневая директория).

Выключить Nexus
Удалить следующие директории в $data-dir/db:
component
config
security

Копировать .bak файлы в $data-dir/restore-from-backup (Для версий ниже 3.10.0 использовать $data-dir/backup)

Восстановить резервную копию хранилища BLOB-объектов, соответствующую резервной копии БД, взятой из $data-dir/blobs 

Перезапуск Nexus

Удалить файлы с папки $data-dir/restore-from-backup.
