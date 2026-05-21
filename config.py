import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'it222_tasktrack_final_key'
    DATABASE = os.path.join(os.getcwd(), 'tasktrack.db')
    DEBUG = False
    TESTING = False

class DevelopmentConfig(Config):
    DEBUG = True

class ProductionConfig(Config):
    DEBUG = False
    
config_options = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'default': DevelopmentConfig
}