// ignore: constant_identifier_names

enum AppEndPoints {
  fetchDataVisionAI,
  tesseract,
  paddle,
}

const _path = {
  AppEndPoints.fetchDataVisionAI: 'images:annotate',
  AppEndPoints.tesseract: 'tesseract',
  AppEndPoints.paddle: 'paddle',
};

extension EndpointExtension on AppEndPoints {
  String get path {
    return _path[this] ?? '';
  }
}
