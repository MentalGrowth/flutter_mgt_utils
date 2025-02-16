import "package:flutter/foundation.dart";
import "package:flutter_mgt_utils/src/disposable.dart";
import "package:flutter_mgt_utils/src/instantiatable.dart";

abstract class ViewModel implements Instantiatable, Disposable {
  var _disposed = false;

  @protected
  bool get disposed => _disposed;

  @override
  @mustCallSuper
  void init() {}

  @override
  @mustCallSuper
  void dispose() {
    _disposed = true;
  }
}
