import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction {more, delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: child,

        /// left side
        actions: <Widget>[
         
        ],

        /// right side
        secondaryActions: <Widget>[
          IconSlideAction(
            //caption: 'More',
            color: Color(0xffF4C852), 
            icon: Icons.block, 
            onTap: () => onDismissed(SlidableAction.more),
          ),
          IconSlideAction(
            //caption: 'Delete',
            color: Color(0xffFF5656), 
            icon: Icons.delete, 
            onTap: () => onDismissed(SlidableAction.delete),
          ),
        ],
      );
}