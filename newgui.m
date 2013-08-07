function varargout = newgui(varargin)
% NEWGUI MATLAB code for newgui.fig
%      NEWGUI, by itself, creates a new NEWGUI or raises the existing
%      singleton*.
%
%      H = NEWGUI returns the handle to a new NEWGUI or the handle to
%      the existing singleton*.
%
%      NEWGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWGUI.M with the given input arguments.
%
%      NEWGUI('Property','Value',...) creates a new NEWGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newgui

% Last Modified by GUIDE v2.5 06-Aug-2013 19:58:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newgui_OpeningFcn, ...
                   'gui_OutputFcn',  @newgui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before newgui is made visible.
function newgui_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newgui (see VARARGIN)
% Choose default command line output for newgui
handles.output = hObject;
handles.raw = []; handles.reg = [];

% Update handles structure
guidata(hObject, handles); 
axes(handles.rawImgFrame);
axes(handles.regImgFrame);

% UIWAIT makes newgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Executes on button press in loadButton.
function loadButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Create figure to use as GUI in your main function or a local function
% create structure of handles
handles.raw = loadimgs(); handles.reg = dftregister(handles.raw);
guidata(gcbo, handles);
set(handles.rawSlider,'Max',size(handles.raw,3),...
    'SliderStep',[1/size(handles.raw,3) 10/size(handles.raw,3)]);
axes(handles.rawImgFrame); imshow(handles.raw(:,:,1));
axes(handles.regImgFrame); imshow(handles.reg(:,:,1));

% --- Executes on slider movement.
function rawSlider_Callback(hObject, eventdata, handles)
% hObject    handle to rawSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%raw = guidata(handles.rawImgFrame);
frameRaw = get(handles.rawSlider,'Value');
axes(handles.rawImgFrame); imshow(handles.raw(:,:,round(frameRaw)));
axes(handles.regImgFrame); imshow(handles.reg(:,:,round(frameRaw)));



% --- Outputs from this function are returned to the command line.
function varargout = newgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





% --- Executes during object creation, after setting all properties.
function rawSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rawSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function regSlider_Callback(hObject, eventdata, handles)
% hObject    handle to regSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function regSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to regSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function regSlider_Callback(hObject, eventdata, handles)
% hObject    handle to regSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
frameReg = get(handles.regSlider,'Value');
axes(handles.regImgFrame);
%imshow(raw(:,:,2));
imshow(handles.rawImgFrame,reg(:,:,frameRaw));

% --- Executes during object creation, after setting all properties.
function regSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to regSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
