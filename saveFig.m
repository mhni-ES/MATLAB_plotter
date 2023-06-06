function saveFig( fname, height, width, three_dim, no_tightFig)
%saveFig fnmae is required argument. height, width and three_dim is
%optional. Default height is 6 default width is 14.6. Use argument
%three_dim to change renderer to openGL for three dimensional figures to
%make bmp graphics instead of huge vector graphics file.


%   h = legend handle.  h = legend('sig1','sig2',...)
if nargin == 0
    error('You must specify a filename -> saveFig(str,...)')
end

% A full page is ~ 22.867590438 cm ((\the\textheight - 0.8pt) * 0.03514)
% 0.8 pt is 2x framerule if figure frames are used.
if nargin >= 2
    height = num2str(height);
else
    height = 'auto';
end

if nargin >= 3
    if isempty(width)
        width = 14.56941;
    else
    width = num2str(width);
    end
else
    width = (443.86319 - 0.8) * 0.03514;
    %width = 14.56941; 
    % From latex \the\textwidth - 2x framerule (which is 0.4pt)
    % one pt is 0.03514 cm
end


if nargin >= 4
    display("You specified this is a 3D figure and chose to use openGL renderer in saveFig")
    render = 'openGL';
else
    render = 'painters';
end

if nargin == 5
    display("no tightFig")
else
    no_tightFig = 0;
end
% There can be multiple axes and legends, set Latex interpretor for all
currentFig = gcf;
figChildren = currentFig.Children;
for i = 1:length(figChildren)
    if strcmp(figChildren(i).Type,'axes') % if axes
        set(figChildren(i),'TickLabelInterpreter', 'latex','Fontsize',11);
    end
    if strcmp(figChildren(i).Type,'legend') % if legend
        set(figChildren(i),'Interpreter','latex','Fontsize',11);
        figChildren(i).Box = 'off';
    end
    if strcmp(figChildren(i).Type,'colorbar') % if colorbar
        set(figChildren(i),'TickLabelInterpreter', 'latex','Fontsize',11);
    end
end


s = getStyle(height,width,render);
drawnow;
if ~no_tightFig
tightfig;
else
   tightfig_org;
end
hgexport(currentFig,[fname 'tmp.eps'],s,'applystyle',true);
if ~no_tightFig
tightfig;
else
   tightfig_org;
end
hgexport(currentFig,[fname 'tmp.eps'],s,'applystyle',true);
if ~no_tightFig
tightfig;
else
   tightfig_org;
end
hgexport(currentFig,[fname '.eps']);
delete([fname 'tmp.eps'])


%         s.Format = 'png'; %I needed this to make it work but maybe you wont.
%         hgexport(currentFig,[fname '.png'],s,'applystyle',true);
%         tightfig;
%         %a = gcf; a.Units = 'centimeters';
%         %a.Position(3) = width; a.Position(4) = str2num(height);
%         hgexport(currentFig,[fname '.png']);

end