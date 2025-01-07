from flask_wtf.csrf import CSRFProtect

csrf = CSRFProtect()

# In your app setup
csrf.init_app(app)

# Example of parameterized query
def get_user_by_id(user_id):
