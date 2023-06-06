clear all; 
%close all; 
clc; 

%% 
file_no = 'sim_S12_no_cut.txt';
data_no = dlmread(file_no,'\t',3,0); 

file_with = 'sim_S12_with_cut.txt';
data_with = dlmread(file_with,'\t',3,0); 

%% 
setFigOptions(); 
colours = distinguishable_colors(4);

s_range = [1.90, 2.15]
x_range = [7.75, 9.5]

fig_width = 8.58;

%% Plot figure
figure(8); clf; hold on; 
axis tight; grid minor; 
l = legend('Location','best'); l.NumColumns = 1; 

% Sim
plot(data_no(:,1), data_no(:,2) ...
    , 'DisplayName', 'Simulated $\mathrm{S}_{21}$ Without Cut' ...
    , 'Color', colours(1,:) ...
    ,'LineWidth',1.5 ...
    )

plot(data_with(:,1), data_with(:,2) ...
    , 'DisplayName', 'Simulated $\mathrm{S}_{21}$ With Cut' ...
    , 'Color', colours(2,:) ...
    ,'LineWidth',1.5 ...
    )

xlabel('Frequency [GHz]')
ylabel('Amplitude [dB]')

axis([7.25, 9.75, -60, -20])

%% 
name = 'plot_cut_sim'; fig_height = 6;
saveFig(name, fig_height, fig_width); 
