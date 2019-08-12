// User interaction come here
// UI -> bloc
import 'package:flutter/foundation.dart';

abstract class PostDetailEvent {}

class FetchPostEvent extends PostDetailEvent {
  final int id;

  FetchPostEvent({@required this.id}) : assert(id != null);
}
