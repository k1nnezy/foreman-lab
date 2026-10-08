# Настройка Foreman: Host Group, шаблон NTP, Ansible-роль

## 1. Регистрация хоста как managed
Скриншот: Register Host, хост cli1 в All Hosts, флаг Managed=Yes.
![Регистрация](screenshots/01-host-registered.png)

## 2. Host Group с параметром ntp-server
Скриншот: Host Group `ntp`, вкладка Parameters, параметр ntp-server=foreman.test.com.
![Параметры группы](screenshots/02-hostgroup-params.png)

## 3. Provisioning-шаблон NTP
Скриншот: Preview шаблона для хоста cli1 — видно рендер с foreman.test.com.
![Превью шаблона](screenshots/03-template-preview.png)

## 4. Импорт Ansible-роли
Скриншот: Configure > Ansible > Roles, роль disable_root_ssh.
![Импорт роли](screenshots/04-ansible-role-imported.png)

## 5. Запуск роли и результат
Скриншот: Monitor > Jobs, задание Run Ansible roles — Success.
![Успешное задание](screenshots/05-job-success.png)

## 6. Проверка на хосте
Скриншот: на cli1 `sshd -T | grep permitrootlogin` → `permitrootlogin no`.
Скриншот: `ssh root@cli1` → Permission denied.
![Проверка root-логина](screenshots/06-ssh-root-denied.png)

## 7. Проверка NTP
Скриншот: `/etc/systemd/timesyncd.conf` содержит `NTP=foreman.test.com`.
Скриншот: `timedatectl` — System clock synchronized: yes.
