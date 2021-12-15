class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialLoadingLoginState extends SocialStates {}

class SocialCompleteLoginState extends SocialStates {}

class SocialErrorLoginState extends SocialStates {
  var error;

  SocialErrorLoginState(this.error);
}

class SocialLoadingRegisterState extends SocialStates {}

class SocialCompleteRegisterState extends SocialStates {}

class SocialErrorRegisterState extends SocialStates {
  var error;

  SocialErrorRegisterState(this.error);
}

class SocialLoadingCreateState extends SocialStates {}

class SocialCompleteCreateState extends SocialStates {}

class SocialErrorCreateState extends SocialStates {
  var error;

  SocialErrorCreateState(this.error);
}

class SocialLoadingMailState extends SocialStates {}

class SocialCompleteCreateMailState extends SocialStates {}

class SocialErrorMailState extends SocialStates {
  var error;

  SocialErrorMailState(this.error);
}

class SocialCompleteInstanceState extends SocialStates {}

class SocialCompleteGetDataState extends SocialStates {}

class SocialChangeBottomNavState extends SocialStates {}

class ShopPasswordVisibilityState extends SocialStates {}

class SocialImagePickerState extends SocialStates {}

class SocialCompleteUploadImagesState extends SocialStates {}

class SocialErrorUploadImagesState extends SocialStates {}

class SocialCompleteUploadCoversState extends SocialStates {}

class SocialErrorUploadCoverState extends SocialStates {}

/// POST
class SocialCompleteCreatePostState extends SocialStates {}

class SocialErrorCreatePostState extends SocialStates {}

class SocialImagePickerPostState extends SocialStates {}

class SocialCloseSelectedPostImageState extends SocialStates {}

class SocialCompleteUploadPostImagesState extends SocialStates {}

class SocialErrorUploadPostImagesState extends SocialStates {}

class SocialCompleteGetPostElementState extends SocialStates {}

class SocialCompleteGetPostState extends SocialStates {}

class SocialErrorGetPostState extends SocialStates {}

class SocialCompleteLikedState extends SocialStates {}

class SocialErrorLikedState extends SocialStates {}

class SocialCompleteGetLikedState extends SocialStates {}

class SocialErrorGetLikedState extends SocialStates {}

class SocialCompleteGetPostLikesState extends SocialStates {}

class SocialErrorGetPostLikesState extends SocialStates {}

class SocialCompleteGetAllUsersState extends SocialStates {}

class SocialErrorGetAllUsersState extends SocialStates {}

class SocialCompleteGetMessagesState extends SocialStates {}
