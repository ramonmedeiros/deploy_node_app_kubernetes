from unittest import TestCase
import requests

URL = "http://localhost:30000"

class TestService(TestCase):

    def test_service_up(self):
        with requests.get(URL) as connection:
            self.assertEquals(connection.status_code, 200)

    def test_title(self):
        with requests.get(URL) as connection:
            self.assertTrue("<title>Redux Todos Example</title>" in connection.content.decode())

