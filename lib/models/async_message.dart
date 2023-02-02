class AsyncMessage {
  final bool _isSuccess;
  bool get isSuccess => _isSuccess;

  final String _message;
  get message => _message;

  AsyncMessage({
    required isSuccess,
    required message,
  })  : _isSuccess = isSuccess,
        _message = message;
}
