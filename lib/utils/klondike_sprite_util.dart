import 'package:flame/components.dart';
import 'package:flame/flame.dart';


class KlondikeUtil {
  static Future<void> loadImageMap() async {
    await Flame.images.load('klondike-sprites.png');
  }

  static Sprite klondikeSprite(double x, double y, double width, double height) {
    return Sprite(
      Flame.images.fromCache('klondike-sprites.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}

