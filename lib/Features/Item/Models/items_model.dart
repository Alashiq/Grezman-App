import '../../../Const/loading_status.dart';

class ItemListModel extends LoadingStatusClass {
  LoadingStatus? loadState = LoadingStatus.NOT_STARTED;
  int? page = 1;
  int? Count = 1;
  int? last_page = 1;
  final List<ItemItemModel>? list;

  ItemListModel({
    this.loadState,
    this.list,
    this.page,
    this.last_page,
  });

  factory ItemListModel.fromJson(Map<String, dynamic> jsonData) {
    return ItemListModel(
      loadState: jsonData['loadState'],
      page: jsonData['page'],
      last_page: jsonData['last_page'],
      list: jsonData['list']
          .map<ItemItemModel>((data) => ItemItemModel.fromJson(data))
          .toList(),
    );
  }

// Functions
  factory ItemListModel.initial() {
    return ItemListModel(
      loadState: LoadingStatus.NOT_STARTED,
      page: 1,
      last_page: 1,
      list: [],
    );
  }

  factory ItemListModel.proccess() {
    return ItemListModel(
      loadState: LoadingStatus.IN_PROGRESS,
      page: 1,
      last_page: 1,
      list: [],
    );
  }

  factory ItemListModel.firstDone(page, data) {
    return ItemListModel.fromJson({
      "loadState": LoadingStatus.DONE,
      "page": page + 1,
      "last_page": data['last_page'],
      "list": data['data'],
    });
  }
}

//

class ItemItemModel {
  int? id;
  String? name;
  String? description;

  ItemItemModel({
    this.id,
    this.name,
    this.description,
  });

  factory ItemItemModel.fromJson(Map<String, dynamic> jsonData) {
    return ItemItemModel(
      id: jsonData['id'],
      name: jsonData['name'].toString(),
      description: jsonData['description'].toString(),
    );
  }
}
