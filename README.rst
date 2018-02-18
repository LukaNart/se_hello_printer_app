Simple Flask App
================
# logo "build status" z TravisCi wyswietlane na moim GitHub
.. image:: https://travis-ci.org/LukaNart/se_hello_printer_app.svg?branch=master
    :target: https://travis-ci.org/LukaNart/se_hello_printer_app
# logo z Statuscake
..<a href="https://www.statuscake.com" title="Website Uptime Monitoring"><img src="https://app.statuscake.com/button/index.php?Track=gUNlxoMDQe&Days=1&Design=1" /></a>

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Rozpocząnając pracę z projektem (wykorzystując virtualenv). Hermetyczne
  środowisko dla pojedyńczej aplikacji w python-ie:
- Na początku wykonaliśmy forka na GitHubie gotowego projektu z konta Wojtka.
  Link z materialow. Pozniej robilismy git clone.
  ::

    source /usr/bin/virtualenvwrapper.sh #dopisac do pliku bashrc
    mkvirtualenv wsb-simple-flask-app #Jezeli 3 poniższe komendy
    nie zadziałalaj to trzeba zainstalwoac komponenty z sekcji Pomocnicza
    logujac sie jako su
    pip install -r requirements.txt
    pip install -r test_requirements.txt


- Uruchamianie aplikacji:

  ::

    # jako zwykły program
    python main.py

    # albo:
    PYTHONPATH=. FLASK_APP=hello_world flask run

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ::

    PYTHONPATH=. py.test
    PYTHONPATH=. py.test  --verbose -s

- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ::

    source /usr/bin/virtualenvwrapper.sh
    workon wsb-simple-flask-app


- Integracja z TravisCI:

  ::

    konfiguracja znajduje sie w pliku .travis.yaml
    W tym pliku są tez sekcje do uruchamiania dockera, oraz
    do deploy-a naszej apki na heroku

- Monitoring aplikacji na statuscake

..::

    Po zalogowaniu na https://app.statuscake.com/ mozna podejrzec
    status deploy-a naszej apliakcji z heroku. Wygenerowany z Heroku link
    (wziety z logow builda z Travisa) jest odpytywany co 5 min przez Statuscake
    z dwoch miejsc na swiecie. Dodalem tez link do logo ze Statuscake, mowiace
    o statusie odpytan, ktore bedzie wystwietlane w moim GitHub.


Pomocnicze
==========

- Instalacja python virtualenv i virtualenvwrapper:

  ::

    yum install python-pip -y
    pip install -U pip
    pip install virtualenv
    pip install virtualenvwrapper

- Instalacja docker-a:

  ::

    yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

    yum install -y yum-utils

    yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

    yum makecache fast
    yum install docker-ce
    systemctl start docker

Materiały
=========

- https://virtualenvwrapper.readthedocs.io/en/latest/
