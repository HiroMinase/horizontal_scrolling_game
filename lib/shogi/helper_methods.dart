import 'package:horizontal_scrolling_game/shogi/components/piece.dart';

// 駒を自分のものにする
ShogiPiece turnOverPiece(ShogiPiece piece) {
  String currentKeyString = piece.isally ? "up" : "down"; // 画像パスから検索する文字列
  String newKeyString = piece.isally ? "down" : "up"; // 置き換える文字列
  String newImagePath = piece.imagePath.replaceFirst(currentKeyString, newKeyString); // 画像パスの置き換え
  newImagePath = newImagePath.replaceFirst("promoted_", ""); // 成り駒を取った場合、画像パスを変更
  ShogiPieceType newShogiPieceType = piece.type; // 成り駒から通常駒への変換用

  // 成り駒を通常駒に戻す
  switch (piece.type) {
    case ShogiPieceType.promotedHisya:
      newShogiPieceType = ShogiPieceType.hisya;
      break;
    case ShogiPieceType.promotedKakugyo:
      newShogiPieceType = ShogiPieceType.kakugyo;
      break;
    case ShogiPieceType.promotedKeima:
      newShogiPieceType = ShogiPieceType.keima;
      break;
    case ShogiPieceType.promotedKyousya:
      newShogiPieceType = ShogiPieceType.kyousya;
      break;
    case ShogiPieceType.promotedGinsho:
      newShogiPieceType = ShogiPieceType.ginsho;
      break;
    case ShogiPieceType.promotedHohei:
      newShogiPieceType = ShogiPieceType.hohei;
      break;
    default:
  }

  return ShogiPiece(
    type: newShogiPieceType,
    isally: !piece.isally,
    imagePath: newImagePath,
    isPromoted: false,
  );
}

// 成り
ShogiPiece promotePiece(ShogiPiece piece) {
  String keyString = piece.isally ? "up" : "down"; // 画像パスから検索する文字列
  String newImagePath = piece.imagePath.replaceFirst(keyString, "promoted_$keyString"); // 画像パスの置き換え
  ShogiPieceType newShogiPieceType = piece.type; // 成り駒への変換用

  // 成り駒の取得
  switch (piece.type) {
    case ShogiPieceType.hisya:
      newShogiPieceType = ShogiPieceType.promotedHisya;
      break;
    case ShogiPieceType.kakugyo:
      newShogiPieceType = ShogiPieceType.promotedKakugyo;
      break;
    case ShogiPieceType.keima:
      newShogiPieceType = ShogiPieceType.promotedKeima;
      break;
    case ShogiPieceType.kyousya:
      newShogiPieceType = ShogiPieceType.kyousya;
      break;
    case ShogiPieceType.ginsho:
      newShogiPieceType = ShogiPieceType.ginsho;
      break;
    case ShogiPieceType.hohei:
      newShogiPieceType = ShogiPieceType.promotedHohei;
      break;
    default:
  }

  return ShogiPiece(
    type: newShogiPieceType,
    isally: piece.isally,
    imagePath: newImagePath,
    isPromoted: true,
  );
}
