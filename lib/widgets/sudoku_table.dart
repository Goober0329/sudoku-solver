import 'package:flutter/material.dart';
import 'package:sudoku_solver/models/board_square.dart';
import 'package:sudoku_solver/widgets/sudoku_cell.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/models/sudoku_grid.dart';

class SudokuTable extends StatelessWidget {
  static const _borderRadius = 15.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
        // border: Border.all(color: Colors.blueAccent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.blue[900].withOpacity(0.3),
            offset: Offset(0, 12),
            blurRadius: 12,
            spreadRadius: 5,
          ),
        ],
      ),
      // [ClipRRect] so that the border of Container isn't cut off
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
        child: Container(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: List.generate(
              Provider.of<SudokuGrid>(context, listen: false).height,
              (int rowNumber) => TableRow(
                children: List.generate(
                  Provider.of<SudokuGrid>(context, listen: false).width,
                  (int columnNumber) =>
                      ChangeNotifierProvider<BoardSquare>.value(
                    value: Provider.of<SudokuGrid>(context).userBoard[rowNumber]
                        [columnNumber],
                    child: SudokuCell(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
