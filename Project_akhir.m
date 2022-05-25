function varargout = Project_akhir(varargin)
% PROJECT_AKHIR MATLAB code for Project_akhir.fig
%      PROJECT_AKHIR, by itself, creates a new PROJECT_AKHIR or raises the existing
%      singleton*.
%
%      H = PROJECT_AKHIR returns the handle to a new PROJECT_AKHIR or the handle to
%      the existing singleton*.
%
%      PROJECT_AKHIR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_AKHIR.M with the given input arguments.
%
%      PROJECT_AKHIR('Property','Value',...) creates a new PROJECT_AKHIR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_akhir_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_akhir_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project_akhir

% Last Modified by GUIDE v2.5 22-May-2022 23:41:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_akhir_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_akhir_OutputFcn, ...
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
kriteria = xlsread('AppVidcon_Konser','F7:K12');
fa = xlsread('AppVidcon_Konser','B24:E27');
kp = xlsread('AppVidcon_Konser','B33:E36');
jp = xlsread('AppVidcon_Konser','B42:E45');
dw = xlsread('AppVidcon_Konser','B51:E54');
kb = xlsread('AppVidcon_Konser','B60:E63');
ka = xlsread('AppVidcon_Konser','B69:E72');

% --- Executes just before Project_akhir is made visible.
function Project_akhir_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project_akhir (see VARARGIN)

% Choose default command line output for Project_akhir
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project_akhir wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_akhir_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in show_data.
function show_data_Callback(hObject, eventdata, handles)
% hObject    handle to show_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% kriteria = xlsread('AppVidcon_Konser','F7:K12');
% fa = xlsread('AppVidcon_Konser','B24:E27');
% kp = xlsread('AppVidcon_Konser','B33:E36');
% jp = xlsread('AppVidcon_Konser','B42:E45');
% dw = xlsread('AppVidcon_Konser','B51:E54');
% kb = xlsread('AppVidcon_Konser','B60:E63');
% ka = xlsread('AppVidcon_Konser','B69:E72');
handles.kriteria = xlsread('AppVidcon_Konser.xlsx','F7:K12');
handles.fa = xlsread('AppVidcon_Konser.xlsx','B24:E27');
handles.kp = xlsread('AppVidcon_Konser.xlsx','B33:E36');
handles.jp = xlsread('AppVidcon_Konser.xlsx','B42:E45');
handles.dw = xlsread('AppVidcon_Konser.xlsx','B51:E54');
handles.kb = xlsread('AppVidcon_Konser.xlsx','B60:E63');
handles.ka = xlsread('AppVidcon_Konser.xlsx','B69:E72');

set(handles.table_kriteria,'data',handles.kriteria);
set(handles.table_k1,'data',handles.fa);
set(handles.table_k2,'data',handles.kp);
set(handles.table_k3,'data',handles.jp);
set(handles.table_k4,'data',handles.dw);
set(handles.table_k5,'data',handles.kb);
set(handles.table_k6,'data',handles.ka);


% --- Executes on button press in reset_data.
function reset_data_Callback(hObject, eventdata, handles)
% hObject    handle to reset_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.table_kriteria,'data','');
set(handles.table_k1,'data','');
set(handles.table_k2,'data','');
set(handles.table_k3,'data','');
set(handles.table_k4,'data','');
set(handles.table_k5,'data','');
set(handles.table_k6,'data','');
set(handles.hasil, "string", "-");


% --- Executes on button press in hitung_hasil.
function hitung_hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hitung_hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%Kriteria
kriteria = get(handles.table_kriteria, "data");
fa = get(handles.table_k1,"data");
kp = get(handles.table_k2,"data");
jp = get(handles.table_k3,"data");
dw = get(handles.table_k4,"data");
kb = get(handles.table_k5,"data");
ka = get(handles.table_k6,"data");

kriteria_normal = calc_norm(kriteria)
[m,n] = size(kriteria_normal);
bobot_kriteria = bobot(kriteria_normal)
hitung_konsistensi(kriteria, bobot_kriteria, n)
%%FA
fa_normal = calc_norm(fa)
[m,n] = size(fa_normal);
bobot_fa = bobot(fa_normal)
hitung_konsistensi(fa, bobot_fa, n)
%%KP
kp_normal = calc_norm(kp)
[m, n] = size(kp_normal);
bobot_kp = bobot(kp_normal)
hitung_konsistensi(kp, bobot_kp, n)
%%JP
jp_normal = calc_norm(jp)
[m,n] = size(jp_normal);
bobot_jp = bobot(jp_normal)
hitung_konsistensi(jp, bobot_jp, n)
%%DW
dw_normal = calc_norm(dw)
[m,n] = size(dw_normal);
bobot_dw = bobot(dw_normal)
hitung_konsistensi(dw, bobot_dw, n)
%%KB
kb_normal = calc_norm(kb)
[m,n] = size(kb_normal);
bobot_kb = bobot(kb_normal)
hitung_konsistensi(kb, bobot_kb, n)
%%KA
ka_normal = calc_norm(ka)
[m,n] = size(ka_normal);
bobot_ka = bobot(ka_normal)
hitung_konsistensi(ka, bobot_ka, n)
%% perhitungan akhir
bobot_semua_kriteria = [bobot_fa bobot_kp bobot_jp bobot_dw bobot_kb bobot_ka]
skor = bobot_semua_kriteria * bobot_kriteria
alternatif = ["Zoom" "GMeet" "Skype" "Webex"]
[maksimal, indeks] = max(skor);
disp(alternatif(indeks))
disp(maksimal)
set(handles.hasil, "string", alternatif(indeks));

function [average] = bobot(matrix)
    [m,n] = size(matrix);
    for i= 1:m
        sumRow = 0;
        for j= 1:n
            sumRow = sumRow + matrix(i,j);
        end
        V(i) = (sumRow);
    end
    
    average = transpose(V)/m;


function [lambda] = eigen_value(dataPerbandingan,bobot,n)
    x = dataPerbandingan * bobot;
    y = x ./ bobot;
    z = sum(y);
    lambda = (1/n) * z;


function [rtn] = calc_norm(M)
    sM = sum(M);
    rtn = M./sM;


function [consist] = hitung_konsistensi(MPBk,w_MPB,n)
    indeksAcak = [0 0 0.58 0.9 1.12 1.24 1.32 1.41 1.45 1.49];
    RI = indeksAcak(1,n);
    Ws = MPBk * w_MPB;
    y = Ws ./ w_MPB;
    z = sum(y);
    t = (1/n) * z;
    CI = (t - n)/(n-1);
    consist = CI/RI;


% --- Executes when entered data in editable cell(s) in table_wkriteria.
function table_wkriteria_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_wkriteria (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function hasil_CreateFcn(hObject, eventdata, handles)

% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
