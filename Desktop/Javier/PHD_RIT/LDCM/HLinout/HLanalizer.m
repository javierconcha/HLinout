cd /Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout
%% script to plot different HL outputs

pathfolder = '/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/';


% chl dpf = FFbb026; mineral = FFbb028
filename = 'Pdark091913old.txt';
[Rrsold,wlold] = HLextraction(pathfolder,filename);

% chl,mineral = avgpar
filename = 'PDarkPixel091913.txt';
[Rrsavgpar,wlavgpar] = HLextraction(pathfolder,filename);

% chl dpf = FFbb002; mineral = FFbb002
filename = 'Pdark091913FFbb002.txt';
[RrsFFbb002,wlFFbb002] = HLextraction(pathfolder,filename);

% chl dpf = FFbb002; mineral = FFbb002;cdom(440)=0.116
filename = 'Pdark091913cdp116.txt';
[Rrscdp116,wlcdp116] = HLextraction(pathfolder,filename);



figure
fs = 15;
set(gcf,'color','white')
plot(wlold,Rrsold,'r')
hold on
plot(wlavgpar,Rrsavgpar,'b')
plot(wlFFbb002,RrsFFbb002,'k');
plot(wlcdp116,Rrscdp116,'g');
legend('old','avgpar','FFbb002','CDOM \gamma=0.116')
title('HL output','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('Rrs','fontsize',fs)
set(gca,'fontsize',fs)
% xlim([400 900])


