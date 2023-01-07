import 'package:meta/meta.dart';

enum StickyStateType { editing, readOnly, archived }

@immutable
class StickyState {
  final StickyStateType value;

  const StickyState(this.value);

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is StickyState && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
