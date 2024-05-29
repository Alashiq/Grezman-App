import '../../../Const/loading_status.dart';

class NotificationListModel extends LoadingStatusClass {
  LoadingStatus? loadState = LoadingStatus.NOT_STARTED;
  int? page = 1;
  int? Count = 1;
  int? last_page = 1;
  final List<NotificationItemModel>? list;

  NotificationListModel({
    this.loadState,
    this.list,
    this.page,
    this.last_page,
  });

  factory NotificationListModel.fromJson(Map<String, dynamic> jsonData) {
    return NotificationListModel(
      loadState: jsonData['loadState'],
      page: jsonData['page'],
      last_page: jsonData['last_page'],
      list: jsonData['list']
          .map<NotificationItemModel>(
              (data) => NotificationItemModel.fromJson(data))
          .toList(),
    );
  }

// Functions
  factory NotificationListModel.initial() {
    return NotificationListModel(
      loadState: LoadingStatus.NOT_STARTED,
      page: 1,
      last_page: 1,
      list: [],
    );
  }

  factory NotificationListModel.proccess() {
    return NotificationListModel(
      loadState: LoadingStatus.IN_PROGRESS,
      page: 1,
      last_page: 1,
      list: [],
    );
  }

  factory NotificationListModel.disconnect() {
    return NotificationListModel(
      loadState: LoadingStatus.NO_INTERNET,
      page: 1,
      last_page: 1,
      list: [],
    );
  }

  factory NotificationListModel.firstDone(page, data) {
    return NotificationListModel.fromJson({
      "loadState": LoadingStatus.DONE,
      "page": page + 1,
      "last_page": data['last_page'],
      "list": data['data'],
    });
  }
}

//

class NotificationItemModel {
  int? id;
  String? title;
  String? content;
  String? created_at;

  NotificationItemModel({
    this.id,
    this.title,
    this.content,
    this.created_at,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> jsonData) {
    return NotificationItemModel(
      id: jsonData['id'],
      title: jsonData['title'].toString(),
      content: jsonData['content'].toString(),
      created_at: jsonData['created_at'].toString(),
    );
  }
}
