import logging

def setup_logging():
    logging.basicConfig(level=logging.INFO,
                        format='%(asctime)s - %(levelname)s - %(message)s',
                        handlers=[logging.FileHandler("app.log"),
                                  logging.StreamHandler()])

# In your app setup
setup_logging()

# Example usage
logging.info("This is an info message") 