from unittest import TestCase
import requests

URL = "http://localhost:30000"

class TestService(TestCase):

    def test_service_up(self):
        connection = requests.get(URL)
        self.assertEquals(connection.status_code, 200)
        connection.close()

    def test_title(self):
        connection = requests.get(URL)
        self.assertTrue("<title>Redux Todos Example</title>" in connection.content.decode())
        connection.close()
