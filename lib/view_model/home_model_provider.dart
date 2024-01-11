import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/api_response.dart';
import 'package:mvvm_provider/model/movies_model.dart';
import 'package:mvvm_provider/repository/home_repository.dart';

class HomeViewModelProvider with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<ProductsListModel> productslist = ApiResponse.loading();

  setProduct(ApiResponse<ProductsListModel> response) {
    productslist = response;
    notifyListeners();
  }

  Future<void> fetchproduct() async {
    setProduct(ApiResponse.loading());

    _myRepo.fetchProductList().then((value) {
      setProduct(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProduct(ApiResponse.error(error.toString()));
    });
  }
}
