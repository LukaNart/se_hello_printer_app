Simple Flask App
================

.. image:: https://travis-ci.org/LukaNart/se_hello_printer_app.svg?branch=master
    :target: https://travis-ci.org/LukaNart/se_hello_printer_app

.. image:: https://app.statuscake.com/button/index.php?Track=gUNlxoMDQe&Days=1&Design=1

.. image:: https://api.codacy.com/project/badge/Grade/9a8c9cb37d344a13adb29c5b19a5747e    :target: https://www.codacy.com/app/LukaNart/se_hello_printer_app?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LukaNart/se_hello_printer_app&amp;utm_campaign=Badge_Grade

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
    do deploy-a naszej apki na heroku. TravisCi po każdej zmianie,
    np. dostarczeniu nowej funkcjonalności odpala za nas testy i aplikacje.
    Maszyna robi za mnie to co musialbym recznie robic po kazdej zmianie kodu.


- Konfiguracja Heroku

  ::

    dodanie gunicorn do pliku requirements.txt. Gunicorn to interfejs miedzy
    moja aplikacja , serwisem webowym (heroku) i frameworkiem. Trzeba go zainstalowac
    wykonac: make deps, lub pip install gunicorn
    testowanie dzialania gunicorna-a w jednym oknie terminala wywolanie:
    PYTHONPATH=$PYTHONPATH:$(pwd) gunicorn hello_world:app
    w drugim oknie:
    curl 127.0.0.1:8000
    Stworzenie pliku Procfile -plik z informacja dla Heroku o serwisie webowym:
    web: gunicorn hello_world:app
    Stworzenie pliku runtime.txt - informacja dla Heroku o wersji pythona:
    python-2.7.14
    Instalacja heroku na lokalnej maszynie.Link do stronki z opisem
    https://devcenter.heroku.com/articles/heroku-cli - sekcja Standalone installation
    Wazne, żeby wszystkie polecenia z listeningu wykonywac jako su i byc w domwym
    katalogu nie w katalogu gdzie jest sciagniete repo!!!. pamietac o wpisaniu
    odpowiedniej wersji systemu operacyjnego, architektury i sciagnietej wersji
    heroku - polecenia wget oraz mv.Dalsze polecenie wedlug instrukcji z zajec -
    odpalenie lokalnie heroku oraz wyslanie apki na platforme Heroku
    Heroku ma uwierzytelnianie asymetryczne. Posiada publiczny kod, prywatny kod
    jest generowany prze zemnie : komenda:heroku auth:token w terminalu zwraca
    token, ktory trzeba zapisac do Travisa (sekcja settings, variables) jako
    zmienna ukryta.W ten sposob heroku bedzie wiedziec ze to co proubujemy
    "zdeployowac" na walsnym koncie pochodzi odemnie.


- Monitoring aplikacji na statuscake

  ::

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
