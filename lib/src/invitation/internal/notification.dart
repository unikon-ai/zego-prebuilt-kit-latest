// Package imports:
import 'dart:convert';

import 'package:zego_uikit/zego_uikit.dart';

// Project imports:
import 'package:zego_uikit_prebuilt_call/src/invitation/defines.dart';
import 'package:zego_uikit_prebuilt_call/src/invitation/inner_text.dart';

String getNotificationTitle({
  String? defaultTitle,
  required List<ZegoCallUser> callees,
  required bool isVideoCall,
  required ZegoCallInvitationInnerText? innerText,
  String? customdata,
}) {
  Map<String, dynamic>? customDataParsed;
  if (customdata != null) {
    customDataParsed = jsonDecode(customdata);
  }
  String? anonymousName;
  if (customDataParsed != null) {
    anonymousName = customDataParsed['show_anonymous_name'];
  }
  return defaultTitle ??
      (isVideoCall
              ? ((callees.length > 1
                      ? innerText?.incomingGroupVideoCallDialogTitle
                      : innerText?.incomingVideoCallDialogTitle) ??
                  param_1)
              : ((callees.length > 1
                      ? innerText?.incomingGroupVoiceCallDialogTitle
                      : innerText?.incomingVoiceCallDialogTitle) ??
                  param_1))
          .replaceFirst(
              param_1, anonymousName ?? ZegoUIKit().getLocalUser().name);
}

String getNotificationMessage({
  String? defaultMessage,
  required List<ZegoCallUser> callees,
  required bool isVideoCall,
  required ZegoCallInvitationInnerText? innerText,
}) {
  return defaultMessage ??
      (isVideoCall
          ? ((callees.length > 1
                  ? innerText?.incomingGroupVideoCallDialogMessage
                  : innerText?.incomingVideoCallDialogMessage) ??
              'Incoming video call...')
          : ((callees.length > 1
                  ? innerText?.incomingGroupVoiceCallDialogMessage
                  : innerText?.incomingVoiceCallDialogMessage) ??
              'Incoming voice call...'));
}
