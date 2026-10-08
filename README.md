Foreman Lab

Задача
1. Зарегистрировать хост cli1 как managed host в Foreman.
2. Создать Host Group `ntp` с provisioning-шаблоном для NTP.
3. Интегрировать Ansible и применить роль `disable_root_ssh` через Host Group.

Структура
- `ansible/roles/disable_root_ssh` — Ansible-роль запрета root-логина.
- `foreman/templates/ntp_custom_setup.erb` — provisioning-шаблон NTP.
- `foreman/hostgroup_params.yml` — параметры Host Group.
- `docs/foreman-setup.md` — пошаговая настройка со скриншотами.

Воспроизведение
1. Установить Foreman .
2. Импортировать роль из `ansible/roles/` через Configure > Ansible > Roles > Import.
3. Создать шаблон из `foreman/templates/ntp_custom_setup.erb`.
4. Создать Host Group `ntp`, добавить параметр `ntp-server`.
5. Привязать шаблон и роль к Host Group.
6. Зарегистрировать хост через Hosts > Register Host.
7. Запустить роль: Configure > Host Groups > ntp > Actions > Run all Ansible roles.
   
Итог
После проделанных работ система работает но из-за бага скрипт не отрабатывает но все заданные условия выполняются.
Foreman под номером #36300. Если кратко, то суть в том, что плагин smart_proxy_ansible пытался запустить исполняемый файл в директории /tmp, что запрещено в некоторых системах, и падал с ошибкой Permission denied.
