import 'package:fixitnow/models/product/product.dart';
import 'package:fixitnow/models/user/user_model.dart';

class ServiceModel {
  int? _serviceId;
  String _title;
  String _discription;
  String _photoUrl;
  ProductModel _productModel;
  UserModel _userModel;
  DateTime _createdAt;
  DateTime _updatedAt;

  ServiceModel(
    this._serviceId,
    this._title,
    this._discription,
    this._photoUrl,
    this._productModel,
    this._userModel,
    this._createdAt,
    this._updatedAt,
  );

  ServiceModel.copy(
    this._title,
    this._discription,
    this._photoUrl,
    this._productModel,
    this._userModel,
    this._createdAt,
    this._updatedAt,
  );

  set setServiceId(int? serviceId) {
    _serviceId = serviceId;
  }

  int? get getServiceId {
    return _serviceId;
  }

  set setTitle(String title) {
    _title = title;
  }

  String get getTitle {
    return _title;
  }

  set setDescription(String discription) {
    _discription = discription;
  }

  String get getDiscription {
    return _discription;
  }

  set setPhotoUrl(String photoUrl) {
    _photoUrl = photoUrl;
  }

  String get getPhotoUrl {
    return _photoUrl;
  }

  set setProductModel(ProductModel productModel) {
    _productModel = productModel;
  }

  ProductModel get getProductModel {
    return _productModel;
  }

  set setUserModel(UserModel userModel) {
    _userModel = userModel;
  }

  UserModel get getUserModel {
    return _userModel;
  }

  set setCreatedAt(DateTime createdAt) {
    _createdAt = createdAt;
  }

  DateTime get getCreatedAt {
    return _createdAt;
  }

  set setUpdatedAt(DateTime updatedAt) {
    _updatedAt = updatedAt;
  }

  DateTime get getUpdatedAt {
    return _updatedAt;
  }
}
