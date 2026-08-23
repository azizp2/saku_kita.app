import 'package:saku_kita_app/core/models/base_response.dart';
import 'package:saku_kita_app/features/category/data_sources/category_remote_data_source.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';

class CategoryRepo {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepo({required this.remoteDataSource});

  Future<List<CategoryResponse>?> getList() => remoteDataSource.getList();
}
