import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final _expandedIndices = Set<int>();

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      
      itemCount: 16,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () => setState(() => _expandedIndices.contains(index)
            ? _expandedIndices.remove(index)
            : _expandedIndices.add(index)),
        child: new Container(
            color: Colors.green,
            child: new Center(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('$index'),
              ),
            )),
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(_expandedIndices.contains(index) ? 4 : 2, 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
