import 'package:provider/provider.dart';

import 'view_model.dart';

export 'package:provider/provider.dart' show ReadContext;

class ViewModelProvider<T extends ViewModel> extends Provider<T> {
  ViewModelProvider({
    super.key,
    required Create<T> create,
    super.builder,
    super.child,
  }) : super(
          lazy: false,
          create: (context) => create(context)..init(),
          dispose: (context, value) => value.dispose(),
        );

  ViewModelProvider.value({
    super.key,
    required super.value,
    super.builder,
    super.child,
  }) : super.value();
}
