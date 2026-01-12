import 'package:flutter/widgets.dart';

/// A widget wrapper that enforces a key requirement at compile-time.
///
/// Use this as the return type from [itemBuilder] to ensure all items
/// have proper keys for animation and reordering operations.
class KeyedWidget extends StatelessWidget {
  @override
  Key get key => super.key!;

  final Widget child;

  const KeyedWidget({required Key key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => child;
}
