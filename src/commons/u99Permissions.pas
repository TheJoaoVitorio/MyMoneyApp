unit u99Permissions;

interface


  uses System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Actions,System.Messaging,
  System.Permissions, FMX.DialogService, FMX.MediaLibrary.Actions,FMX.Media



(*
   uses System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Permissions,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, System.Sensors, FMX.Media,
    FMX.Objects, FMX.MediaLibrary.Actions, System.Actions,System.Messaging, FMX.ActnList,
    FMX.DialogService, FMX.Graphics, FMX.StdActns, FMX.Controls.Presentation
*)

{$IFDEF ANDROID}
,Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
{$ENDIF}


;

type

    TCallbackProc = procedure(Sender: TObject) of Object;

    T99Permissions = class
    private
        CurrentRequest : string;
        pCamera, pReadStorage, pWriteStorage : string; // Camera / Library
        pFineLocation, pCoarseLocation : string; // GPS
        FSavedCameraActive: Boolean;

(*
          procedure PermissionRequestResult( Sender: TObject;
                      const APermissions: TArray<string>;
                      const AGrantResults: TArray<TPermissionStatus>);


        procedure PermissionRequestResult( Sender: TObject;
                    const APermissions: ClassicStringDynArray;
                    const AGrantResults: TClassicPermissionStatusDynArray); //TArray<TPermissionStatus>);
*)
    procedure PermissionRequestResult(Sender: TObject;
                   const APermissions: TClassicStringDynArray;
                   const AGrantResults: TClassicPermissionStatusDynArray);


    procedure ActivateCameraPermissionRequestResult(Sender: TObject;
                   const APermissions: TClassicStringDynArray;
                   const AGrantResults: TClassicPermissionStatusDynArray);

(*
      procedure LoadPicturePermissionRequestResult(Sender: TObject;
                     const APermissions: TClassicStringDynArray;
                     const AGrantResults: TClassicPermissionStatusDynArray);
*)

    procedure DisplayRationale(Sender: TObject; const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);


    public
        MyCallBack, MyCallBackError : TCallbackProc;
        MyCameraAction : TTakePhotoFromCameraAction;
        MyLibraryAction : TTakePhotoFromLibraryAction;
        CameraComponent: TCameraComponent;

        constructor Create;
        function VerifyCameraAccess(): boolean;
        procedure Camera(ActionPhoto: TTakePhotoFromCameraAction;
                          ACallBackError: TCallbackProc = nil);
        procedure PhotoLibrary(ActionLibrary: TTakePhotoFromLibraryAction;
                        ACallBackError: TCallbackProc = nil);
        procedure Location(ACallBack: TCallbackProc = nil;
                        ACallBackError: TCallbackProc = nil);


    published
        //property CameraGranted: boolean read FCameraGranted write FCameraGranted;
end;

implementation


function T99Permissions.VerifyCameraAccess(): boolean;
begin
    Result := false;

    {$IFDEF ANDROID}
    Result := PermissionsService.IsEveryPermissionGranted([pCamera,
                                                           pReadStorage,
                                                           pWriteStorage]);
    {$ENDIF}
end;

constructor T99Permissions.Create();
begin
    {$IFDEF ANDROID}
    pCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
    pReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
    pWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
    pCoarseLocation := JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
    pFineLocation := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);

    {$ENDIF}
end;

procedure T99Permissions.PermissionRequestResult(Sender: TObject;
  const APermissions: TClassicStringDynArray; //TArray<string>;
  const AGrantResults: TClassicPermissionStatusDynArray); //TArray<TPermissionStatus>);


var
    ret : boolean;
begin
    ret := false;

    // CAMERA (CAMERA + READ_EXTERNAL_STORAGE + WRITE_EXTERNAL_STORAGE)
    if CurrentRequest = 'CAMERA' then
    begin
        if (Length(AGrantResults) = 3) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) and
           (AGrantResults[2] = TPermissionStatus.Granted) then
        begin
            ret := true;

            if Assigned(MyCameraAction) then
                MyCameraAction.Execute;
        end;
    end;

    // LIBRARY (READ_EXTERNAL_STORAGE + WRITE_EXTERNAL_STORAGE)
    if CurrentRequest = 'LIBRARY' then
    begin        
        if (Length(AGrantResults) = 2) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) then
        begin
            ret := true;

            if Assigned(MyLibraryAction) then
                MyLibraryAction.Execute;
        end;
    end;

    // LOCATION (ACCESS_COARSE_LOCATION + ACCESS_FINE_LOCATION)
    if CurrentRequest = 'LOCATION' then
    begin
        if (Length(AGrantResults) = 2) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) then
        begin
            ret := true;
            
            if Assigned(MyCallBack) then            
                MyCallBack(Self);
        end;
    end;

    if NOT ret then    
    begin
        if Assigned(MyCallBackError) then
            MyCallBackError(Self);
    end;
