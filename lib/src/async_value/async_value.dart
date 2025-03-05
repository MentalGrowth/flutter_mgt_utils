import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "async_value.freezed.dart";

@freezed
sealed class AsyncValue<T> with _$AsyncValue<T> {
  const factory AsyncValue.data(T value) = Data<T>;

  const factory AsyncValue.empty() = Empty<T>;

  const factory AsyncValue.error(Object err, StackTrace st) = Error<T>;

  const factory AsyncValue.loading() = Loading<T>;

  const AsyncValue._();

  T? get data => switch (this) {
    Data(:final value) => value,
    _ => null,
  };
}
