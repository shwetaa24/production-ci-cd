import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_home_page(client):
    """Test the home route returns a 200 status and correct message."""
    response = client.get('/')
    assert response.status_code == 200
    assert response.json['status'] == "Success"

def test_health_check(client):
    """Test the health check endpoint."""
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json['status'] == "UP"