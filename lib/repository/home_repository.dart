import 'package:mvvm_provider/data/network/BaseApiService.dart';
import 'package:mvvm_provider/data/network/NetworkApiService.dart';
import 'package:mvvm_provider/model/movies_model.dart';
import 'package:mvvm_provider/resources/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<ProductsListModel> fetchProductList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.productsListUrl);
      return response = ProductsListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
