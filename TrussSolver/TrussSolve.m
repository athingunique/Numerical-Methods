% Evan Baker
% EAB_PROJECT1
% 2 April 2014

function TrussSolve 
% This function will read in truss data files and do some simulations
clc
close all
figure(1)
hold on

multiplier = input('Displacement visualisation multiplier(recommend 5 for 1, 100 for 2):');
dataFiles = {'nodes';'elements';'lbc'}; % Make an array of the filenames we want to get

for i = 1:3 
    % Loop over the filename array
    eval([dataFiles{i} ' = getData(dataFiles{i});']); % Prompt the user to grab the files we want
end

for i = 1:length(lbc(:,1)); 
    % Do an error check on lbc.dat to make sure a later function will work
    if lbc(i,1) ~= i; % Make sure the nodes in lbc.dat are in ascending order
        error('Nodes are out of order in lbc.dat.')
        return % Terminate if lbc isn't structured properly
    end
end
        

plot(nodes(:,1),nodes(:,2),'bo'); % Plot the nodes
axis([min(nodes(:,1))-1, max(nodes(:,1))+1, min(nodes(:,2))-1, max(nodes(:,2))+1]); % Get a little room in the graph
labels = cellstr( num2str([1:length(nodes(:,1))]')); % Make a labels array for numbering the graph
text(nodes(:,1),nodes(:,2),labels,'VerticalAlignment','bottom','HorizontalAlignment','right'); % Put label text on graphs

for element = 1:length(elements(:,1)) % Do per element location/direction calculations
    [x(element,:), y(element,:)] = getElementsXY(element,elements,nodes); % Store x, y coordinate vectors for the ends of the elements
    plot(x(element,:),y(element,:)); % Plot the element vectors 
end

labels2 = cellstr( num2str([1:length(elements(:,1))]')); % Make a labels array for numbering the elements
text(.5*(x(:,1)+x(:,2)),.5*(y(:,1)+y(:,2)),labels2,'VerticalAlignment','bottom','HorizontalAlignment','right'); %Put label text on graph

v = [x(:,2) - x(:,1),y(:,2) - y(:,1)]; % Get vector v, the element origin vectors
elementAngles = atan2(v(:,2),v(:,1)); % Get the angle of every element to the +x axis in radians
elementLengths = sqrt((v(:,1)).^2 + (v(:,2)).^2); % Calculate the element lengths from the endpoints


SSM = zeros(2*length(nodes(:,1))); % Prealloc an empty system stiffness matrix
for element = 1:length(elements(:,1)) % Do element and system stiffness calculations
    % Make ESM#, the numbered element stiffness matrix.
    eval(['ESM' num2str(element) ' = elementStiffnessMatrix(elements,elementLengths,element,elementAngles(element));']); 
    % Composite the ESMs into SSM, the system stiffness matrix
    SSM = SSM + compositeSystem(elements,element,nodes,eval(['ESM' num2str(element)']));
end

constrainedState = zeros(1,2*length(nodes(:,1))); % Prealloc some vectors
forceApplied = zeros(2*length(nodes(:,1)),1);
displacementVarCount = 1:2*length(nodes(:,1));

for node = 1:length(nodes(:,1));
    for i = 1:2
        % Make a vector [x1 y1 x2 y2...] with 1 (true) if constrained, 0
        % (false if not constrained per element per direction
        constrainedState(2*node-2+i) = lbc(node,i+1);
        % Put the loads in a similar vector to constraints above
        forceApplied(2*node-2+i,1) = lbc(node,i+3);
    end
end

for i = 2*length(nodes(:,1)):-1:1; % Remove rows and columns from the SSM and the force solution matrix 
    if constrainedState(i) == 1;
        SSM(i,:) = []; % Remove rows/columns of constrained elements
        SSM(:,i) = [];
        forceApplied(i,:) = []; % Remove loads on constrained elements
        displacementVarCount(i) = []; % Keep track of which elements' displacement we're solving for
    end
end

nodes
displacement = (SSM\forceApplied) % FINALLY do the displacement calculation
displacement = multiplier*displacement;
nodesDisplaced = nodes'; % We want to count, and matlab linear indexes in the wrong direction so invert
for i = 1:length(displacementVarCount)
    % Build a displaced node matrix
    nodesDisplaced(displacementVarCount(i)) = nodesDisplaced(displacementVarCount(i)) + multiplier*displacement(i);
end

nodesMoved = nodesDisplaced'; % Flip the new node position matrix back into usable form

for element = 1:length(elements(:,1)) % Do per element location/direction calculations
    [xMoved(element,:), yMoved(element,:)] = getElementsXY(element,elements,nodesMoved); % Store new x, y coordinate vectors for the ends of the elements
    plot(xMoved(element,:),yMoved(element,:),'r'); % Plot deformed element vectors
end

plot(nodesMoved(:,1),nodesMoved(:,2),'ro'); % Plot moved nodes



displacementVarCount
nodesMoved

end


function [m] = getData(str) 
% Prompt user to load a *.dat file of filename $str, return matr m with
% file contents.
[filename, pathname] = uigetfile({strcat(str,'*.dat'),'Truss Data'},'Select File');
absPath = strcat(pathname,filename); % Make an absolute path to make sure we grab the file properly
m = load(absPath); % Load the contents of the file into matrix m
end

function [x, y] = getElementsXY(element,elements,nodes)
% Take the elements matr, the element variable, and the nodes matr
% Return the vectors of the elements as x, y
x = [nodes(elements(element,1),1), nodes(elements(element,2),1)]; % x vector
y = [nodes(elements(element,1),2), nodes(elements(element,2),2)]; % y vector
end

function [esm] = elementStiffnessMatrix(elements,elementLengths,element,angle)
% Make the element stiffness esm matrix given elements matr, elementLength, the
% element we're interested in, and the angle of it to the horizontal.
esm = ((elements(element,3)*elements(element,4))/elementLengths(element)).*[...
cos(angle)^2,cos(angle)*sin(angle),-cos(angle)^2,-cos(angle)*sin(angle);...
cos(angle)*sin(angle),sin(angle)^2,-cos(angle)*sin(angle),-sin(angle)^2;...
-cos(angle)^2,-cos(angle)*sin(angle),cos(angle)^2,cos(angle)*sin(angle);...
-cos(angle)*sin(angle),-sin(angle)^2,cos(angle)*sin(angle),sin(angle)^2;...
];
end

function [ssm] = compositeSystem(elements,element,nodes,esm)
% Take an esm of size 4x4, make a dummy system stiffness matr, take elements matr,
% nodes matr, and the element of interest. Fill the dummy ssm appropriately
% and return it.
ssm = zeros(2*length(nodes(:,1)));
startNode = elements(element,1);
endNode = elements(element,2);
map = [2*startNode-1,2*startNode,2*endNode-1,2*endNode];
for i = 1:4
    for j = 1:4
        ssm(map(i),map(j)) = esm(i,j);
    end
end

end



