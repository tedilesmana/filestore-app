// ignore_for_file: constant_identifier_names

class Environments {
  static const String PRODUCTION = 'prod';
  static const String DEV = 'dev';
}

class ConfigEnvironments {
  static const String _currentEnvironments =
      Environments.PRODUCTION; //Set Environment Here
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'base_url': 'http://filestore.metawater.id',
    },
    {
      'env': Environments.PRODUCTION,
      'base_url': 'http://filestore.metawater.id',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
