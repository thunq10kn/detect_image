// ignore: constant_identifier_names

enum AppEndPoints {
  fetchDataVisionAI,
}

const _path = {
  AppEndPoints.fetchDataVisionAI: 'images:annotate',
};

extension EndpointExtension on AppEndPoints {
  String get path {
    return _path[this] ?? '';
  }
}
