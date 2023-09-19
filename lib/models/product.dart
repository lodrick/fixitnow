class ProductModel {
  int? _productId;
  String _productName;
  int _productCode;
  DateTime _createdAt;
  DateTime _updatedAt;

  ProductModel(
    this._productId,
    this._productName,
    this._productCode,
    this._createdAt,
    this._updatedAt,
  );

  ProductModel.copy(
    this._productName,
    this._productCode,
    this._createdAt,
    this._updatedAt,
  );

  set setProductId(int productId) {
    _productId = productId;
  }

  int? get getProductId {
    return _productId;
  }

  set setProductName(String productName) {
    _productName = productName;
  }

  String get getProductName {
    return _productName;
  }

  set setProductCode(int productCode) {
    _productCode = productCode;
  }

  int get getProductCode {
    return _productCode;
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
