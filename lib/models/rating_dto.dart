class RatingDto {
  String _ratingValue;
  String _ratingName;

  RatingDto(
    this._ratingValue,
    this._ratingName,
  );

  set setRatingValue(String ratingValue) {
    _ratingValue = ratingValue;
  }

  String get getRatingValue {
    return _ratingValue;
  }

  set setRatingName(String ratingName) {
    _ratingName = ratingName;
  }

  String get getRatingName {
    return _ratingName;
  }
}
