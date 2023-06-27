// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Answer {
  PlayMode get mode => throw _privateConstructorUsedError;
  ColorRGB get rgb => throw _privateConstructorUsedError;
  ColorHSV get hsv => throw _privateConstructorUsedError;
  int get checkTimes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call({PlayMode mode, ColorRGB rgb, ColorHSV hsv, int checkTimes});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? rgb = freezed,
    Object? hsv = freezed,
    Object? checkTimes = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PlayMode,
      rgb: freezed == rgb
          ? _value.rgb
          : rgb // ignore: cast_nullable_to_non_nullable
              as ColorRGB,
      hsv: freezed == hsv
          ? _value.hsv
          : hsv // ignore: cast_nullable_to_non_nullable
              as ColorHSV,
      checkTimes: null == checkTimes
          ? _value.checkTimes
          : checkTimes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlayMode mode, ColorRGB rgb, ColorHSV hsv, int checkTimes});
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$_Answer>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? rgb = freezed,
    Object? hsv = freezed,
    Object? checkTimes = null,
  }) {
    return _then(_$_Answer(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PlayMode,
      rgb: freezed == rgb
          ? _value.rgb
          : rgb // ignore: cast_nullable_to_non_nullable
              as ColorRGB,
      hsv: freezed == hsv
          ? _value.hsv
          : hsv // ignore: cast_nullable_to_non_nullable
              as ColorHSV,
      checkTimes: null == checkTimes
          ? _value.checkTimes
          : checkTimes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Answer with DiagnosticableTreeMixin implements _Answer {
  const _$_Answer(
      {this.mode = PlayMode.rgb,
      required this.rgb,
      required this.hsv,
      this.checkTimes = 0});

  @override
  @JsonKey()
  final PlayMode mode;
  @override
  final ColorRGB rgb;
  @override
  final ColorHSV hsv;
  @override
  @JsonKey()
  final int checkTimes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Answer(mode: $mode, rgb: $rgb, hsv: $hsv, checkTimes: $checkTimes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Answer'))
      ..add(DiagnosticsProperty('mode', mode))
      ..add(DiagnosticsProperty('rgb', rgb))
      ..add(DiagnosticsProperty('hsv', hsv))
      ..add(DiagnosticsProperty('checkTimes', checkTimes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            (identical(other.mode, mode) || other.mode == mode) &&
            const DeepCollectionEquality().equals(other.rgb, rgb) &&
            const DeepCollectionEquality().equals(other.hsv, hsv) &&
            (identical(other.checkTimes, checkTimes) ||
                other.checkTimes == checkTimes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mode,
      const DeepCollectionEquality().hash(rgb),
      const DeepCollectionEquality().hash(hsv),
      checkTimes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {final PlayMode mode,
      required final ColorRGB rgb,
      required final ColorHSV hsv,
      final int checkTimes}) = _$_Answer;

  @override
  PlayMode get mode;
  @override
  ColorRGB get rgb;
  @override
  ColorHSV get hsv;
  @override
  int get checkTimes;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ColorEntity {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int r, int g, int b) rgb,
    required TResult Function(double h, double s, double v) hsv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int r, int g, int b)? rgb,
    TResult? Function(double h, double s, double v)? hsv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int r, int g, int b)? rgb,
    TResult Function(double h, double s, double v)? hsv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorRGB value) rgb,
    required TResult Function(ColorHSV value) hsv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorRGB value)? rgb,
    TResult? Function(ColorHSV value)? hsv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorRGB value)? rgb,
    TResult Function(ColorHSV value)? hsv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorEntityCopyWith<$Res> {
  factory $ColorEntityCopyWith(
          ColorEntity value, $Res Function(ColorEntity) then) =
      _$ColorEntityCopyWithImpl<$Res, ColorEntity>;
}

/// @nodoc
class _$ColorEntityCopyWithImpl<$Res, $Val extends ColorEntity>
    implements $ColorEntityCopyWith<$Res> {
  _$ColorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ColorRGBCopyWith<$Res> {
  factory _$$ColorRGBCopyWith(
          _$ColorRGB value, $Res Function(_$ColorRGB) then) =
      __$$ColorRGBCopyWithImpl<$Res>;
  @useResult
  $Res call({int r, int g, int b});
}

/// @nodoc
class __$$ColorRGBCopyWithImpl<$Res>
    extends _$ColorEntityCopyWithImpl<$Res, _$ColorRGB>
    implements _$$ColorRGBCopyWith<$Res> {
  __$$ColorRGBCopyWithImpl(_$ColorRGB _value, $Res Function(_$ColorRGB) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_$ColorRGB(
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: null == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ColorRGB with DiagnosticableTreeMixin implements ColorRGB {
  const _$ColorRGB({this.r = 125, this.g = 125, this.b = 125});

  @override
  @JsonKey()
  final int r;
  @override
  @JsonKey()
  final int g;
  @override
  @JsonKey()
  final int b;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEntity.rgb(r: $r, g: $g, b: $b)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEntity.rgb'))
      ..add(DiagnosticsProperty('r', r))
      ..add(DiagnosticsProperty('g', g))
      ..add(DiagnosticsProperty('b', b));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorRGB &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.b, b) || other.b == b));
  }

  @override
  int get hashCode => Object.hash(runtimeType, r, g, b);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorRGBCopyWith<_$ColorRGB> get copyWith =>
      __$$ColorRGBCopyWithImpl<_$ColorRGB>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int r, int g, int b) rgb,
    required TResult Function(double h, double s, double v) hsv,
  }) {
    return rgb(r, g, b);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int r, int g, int b)? rgb,
    TResult? Function(double h, double s, double v)? hsv,
  }) {
    return rgb?.call(r, g, b);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int r, int g, int b)? rgb,
    TResult Function(double h, double s, double v)? hsv,
    required TResult orElse(),
  }) {
    if (rgb != null) {
      return rgb(r, g, b);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorRGB value) rgb,
    required TResult Function(ColorHSV value) hsv,
  }) {
    return rgb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorRGB value)? rgb,
    TResult? Function(ColorHSV value)? hsv,
  }) {
    return rgb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorRGB value)? rgb,
    TResult Function(ColorHSV value)? hsv,
    required TResult orElse(),
  }) {
    if (rgb != null) {
      return rgb(this);
    }
    return orElse();
  }
}

