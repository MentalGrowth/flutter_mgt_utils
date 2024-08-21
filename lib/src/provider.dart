import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'view_model.dart';

class ViewModelProvider<T extends ViewModel> extends StatelessWidget {
  final Create<T> create;
  final TransitionBuilder? builder;
  final Widget? child;

  const ViewModelProvider({
    super.key,
    required this.create,
    this.builder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      create: (context) => create(context)..init(),
      dispose: (context, value) => value.dispose(),
      lazy: false,
      builder: builder,
      child: child,
    );
  }
}
