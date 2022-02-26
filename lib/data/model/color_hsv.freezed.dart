// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'color_hsv.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ColorHSVTearOff {
  const _$ColorHSVTearOff();

  _ColorHSV call({double h = 0.0, double s = 0.0, double v = 0.0}) {
    return _ColorHSV(
      h: h,
      s: s,
      v: v,
    );
  }
}

/// @nodoc
const $ColorHSV = _$ColorHSVTearOff();

/// @nodoc
mixin _$ColorHSV {
  double get h => throw _privateConstructorUsedError;
  double get s => throw _privateConstructorUsedError;
  double get v => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorHSVCopyWith<ColorHSV> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorHSVCopyWith<$Res> {
  factory $ColorHSVCopyWith(ColorHSV value, $Res Function(ColorHSV) then) =
      _$ColorHSVCopyWithImpl<$Res>;
  $Res call({double h, double s, double v});
}

/// @nodoc
class _$ColorHSVCopyWithImpl<$Res> implements $ColorHSVCopyWith<$Res> {
  _$ColorHSVCopyWithImpl(this._value, this._then);

  final ColorHSV _value;
  // ignore: unused_field
  final $Res Function(ColorHSV) _then;

  @override
  $Res call({
    Object? h = freezed,
    Object? s = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      h: h == freezed
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as double,
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as double,
      v: v == freezed
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ColorHSVCopyWith<$Res> implements $ColorHSVCopyWith<$Res> {
  factory _$ColorHSVCopyWith(_ColorHSV value, $Res Function(_ColorHSV) then) =
      __$ColorHSVCopyWithImpl<$Res>;
  @override
  $Res call({double h, double s, double v});
}

/// @nodoc
class __$ColorHSVCopyWithImpl<$Res> extends _$ColorHSVCopyWithImpl<$Res>
    implements _$ColorHSVCopyWith<$Res> {
  __$ColorHSVCopyWithImpl(_ColorHSV _value, $Res Function(_ColorHSV) _then)
      : super(_value, (v) => _then(v as _ColorHSV));

  @override
  _ColorHSV get _value => super._value as _ColorHSV;

  @override
  $Res call({
    Object? h = freezed,
    Object? s = freezed,
    Object? v = freezed,
  }) {
    return _then(_ColorHSV(
      h: h == freezed
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as double,
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as double,
      v: v == freezed
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ColorHSV with DiagnosticableTreeMixin implements _ColorHSV {
  const _$_ColorHSV({this.h = 0.0, this.s = 0.0, this.v = 0.0});

  @JsonKey()
  @override
  final double h;
  @JsonKey()
  @override
  final double s;
  @JsonKey()
  @override
  final double v;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorHSV(h: $h, s: $s, v: $v)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorHSV'))
      ..add(DiagnosticsProperty('h', h))
      ..add(DiagnosticsProperty('s', s))
      ..add(DiagnosticsProperty('v', v));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColorHSV &&
            const DeepCollectionEquality().equals(other.h, h) &&
            const DeepCollectionEquality().equals(other.s, s) &&
            const DeepCollectionEquality().equals(other.v, v));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(h),
      const DeepCollectionEquality().hash(s),
      const DeepCollectionEquality().hash(v));

  @JsonKey(ignore: true)
  @override
  _$ColorHSVCopyWith<_ColorHSV> get copyWith =>
      __$ColorHSVCopyWithImpl<_ColorHSV>(this, _$identity);
}

abstract class _ColorHSV implements ColorHSV {
  const factory _ColorHSV({double h, double s, double v}) = _$_ColorHSV;

  @override
  double get h;
  @override
  double get s;
  @override
  double get v;
  @override
  @JsonKey(ignore: true)
  _$ColorHSVCopyWith<_ColorHSV> get copyWith =>
      throw _privateConstructorUsedError;
}
