import 'package:flutter/foundation.dart';

@immutable
sealed class AsyncValue<T> {
  const AsyncValue();

  const factory AsyncValue.empty() = AsyncValueEmpty<T>;

  const factory AsyncValue.loading() = AsyncValueLoading<T>;

  const factory AsyncValue.data(T data) = AsyncValueData<T>;

  const factory AsyncValue.error(Object err, StackTrace st) = AsyncValueError<T>;

  T? get maybeData {
    if (this is AsyncValueData<T>) {
      return (this as AsyncValueData<T>).data;
    } else {
      return null;
    }
  }

  bool get isLoading {
    if (this is AsyncValueLoading<T>) {
      return true;
    } else {
      return false;
    }
  }
}

@immutable
final class AsyncValueEmpty<T> extends AsyncValue<T> {
  const AsyncValueEmpty();
}

@immutable
final class AsyncValueLoading<T> extends AsyncValue<T> {
  const AsyncValueLoading();
}

@immutable
final class AsyncValueData<T> extends AsyncValue<T> {
  final T data;

  const AsyncValueData(this.data);
}

@immutable
final class AsyncValueError<T> extends AsyncValue<T> {
  final Object err;
  final StackTrace st;

  const AsyncValueError(this.err, this.st);
}
