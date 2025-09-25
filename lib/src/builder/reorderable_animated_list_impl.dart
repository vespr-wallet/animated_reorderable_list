import 'package:flutter/material.dart';

import 'reorderable_animated_builder.dart';
import 'reorderable_animated_list_base.dart';

class ReorderableAnimatedListImpl<E extends Object>
    extends ReorderableAnimatedListBase<Widget, E> {
  const ReorderableAnimatedListImpl({
    super.key,
    required super.items,
    required super.itemBuilder,
    super.enterTransition,
    super.exitTransition,
    super.insertDuration,
    super.removeDuration,
    super.onReorder,
    super.onReorderStart,
    super.onReorderEnd,
    super.proxyDecorator,
    required super.scrollDirection,
    super.insertItemBuilder,
    super.removeItemBuilder,
    super.buildDefaultDragHandles,
    super.longPressDraggable,
    super.isSameItem,
    super.dragStartDelay,
    super.nonDraggableItems = const [],
    super.lockedItems = const [],
    super.enableSwap,
  });

  const ReorderableAnimatedListImpl.grid({
    super.key,
    required super.items,
    required SliverGridDelegate super.sliverGridDelegate,
    required ItemBuilder super.itemBuilder,
    super.enterTransition,
    super.exitTransition,
    super.onReorder,
    super.onReorderStart,
    super.onReorderEnd,
    super.proxyDecorator,
    super.insertDuration,
    super.removeDuration,
    required super.scrollDirection,
    super.insertItemBuilder,
    super.removeItemBuilder,
    super.buildDefaultDragHandles,
    super.longPressDraggable,
    super.isSameItem,
    super.dragStartDelay,
    super.nonDraggableItems = const [],
    super.lockedItems = const [],
    super.enableSwap,
  });

  @override
  ReorderableAnimatedListImplState<E> createState() =>
      ReorderableAnimatedListImplState<E>();
}

class ReorderableAnimatedListImplState<E extends Object>
    extends ReorderableAnimatedListBaseState<Widget,
        ReorderableAnimatedListImpl<E>, E> {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    assert(debugCheckHasOverlay(context));
    return ReorderableAnimatedBuilder(
      key: listKey,
      initialCount: oldList.length,
      onReorder: onReorder,
      onReorderStart: onReorderStart,
      onReorderEnd: onReorderEnd,
      proxyDecorator: proxyDecorator,
      insertAnimationBuilder: insertAnimationBuilder,
      removeAnimationBuilder: removeAnimationBuilder,
      itemBuilder: itemBuilder,
      scrollDirection: scrollDirection,
      delegateBuilder: sliverGridDelegate,
      buildDefaultDragHandles: buildDefaultDragHandles,
      longPressDraggable: longPressDraggable,
      dragStartDelay: dragStartDelay,
      nonDraggableIndices: nonDraggableItems,
      lockedIndices: lockedIndices,
    );
  }
}
