import 'dart:math';

int getRandomInt(int min, int max) {
  return Random().nextInt(max - min) + min;
}
