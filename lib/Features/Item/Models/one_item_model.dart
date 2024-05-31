import '../../../Const/loading_status.dart';

class OneItemModel extends LoadingStatusClass {
  LoadingStatus? loadState = LoadingStatus.NOT_STARTED;
  int? id;
  String? name;
  String? description;

  OneItemModel({
    this.loadState,
    this.id,
    this.name,
    this.description,
  });

  factory OneItemModel.fromJson(Map<String, dynamic> jsonData) {
    return OneItemModel(
      loadState: LoadingStatus.DONE,
      id: jsonData['id'],
      name: jsonData['name'],
      description: jsonData['description'],
    );
  }

// Functions
  factory OneItemModel.initial() {
    return OneItemModel(
      loadState: LoadingStatus.NOT_STARTED,
    );
  }

  factory OneItemModel.proccess() {
    return OneItemModel(
      loadState: LoadingStatus.IN_PROGRESS,
    );
  }

  factory OneItemModel.disconnect() {
    return OneItemModel(
      loadState: LoadingStatus.NO_INTERNET,
    );
  }
}