end;


(*
  procedure T99Permissions.LoadPicturePermissionRequestResult(Sender: TObject; const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray);
  begin
    if (Length(AGrantResults) = 2) and
       (AGrantResults[0] = TPermissionStatus.Granted) and
       (AGrantResults[1] = TPermissionStatus.Granted) then
      TakePhotoFromLibraryAction1.Execute
    else
      TDialogService.ShowMessage('Cannot do photo editing because the required permissions are not granted');
  end;
*)

procedure T99Permissions.ActivateCameraPermissionRequestResult(Sender: TObject; const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray);
begin
  // 1 permission involved: CAMERA
  if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
  begin
    { Turn on the Camera }
    CameraComponent.Active := True;
    FSavedCameraActive := True;
  end
  else
    TDialogService.ShowMessage('Cannot start the camera because the required permission has not been granted');
end;




procedure T99Permissions.Camera(ActionPhoto: TTakePhotoFromCameraAction;
                                ACallBackError: TCallbackProc = nil);
begin
    MyCameraAction := ActionPhoto;
    MyCallBackError := ACallBackError;
    CurrentRequest := 'CAMERA';

    {$IFDEF ANDROID}
    PermissionsService.RequestPermissions([pCamera, pReadStorage, pWriteStorage],
                                           PermissionRequestResult,DisplayRationale);

//    PermissionsService.RequestPermissions([FPermissionCamera], ActivateCameraPermissionRequestResult, DisplayRationale);
    {$ENDIF}

    {$IFDEF IOS}
    MyCameraAction.Execute;
    {$ENDIF}

    {$IFDEF MSWINDOWS}
    TDialogService.ShowMessage('No soportado en Windows');
    {$ENDIF}
end;

procedure T99Permissions.PhotoLibrary(ActionLibrary: TTakePhotoFromLibraryAction;
                                      ACallBackError: TCallbackProc = nil);
begin
    MyLibraryAction := ActionLibrary;
    MyCallBackError := ACallBackError;
    CurrentRequest := 'LIBRARY';

    {$IFDEF ANDROID}
    PermissionsService.RequestPermissions([pReadStorage, pWriteStorage],
                                           PermissionRequestResult,DisplayRationale);
    {$ENDIF}

    {$IFDEF IOS}
    ActionLibrary.Execute;
    {$ENDIF}

    {$IFDEF MSWINDOWS}
    TDialogService.ShowMessage('No soportado en Windows');
    {$ENDIF}
end;


procedure T99Permissions.Location(ACallBack: TCallbackProc = nil;
                                  ACallBackError: TCallbackProc = nil);
begin
    MyCallBack := ACallBack;
    MyCallBackError := ACallBackError;
    CurrentRequest := 'LOCATION';

    {$IFDEF ANDROID}
    PermissionsService.RequestPermissions([pCoarseLocation, pFineLocation],
                                           PermissionRequestResult,DisplayRationale);
    {$ENDIF}

    {$IFDEF IOS}
    if Assigned(MyCallBack) then
        MyCallBack(Self);
    {$ENDIF}

    {$IFDEF MSWINDOWS}
    TDialogService.ShowMessage('No soportado en Windows');
    {$ENDIF}
end;


// Optional rationale display routine to display permission requirement rationale to the user
procedure T99Permissions.DisplayRationale(Sender: TObject; const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);
begin
  // Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
  // After the user sees the explanation, invoke the post-rationale routine to request the permissions
 // TDialogService.ShowMessage('The app needs to access the camera in order to work',
(*
      procedure(const AResult: TModalResult)
      begin
        APostRationaleProc;
      end)
*)
end;


end.
