import pytest
from app import app


@pytest.fixture
def client():
    with app.test_client() as client:
        yield client


def test_index(client):
    r = client.get("/")
    assert r.status_code == 200
    assert r.data == b"Hello, World!"


def test_not_found(client):
    r = client.get("/nothing")
    assert r.status_code == 404
