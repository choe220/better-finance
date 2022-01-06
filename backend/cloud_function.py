import os
import requests


def create_link_token(request):
    """Responds to a HTTP request for a link token from Plaid
    """
    if request.args:
        client_id = os.environ.get('PLAID_CLIENT_ID')
        client_secret = os.environ.get('PLAID_SECRET')
        body = {
            "client_id": client_id,
            "secret": client_secret,
            "client_name": "Better Finance",
            "products": ["auth"],
            "country_codes": ["US"],
            "language": "en",
            "user": {
                "client_user_id": request.args.get('uid')
            },
        }
        r = requests.post('sandbox.plaid.com/link/token/create', body=body)
        return r.json(), 200

    return {'error': 'bad request'}, 400 # bad request