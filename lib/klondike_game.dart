
import 'package:klondike5/utils/klondike_sprite_util.dart';

import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'components/card.dart';
import 'components/foundation.dart';
import 'components/pile.dart';
import 'components/stock.dart';
import 'components/waste.dart';

class KlondikeGame extends FlameGame {
  static const double cardGap = 175.0;
  static const double cardWidth = 1000.0;
  static const double cardHeight = 1400.0;
  static const double cardRadius = 100.0;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);

  @override
  Future<void> onLoad() async {
    await KlondikeUtil.loadImageMap();

    final stock = StockPile()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);
    final waste = WastePile()
      ..size = cardSize
      ..position = Vector2(cardWidth + 2 * cardGap, cardGap);
    final foundations = List.generate(
      4,
          (i) => FoundationPile()
        ..size = cardSize
        ..position =
        Vector2((i + 3) * (cardWidth + cardGap) + cardGap, cardGap),
    );
    final piles = List.generate(
      7,
          (i) => TableauPile()
        ..size = cardSize
        ..position = Vector2(
          cardGap + i * (cardWidth + cardGap),
          cardHeight + 2 * cardGap,
        ),
    );

    world.add(stock);
    world.add(waste);
    world.addAll(foundations);
    world.addAll(piles);

    camera.viewfinder.visibleGameSize =
        Vector2(cardWidth * 7 + cardGap * 8, 4 * cardHeight + 3 * cardGap);
    camera.viewfinder.position = Vector2(cardWidth * 3.5 + cardGap * 4, 0);
    camera.viewfinder.anchor = Anchor.topCenter;

    // final random = Random();
    // for (var i = 0; i < 7; i++) {
    //   for (var j = 0; j < 4; j++) {
    //     final card = Card(random.nextInt(13) + 1, random.nextInt(4))
    //       ..position = Vector2(100 + i * 1150, 100 + j * 1500)
    //       ..addToParent(world);
    //     // flip the card face-up with 90% probability
    //     if (random.nextDouble() < 0.9) {
    //       card.flip();
    //     }
    //   }
    // }
  }
}