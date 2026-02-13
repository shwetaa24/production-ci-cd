import pytest
from app import app  # This refers to app.py and the 'app' variable inside it

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home_page(client):
    response = client.get('/')
    assert response.status_code == 200
    # Match the key we used in app.py
    assert response.json['status'] == "Success"

def test_health_check(client):
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json['status'] == "UP"