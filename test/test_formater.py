from hello_world.formater import plain_text_upper_case
import unittest


class TestFormater(unittest.TestCase):
    def test_plain_lowercase(self):
        r = plain_text_upper_case("WWIMIE", "DDNAZWISKO", "EEEMSG")
        name = r.split(" ")[0]
        msg = r.split(" ")[1]
        nazwisko = r.split(" ")[2]
        self.assertTrue(name.isupper())
        self.assertTrue(nazwisko.isupper())
        self.assertTrue(msg.isupper())
