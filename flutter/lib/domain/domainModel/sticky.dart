import 'dart:ui';

import 'value/sticky_color.dart';
import 'value/sticky_font_size.dart';
import 'value/sticky_id.dart';
import 'value/sticky_last_edit.dart';
import 'value/sticky_state.dart';
import 'value/sticky_text.dart';

class Sticky {
  final StickyId id;
  StickyText _text;
  StickyFontSize _fontSize;
  StickyLastEdit _lastEdit;
  StickyColor _color;
  StickyState _state;
  // TODO: StickyCreatedAt

  Sticky(
      {required this.id,
      required StickyText text,
      required StickyFontSize fontSize,
      required StickyLastEdit lastEdit,
      required StickyColor color,
      required StickyState state})
      : _text = text,
        _fontSize = fontSize,
        _lastEdit = lastEdit,
        _color = color,
        _state = state;

  factory Sticky.initial() => Sticky(
      id: StickyId(''),
      text: StickyText(''),
      fontSize: StickyFontSize(16),
      lastEdit: StickyLastEdit(DateTime(2020, 1, 1, 0, 0, 0)),
      color: StickyColor(const Color(0xffff7f7f)),
      state: const StickyState(StickyStateType.editing));

  StickyText get text => _text;
  StickyFontSize get fontSize => _fontSize;
  StickyLastEdit get lastEdit => _lastEdit;
  StickyColor get color => _color;
  StickyState get state => _state;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is Sticky && other.id == id);

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode;

  void changeText(StickyText newText) => _text = newText;
  void changeFontSize(StickyFontSize newFontSize) => _fontSize = newFontSize;
  void changeLastEdit(StickyLastEdit newLastEdit) => _lastEdit = newLastEdit;
  void changeColor(StickyColor newColor) => _color = newColor;
  void changeState(StickyState newState) => _state = newState;
}
