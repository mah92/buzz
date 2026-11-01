part of '../animated_avatar_capture.dart';

/// Creates an isolated workspace for one capture's segmentation frames.
@visibleForTesting
Future<Directory> createAnimatedAvatarFrameDirectory({
  Directory? parent,
}) async => (parent ?? await getTemporaryDirectory()).createTemp(
  'buzz-avatar-capture-',
);

// Google Play Services / MLKit selfie segmentation removed: this build must
// run without Google Play. Background removal is skipped and raw frames pass
// through so the animated-avatar capture stays functional.
Future<List<Uint8List>> _removeBackgrounds(List<Uint8List> frames) async {
  return frames;
}

/// Encodes one poster frame for validating animated-avatar framing parity.
@visibleForTesting
Uint8List encodeAnimatedAvatarPoster({
  required Uint8List frame,
  required double scale,
}) => _encodeAvatar(
  _EncodeRequest(
    frames: [frame],
    posterIndex: 0,
    scale: scale,
    offsetX: 0,
    offsetY: 0,
    backdropColor: 0xff0000ff,
    personOutline: false,
    shapeScale: 1,
    shapeOffsetX: 0,
    shapeOffsetY: 0,
  ),
).poster;
