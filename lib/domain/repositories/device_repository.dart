import 'package:divice/domain/entities/device.dart';

class CareRepositoryGetListParam {
  final String searchText;
  CareRepositoryGetListParam({required this.searchText});
}

abstract class CareRepository {
  Future<List<Care>> getList({required CareRepositoryGetListParam param});
  Future<Care> get({required String id});
  Future<bool> update({required String id, required Care data});
  Future<bool> create({required Care d});
  Future<bool> delete({required String id});
}
