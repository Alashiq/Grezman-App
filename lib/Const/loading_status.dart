enum LoadingStatus {
  NOT_STARTED("البداية", 0),
  IN_PROGRESS("قيد التحميل", 1),
  IN_SECOND_PROGRESS("قيد التحميل الثاني", 2),
  DONE("تم التحميل", 200),
  CREATED("تم الادخال", 201),
  EMPTY("القائمة فارغة", 204),
  BAD_REQUEST("حدث خطأ ما", 400),
  NOT_AUTH("القائمة فارغة", 401),
  No_Permission("لا يوجد صلاحية", 403),
  NO_INTERNET("لا يوجد إتصال بالإنترنت", 404);

  const LoadingStatus(this.arabic, this.value);
  final String arabic;
  final int value;
}

class LoadingStatusClass {
  LoadingStatus? loadState = LoadingStatus.NOT_STARTED;

  LoadingStatusClass({
    this.loadState,
  });

  bool isNotStarted() {
    if (loadState!.value == 0) return true;
    return false;
  }

  bool isLoading() {
    if (loadState!.value == 1) return true;
    return false;
  }

  bool isSecondLoading() {
    if (loadState!.value == 2) return true;
    return false;
  }

  bool isLoadSuccess() {
    if (loadState!.value == 200) return true;
    return false;
  }

  bool isCreatedSuccess() {
    if (loadState!.value == 201) return true;
    return false;
  }

  bool isEmpty() {
    if (loadState!.value == 204) return true;
    return false;
  }

  bool isBadRequest() {
    if (loadState!.value == 400) return true;
    return false;
  }

  bool isNotAuth() {
    if (loadState!.value == 401) return true;
    return false;
  }

  bool isNoPermission() {
    if (loadState!.value == 403) return true;
    return false;
  }

  bool isNoInternet() {
    if (loadState!.value == 404) return true;
    return false;
  }
}
