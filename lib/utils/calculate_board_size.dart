double calculateBoardSize(
  double screenWidth,
  double screenHeight,
) {
  const double boardSizePercent = 0.8;
  final double width = screenWidth * boardSizePercent;
  final double height = screenHeight * boardSizePercent;
  final double minSize = width > height ? height : width;
  return minSize;
}