abstract class ColorRGB implements ColorEntity {
  const factory ColorRGB({final int r, final int g, final int b}) = _$ColorRGB;

  int get r;
  int get g;
  int get b;
  @JsonKey(ignore: true)
  _$$ColorRGBCopyWith<_$ColorRGB> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorHSVCopyWith<$Res> {
  factory _$$ColorHSVCopyWith(
          _$ColorHSV value, $Res Function(_$ColorHSV) then) =
      __$$ColorHSVCopyWithImpl<$Res>;
  @useResult
  $Res call({double h, double s, double v});
}

/// @nodoc
class __$$ColorHSVCopyWithImpl<$Res>
    extends _$ColorEntityCopyWithImpl<$Res, _$ColorHSV>
    implements _$$ColorHSVCopyWith<$Res> {
  __$$ColorHSVCopyWithImpl(_$ColorHSV _value, $Res Function(_$ColorHSV) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? h = null,
    Object? s = null,
    Object? v = null,
  }) {
    return _then(_$ColorHSV(
      h: null == h
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as double,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as double,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ColorHSV with DiagnosticableTreeMixin implements ColorHSV {
  const _$ColorHSV({this.h = 0.0, this.s = 0.0, this.v = 0.0});

  @override
  @JsonKey()
  final double h;
  @override
  @JsonKey()
  final double s;
  @override
  @JsonKey()
  final double v;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorEntity.hsv(h: $h, s: $s, v: $v)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorEntity.hsv'))
      ..add(DiagnosticsProperty('h', h))
      ..add(DiagnosticsProperty('s', s))
      ..add(DiagnosticsProperty('v', v));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorHSV &&
            (identical(other.h, h) || other.h == h) &&
            (identical(other.s, s) || other.s == s) &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, h, s, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorHSVCopyWith<_$ColorHSV> get copyWith =>
      __$$ColorHSVCopyWithImpl<_$ColorHSV>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int r, int g, int b) rgb,
    required TResult Function(double h, double s, double v) hsv,
  }) {
    return hsv(h, s, v);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int r, int g, int b)? rgb,
    TResult? Function(double h, double s, double v)? hsv,
  }) {
    return hsv?.call(h, s, v);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int r, int g, int b)? rgb,
    TResult Function(double h, double s, double v)? hsv,
    required TResult orElse(),
  }) {
    if (hsv != null) {
      return hsv(h, s, v);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorRGB value) rgb,
    required TResult Function(ColorHSV value) hsv,
  }) {
    return hsv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ColorRGB value)? rgb,
    TResult? Function(ColorHSV value)? hsv,
  }) {
    return hsv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorRGB value)? rgb,
    TResult Function(ColorHSV value)? hsv,
    required TResult orElse(),
  }) {
    if (hsv != null) {
      return hsv(this);
    }
    return orElse();
  }
}

abstract class ColorHSV implements ColorEntity {
  const factory ColorHSV({final double h, final double s, final double v}) =
      _$ColorHSV;

  double get h;
  double get s;
  double get v;
  @JsonKey(ignore: true)
  _$$ColorHSVCopyWith<_$ColorHSV> get copyWith =>
      throw _privateConstructorUsedError;
}
