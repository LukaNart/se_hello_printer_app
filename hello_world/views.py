from hello_world import app
from formater import get_formatted
from formater import SUPPORTED, PLAIN
from flask import request

moje_imie = "Marcin"
msg = "Hello World!"
nazwisko = "Nartowski"


@app.route('/')
def index():
    output = request.args.get('output')
    if not output:
        output = PLAIN
    return get_formatted(msg, moje_imie, nazwisko,
                         output.lower())


@app.route('/outputs')
def supported_output():
    return ", ".join(SUPPORTED)
