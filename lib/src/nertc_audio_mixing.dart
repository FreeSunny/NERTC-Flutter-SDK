part of nertc;

/// 伴音
class NERtcAudioMixingManager {
  final _AudioMixingEventHandler _handler = _AudioMixingEventHandler();

  NERtcAudioMixingManager._();

  _EventHandler _eventHandler() => _handler;

  AudioMixingApi _api = AudioMixingApi();

  Future<int> setEventCallback(NERtcAudioMixingEventCallback callback) async {
    assert(callback != null);
    _handler.setCallback(callback);
    IntValue reply = await _api.setAudioMixingEventCallback();
    return reply.value;
  }

  Future<int> clearEventCallback() async {
    _handler.setCallback(null);
    IntValue reply = await _api.clearAudioMixingEventCallback();
    return reply.value;
  }

  /// 开始混音任务
  Future<int> startAudioMixing(NERtcAudioMixingOptions options) async {
    IntValue reply = await _api.startAudioMixing(StartAudioMixingRequest()
      ..path = options?.path
      ..loopCount = options?.loopCount
      ..sendEnabled = options?.sendEnabled
      ..sendVolume = options?.sendVolume
      ..playbackEnabled = options?.playbackEnabled
      ..playbackVolume = options?.playbackVolume);
    return reply.value;
  }

  /// 结束混音任务
  Future<int> stopAudioMixing() async {
    IntValue reply = await _api.stopAudioMixing();
    return reply.value;
  }

  /// 暂停混音任务
  Future<int> pauseAudioMixing() async {
    IntValue reply = await _api.pauseAudioMixing();
    return reply.value;
  }

  /// 恢复混音任务
  Future<int> resumeAudioMixing() async {
    IntValue reply = await _api.resumeAudioMixing();
    return reply.value;
  }

  /// 设置混音发送音量
  Future<int> setAudioMixingSendVolume(int volume) async {
    assert(volume != null);
    IntValue reply =
        await _api.setAudioMixingSendVolume(IntValue()..value = volume);
    return reply.value;
  }

  /// 获取混音发送音量
  Future<int> getAudioMixingSendVolume() async {
    IntValue reply = await _api.getAudioMixingSendVolume();
    return reply.value;
  }

  /// 设置混音播放音量
  Future<int> setAudioMixingPlaybackVolume(int volume) async {
    assert(volume != null);
    IntValue reply =
        await _api.setAudioMixingPlaybackVolume(IntValue()..value = volume);
    return reply.value;
  }

  /// 获取混音播放音量
  Future<int> getAudioMixingPlaybackVolume() async {
    IntValue reply = await _api.getAudioMixingPlaybackVolume();
    return reply.value;
  }

  /// 获取混音文件时长
  Future<int> getAudioMixingDuration() async {
    IntValue reply = await _api.getAudioMixingDuration();
    return reply.value;
  }

  /// 获取混音任务当前进度
  Future<int> getAudioMixingCurrentPosition() async {
    IntValue reply = await _api.getAudioMixingCurrentPosition();
    return reply.value;
  }

  /// 定位到具体混音时间点
  Future<int> setAudioMixingPosition(int position) async {
    assert(position != null);
    IntValue reply =
        await _api.setAudioMixingPosition(IntValue()..value = position);
    return reply.value;
  }
}

class NERtcAudioMixingOptions {
  const NERtcAudioMixingOptions(
      {this.path,
      this.loopCount,
      this.sendEnabled,
      this.sendVolume,
      this.playbackEnabled,
      this.playbackVolume});

  final String path;
  final int loopCount;
  final bool sendEnabled;
  final int sendVolume;
  final bool playbackEnabled;
  final int playbackVolume;
}
