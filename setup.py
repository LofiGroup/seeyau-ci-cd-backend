from backend.utils.random_utils import generate_random_string

print("Enter domain name:")
domain_name = input()

print("Enter your email:")
email = input()

admin_access_token = generate_random_string(60, False)

with open(".env", "w") as env:
    env.writelines([
        f"DOMAIN_NAME={domain_name}\n",
        f"CERTBOT_EMAIL={email}\n",
        f"ADMIN_ACCESS_TOKEN={admin_access_token}\n",
        f"WAIT_FOR_IT_TIME=60000\n",
        f"IS_DEBUG_VERSION=false\n"
    ])
