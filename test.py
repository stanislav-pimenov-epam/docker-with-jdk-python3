import logging
import logging.config
import yaml


def setup_logging():
  with open('logging.yaml', 'rt') as f:
    config = yaml.safe_load(f.read())
  logging.config.dictConfig(config)


# Setup logging
setup_logging()
logger = logging.getLogger(__name__)


def testLogger():
  logger.info('Your first logger message!')


testLogger()
