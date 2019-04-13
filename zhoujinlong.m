function varargout = zhoujinlong(varargin)
% ZHOU MATLAB code for zhou.fig
%      ZHOU, by itself, creates a new ZHOU or raises the existing
%      singleton*.
%
%      H = ZHOU returns the handle to a new ZHOU or the handle to
%      the existing singleton*.
%
%      ZHOU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZHOU.M with the given input arguments.
%
%      ZHOU('Property','Value',...) creates a new ZHOU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zhou_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zhou_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zhou

% Last Modified by GUIDE v2.5 13-Apr-2019 14:27:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zhou_OpeningFcn, ...
                   'gui_OutputFcn',  @zhou_OutputFcn, ...
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

% --- Executes just before zhou is made visible.
function zhou_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zhou (see VARARGIN)

% Choose default command line output for zhou
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zhou wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zhou_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
%value=get(hObject,'value');



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%有答案试题
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Str=[];
n= str2num(get(handles.edit1,'String'));
 if n<=0

         errordlg('请输入正确数值：大于0的正整数','警告','modal');%前者是内容，后者是名称

    end
i=1;
while i<=n
a=randi([0 100]);
b=randi([0 100]);
c=randi([0 100]);
%x='+-×÷';%alt 247 215
x='+-x/';
op='+-*/';
 s1=randi([1 4]);
 s2=randi([1 4]);
d=eval(['a' op(s1) 'b' op(s2) 'c']);
str=[a,b,c,s1,s2];

flag1=~isempty(strfind(Str,str));%是否非空（falg1==1非空）
flag2=logical(abs(d)>=100);%答案是否在100以内
flag3=  abs(d-fix(d))>1e-6;%判断d是否为整数
if flag1|| flag2|| flag3
    continue;
end
Str=[Str,str];
fp=fopen('have_ans.txt','a');
    if mod(i,2)==0
fprintf(fp,'%3d%5c%3d%5c%3d  =  %3d\n',a,x(s1),b,x(s2),c,d);
    else
fprintf(fp,'%3d%5c%3d%5c%3d  =  %3d        ',a,x(s1),b,x(s2),c,d);
    end

fclose(fp);
i=i+1;
end
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%无答案试题
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Str=[];
n= str2num(get(handles.edit1,'String'));
if n<=0

         errordlg('请输入正确数值：大于0的正整数','警告','modal');%前者是内容，后者是名称

    end
i=1;
while i<=n
a=randi([0 100]);
b=randi([0 100]);
c=randi([0 100]);
% x='+-×÷';%alt 247 215
%x='+-×÷';
x='+-x/';
op='+-*/';
 s1=randi([1 4]);
 s2=randi([1 4]);
d=eval(['a' op(s1) 'b' op(s2) 'c']);
str=[a,b,c,s1,s2];
flag1=~isempty(strfind(Str,str));%是否非空（falg1==1非空）
flag2=logical(abs(d)>=100);
flag3=  abs(d-fix(d))>1e-6;%判断d是否为整数
if flag1|| flag2|| flag3
    continue;
end
Str=[Str,str];
fp=fopen('no_ans.txt','a');
 if mod(i,2)==0
fprintf(fp,'%3d%3c%3d%3c%3d = \n',a,x(s1),b,x(s2),c);
    else
fprintf(fp,'%3d%3c%3d%3c%3d =        ',a,x(s1),b,x(s2),c);
    end
fclose(fp);
i=i+1;
end
