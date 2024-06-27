import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonPaginatedDataTable extends HookConsumerWidget {
  const CommonPaginatedDataTable({
    super.key,
    required this.labels,
    required this.rows,
    required this.rowCount,
    required this.rowsPerPage,
    this.dataRowHeight = 60,
  });
  final List<Widget> labels;
  final List<DataRow> rows;
  final int rowCount;
  final int rowsPerPage;
  final double dataRowHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginatedDataTable2(
      showCheckboxColumn: false,
      dataRowHeight: dataRowHeight,
      hidePaginator: true,
      rowsPerPage: rowsPerPage, // 1ページあたりの行数
      columnSpacing: 10, // 列間のスペース
      columns: labels.map((label) => DataColumn2(label: label)).toList(),
      source: DataSource(
        rowCount: rowCount,
        rows: rows,
      ),
    );
  }
}

class DataSource extends DataTableSource {
  DataSource({
    required this.rowCount,
    required this.rows,
  });
  final List<DataRow> rows;

  @override
  DataRow getRow(int index) {
    return rows[index % rows.length]; // todo: Errorが出るため一時的に % を追加
  }

  @override
  int rowCount; // 全行数
  @override
  bool get isRowCountApproximate => false; // 行数は常に正確な値かどうか(不明な場合はfalseにしておく)
  @override
  int get selectedRowCount => 0; // 選択された行数(選択を使用しない場合は0で問題ない)
}
