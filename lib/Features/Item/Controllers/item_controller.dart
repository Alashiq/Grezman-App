import 'package:flutter_starter/Features/Item/Actions/add_new_item.dart';
import 'package:flutter_starter/Features/Item/Actions/load_items.dart';
import 'package:flutter_starter/Features/Item/Actions/load_one_item.dart';
import 'package:get/get.dart';

class ItemController extends GetxController
    with LoadItemsMixin, AddNewItemMixin, LoadOneItemMixin {}
