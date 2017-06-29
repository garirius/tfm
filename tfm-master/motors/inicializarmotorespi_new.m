function ID=inicializarmotorespi_new()
%%
%Creada por Francisco Torcal a partir de ShortSample
%27/04/2016

% Create Instance of controller class
ID = C843_GCS_Controller();
stagename = 'M-511.DD';

% connect using PCI 
ID = ID.Connect(1);
ID = ID.InitializeController();
%%
% query controller identification
ID.qIDN()
% query axes
availableaxes = ID.qSAI_ALL();
if(isempty(availableaxes))
	return;
end
for i=1:length(availableaxes) %modificado para inicializar ambos motores (Fran)
    axisname = availableaxes(i);
    %% connect a stage
    ID.CST(axisname,stagename);
    ID.qCST(axisname)
    %%

    % switch on servo and search reference switch to reference stage
    ID.INI(axisname);
    ID.FNL(axisname)
    bReferencing = 1;
    % wait for Referencing to finish
    while(bReferencing)
        pause(0.1);
        bReferencing = (ID.IsReferencing(axisname)==1);
    end
    while(ID.C843_IsMoving(axisname)) %esta linea modificada respecto a ShortSample
        pause(0.1);
    end
end
