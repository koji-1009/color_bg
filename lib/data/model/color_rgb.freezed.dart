// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'color_rgb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColorRGB {
  int get r => throw _privateConstructorUsedError;
  int get g => throw _privateConstructorUsedError;
  int get b => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorRGBCopyWith<ColorRGB> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorRGBCopyWith<$Res> {
  factory $ColorRGBCopyWith(ColorRGB value, $Res Function(ColorRGB) then) =
      _$ColorRGBCopyWithImpl<$Res>;
  $Res call({int r, int g, int b});
}

/// @nodoc
class _$ColorRGBCopyWithImpl<$Res> implements $ColorRGBCopyWith<$Res> {
  _$ColorRGBCopyWithImpl(this._value, this._then);

  final ColorRGB _value;
  // ignore: unused_field
  final $Res Function(ColorRGB) _then;

  @override
  $Res call({
    Object? r = freezed,
    Object? g = freezed,
    Object? b = freezed,
  }) {
    return _then(_value.copyWith(
      r: r == freezed
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: g == freezed
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: b == freezed
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ColorRGBCopyWith<$Res> implements $ColorRGBCopyWith<$Res> {
  factory _$$_ColorRGBCopyWith(
          _$_ColorRGB value, $Res Function(_$_ColorRGB) then) =
      __$$_ColorRGBCopyWithImpl<$Res>;
  @override
  $Res call({int r, int g, int b});
}

/// @nodoc
class __$$_ColorRGBCopyWithImpl<$Res> extends _$ColorRGBCopyWithImpl<$Res>
    implements _$$_ColorRGBCopyWith<$Res> {
  __$$_ColorRGBCopyWithImpl(
      _$_ColorRGB _value, $Res Function(_$_ColorRGB) _then)
      : super(_value, (v) => _then(v as _$_ColorRGB));

  @override
  _$_ColorRGB get _value => super._value as _$_ColorRGB;

  @override
  $Res call({
    Object? r = freezed,
    Object? g = freezed,
    Object? b = freezed,
  }) {
    return _then(_$_ColorRGB(
      r: r == freezed
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: g == freezed
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: b == freezed
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ColorRGB with DiagnosticableTreeMixin implements _ColorRGB {
  const _$_ColorRGB({this.r = 125, this.g = 125, this.b = 125});

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
    return 'ColorRGB(r: $r, g: $g, b: $b)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorRGB'))
      ..add(DiagnosticsProperty('r', r))
      ..add(DiagnosticsProperty('g', g))
      ..add(DiagnosticsProperty('b', b));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColorRGB &&
            const DeepCollectionEquality().equals(other.r, r) &&
            const DeepCollectionEquality().equals(other.g, g) &&
            const DeepCollectionEquality().equals(other.b, b));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(r),
      const DeepCollectionEquality().hash(g),
      const DeepCollectionEquality().hash(b));

  @JsonKey(ignore: true)
  @override
  _$$_ColorRGBCopyWith<_$_ColorRGB> get copyWith =>
      __$$_ColorRGBCopyWithImpl<_$_ColorRGB>(this, _$identity);
}

abstract class _ColorRGB implements ColorRGB {
  const factory _ColorRGB({final int r, final int g, final int b}) =
      _$_ColorRGB;

  @override
  int get r;
  @override
  int get g;
  @override
  int get b;
  @override
  @JsonKey(ignore: true)
  _$$_ColorRGBCopyWith<_$_ColorRGB> get copyWith =>
      throw _privateConstructorUsedError;
}
