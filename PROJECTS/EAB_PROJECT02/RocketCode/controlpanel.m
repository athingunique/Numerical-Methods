function varargout = controlpanel(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @controlpanel_OpeningFcn, ...
                   'gui_OutputFcn',  @controlpanel_OutputFcn, ...
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

function controlpanel_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
%uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = controlpanel_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in launch.
function launch_Callback(hObject, eventdata, handles)
disp('Launching')
global burn bball
launchrocket(10*burn.totaltime,burn,bball);

% --- Executes on button press in abort.
function abort_Callback(hObject, eventdata, handles)
disp('LAUNCH ABORTED')
close all

function launchangle_Callback(hObject, eventdata, handles)
global bball
launchangle = str2double(get(hObject,'String'));
bball.velocity.angle = launchangle;
bball.drag.angle = bball.velocity.angle;
bball.thrust.angle = bball.drag.angle;

% --- Executes during object creation, after setting all properties.
function launchangle_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function massflow_Callback(hObject, eventdata, handles)
global burn
burn.massflow = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function massflow_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function burn1s_Callback(hObject, eventdata, handles)
global burn bball
burn.starts(1) = str2double(get(hObject,'String'));
burn.totaltime = sum(burn.ends-burn.starts);
burn.fuelload = burn.massflow*burn.totaltime;
bball.mass = bball.drymass + burn.massflow*burn.totaltime;

% --- Executes during object creation, after setting all properties.
function burn1s_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function burn1e_Callback(hObject, eventdata, handles)
global burn bball
burn.ends(1) = str2double(get(hObject,'String'));
burn.totaltime = sum(burn.ends-burn.starts);
burn.fuelload = burn.massflow*burn.totaltime;
bball.mass = bball.drymass + burn.massflow*burn.totaltime;

% --- Executes during object creation, after setting all properties.
function burn1e_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in simtime.
function simtime_Callback(hObject, eventdata, handles)
global simtime
switch get(hObject,'Value');
    case 1
        simtime = 'Calculate';
    case 2
        simtime = '7';
end

% --- Executes during object creation, after setting all properties.
function simtime_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
