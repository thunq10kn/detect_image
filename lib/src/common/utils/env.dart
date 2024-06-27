/// Environment of the app
enum Flavor { dev, stg, prod }

enum WebRenderer { html, canvaskit }

// ignore: avoid_classes_with_only_static_members
/// Environment variables
class Env {
  static Flavor flavor =
      Flavor.values.byName(const String.fromEnvironment('FLAVOR'));
  static WebRenderer webRenderer =
      WebRenderer.values.byName(const String.fromEnvironment('WEB_RENDERER'));
}
