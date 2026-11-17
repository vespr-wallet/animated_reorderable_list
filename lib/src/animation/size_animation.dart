import 'package:flutter/widgets.dart';
import '../../animated_reorderable_list.dart';

class SizeAnimation extends AnimationEffect<double> {
  static const double beginValue = 0.0;
  static const double endValue = 1.0;
  static const double alignmentValue = 0.0;
  final double? begin;
  final double? end;
  final Axis? axis;
  final double? axisAlignment;

  /// Gradually animates the size of the item.
  SizeAnimation({super.delay, super.duration, super.curve, this.begin, this.end, this.axis, this.axisAlignment});

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
    EffectEntry entry,
    Duration totalDuration,
  ) {
    final Animation<double> sizeFactor = buildAnimation(
      entry,
      totalDuration,
      begin: begin ?? beginValue,
      end: end ?? endValue,
    ).animate(animation);
    final Axis resolvedAxis = axis ?? Axis.horizontal;
    final double resolvedAxisAlignment = axisAlignment ?? alignmentValue;
    return Align(
      child: SizeTransition(
        sizeFactor: sizeFactor,
        axis: resolvedAxis,
        // Same placement as the deprecated `axisAlignment`, which SizeTransition maps the same way.
        alignment: switch (resolvedAxis) {
          Axis.horizontal => AlignmentDirectional(resolvedAxisAlignment, -1.0),
          Axis.vertical => AlignmentDirectional(-1.0, resolvedAxisAlignment),
        },
        child: child,
      ),
    );
  }
}
