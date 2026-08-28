import 'package:saku_kita_app/features/category/data_sources/category_remote_data_source.dart';
import 'package:saku_kita_app/features/category/models/category_request.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';

class CategoryRepo {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepo({required this.remoteDataSource});

  Future<List<CategoryResponse>?> getList() => remoteDataSource.getList();

  Future<bool> create(CategoryRequest param) => remoteDataSource.create(param);
  Future<bool> update(String id, CategoryRequest param) =>
      remoteDataSource.update(id, param);
  Future<bool> delete(String id) => remoteDataSource.delete(id);
}
