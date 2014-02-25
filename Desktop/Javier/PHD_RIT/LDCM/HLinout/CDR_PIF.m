cd /Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/
%%
% Basic Stats       Min     Max          Mean          Stdev

% tt = load('OntarioBeachSmall_AllBandstat.txt');
% tt = load('PIFstatAll.txt'); % less conservative and based in DN
% tt = load('PIFstat.txt');% more conservative and based in lndsr
tt = load('PIFstatImproved.txt');% with PIFmaskFINAL.txt


nscenes = size(tt,1)/6;
OBSmean = 0.0001*reshape(tt(:,3),6,nscenes);

% OBSmean = [OBSmean(:,1:3) OBSmean(:,5:end)];

wl = [0.485, 0.56, 0.66, 0.83, 1.65, 2.22];

figure 
fs = 15;
set(gcf,'color','white')
plot(wl,OBSmean)
legend('0115','0179','0307','1133','1165'...
    ,'1293','1325','1341','2216','Location','EastOutside');
tit = sprintf('PIF Mean Reflectance, %i scenes',nscenes)
title(tit,'fontsize',fs)
xlabel('wavelength [um]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
axis([0.450 2.500 0 0.2])

hold on
% 427 478 546 608 659 724 831 908x
m = get(gca,'ylim');
lw = 1.0;
line([0.485 0.485],m,'Color','b','LineWidth',lw)
line([0.56 0.56],m,'Color','g','LineWidth',lw)
line([0.66 0.66],m,'Color','r','LineWidth',lw)
line([0.83 0.83],m,'Color','k','LineWidth',lw)
line([1.65 1.65],m,'Color','k','LineWidth',lw)
line([2.22 2.22],m,'Color','k','LineWidth',lw)
%% R vs zenith angle
disp('----------------------------------------')
disp('Band n: p(1)      p(2))    r-sq     rmse')
elev = [
53.0585481;
60.8539184;
28.9114026;
58.4972934;
61.7975978;
33.1355268;
23.9517443;
21.0272145;
55.3237096];

zenith = 90-elev';

[m1,y01] = refvszenith(1,OBSmean,zenith);
[m2,y02] = refvszenith(2,OBSmean,zenith);
[m3,y03] = refvszenith(3,OBSmean,zenith);
[m4,y04] = refvszenith(4,OBSmean,zenith);
[m5,y05] = refvszenith(5,OBSmean,zenith);
[m6,y06] = refvszenith(6,OBSmean,zenith);

X = [min(zenith) max(zenith)];
Y = [min(zenith)*m1+y01 max(zenith)*m1+y01;
    min(zenith)*m2+y02 max(zenith)*m2+y02;
    min(zenith)*m3+y03 max(zenith)*m3+y03;
    min(zenith)*m4+y04 max(zenith)*m4+y04;
    min(zenith)*m5+y05 max(zenith)*m5+y05;
    min(zenith)*m6+y06 max(zenith)*m6+y06];




%% Plot different curves

figure
fs = 15;
set(gcf,'color','white')
plot(X,Y')
hold on
% ylim([0 1])

title('Different fit curves','fontsize',fs)
xlabel('zenith [\circ]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
legend('band 1','band 2','band 3','band 4','band 5'...
    ,'band 6');

%% Correct zenith angle
sat_angle = 45;
Y = [sat_angle*m1+y01;
     sat_angle*m2+y02;
     sat_angle*m3+y03;
     sat_angle*m4+y04;
     sat_angle*m5+y05;
     sat_angle*m6+y06];
 
figure 
fs = 15;
set(gcf,'color','white')
plot(wl,OBSmean)
hold on
plot(wl,Y,'*-r','linewidth',1.5)
legend('0115','0179','0307','1133','1165'...
    ,'1293','1325','1341','2216','45\circ','Location','EastOutside');
tit = sprintf('PIF Mean Reflectance, %i scenes',nscenes);
title(tit,'fontsize',fs)
xlabel('wavelength [\mum]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
axis([0.450 2.500 0 0.2])

hold on
% 427 478 546 608 659 724 831 908
m = get(gca,'ylim');
lw = 1.0;
line([0.485 0.485],m,'Color','b','LineWidth',lw)
line([0.56 0.56],m,'Color','g','LineWidth',lw)
line([0.66 0.66],m,'Color','r','LineWidth',lw)
line([0.83 0.83],m,'Color','k','LineWidth',lw)
line([1.65 1.65],m,'Color','k','LineWidth',lw)
line([2.22 2.22],m,'Color','k','LineWidth',lw)
%% 
% figure 
% fs = 15;
% set(gcf,'color','white')
% plot(1:6,OBSmean./(max(OBSmean,[],2)*ones(1,9)))
% legend('0115','0179','0307','1133','1165'...
%     ,'1293','1325','1341','2216','Location','EastOutside');
% title('Normalization for the max of each band','fontsize',fs)
% xlabel('band','fontsize',fs)
% ylabel('reflectance','fontsize',fs)
% set(gca,'fontsize',fs)
% % axis([300 1000 0 0.45])

%% 

maximum = 5;
figure 
fs = 15;
set(gcf,'color','white')
plot(1:6,OBSmean./(OBSmean(:,maximum)*ones(1,9)))
legend('0115','0179','0307','1133','1165'...
    ,'1293','1325','1341','2216','Location','EastOutside' );
title('Normalization for the max curve (1165)','fontsize',fs)
xlabel('band','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
% axis([300 1000 0 0.45])

%%

day = [115,179,307,133,165,293,325,341,216];

figure
plot(day,OBSmean(3,:),'.')
%%
band = 1;

A = OBSmean(band,1)*zenith(1)/OBSmean(band,2)/zenith(2)


A*zenith(2)*OBSmean(band,2)/zenith(1)
OBSmean(band,1)
%%
disp('---------------------')
x = 6;
A*zenith(2)*OBSmean(band,2)/zenith(x)
OBSmean(band,x)

%% zenith equal to zero
r = [0.128742 0.153118 0.168112 0.225136 0.222973 0.212046];

figure 
fs = 15;
set(gcf,'color','white')
plot(wl,r,'linewidth',1.2)
% legend('0115','0179','0307','1133','1165'...
%     ,'1293','1325','1341','2216','Location','EastOutside');
title('PIF Mean Reflectance with   \sigma_s = 0[\circ]','fontsize',fs)
xlabel('wavelength [um]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
% axis([0.450 2.500 0 0.2])

hold on
% 427 478 546 608 659 724 831 908
m = get(gca,'ylim');
lw = 1.0;
line([0.485 0.485],m,'Color','b','LineWidth',lw)
line([0.56 0.56],m,'Color','g','LineWidth',lw)
line([0.66 0.66],m,'Color','r','LineWidth',lw)
line([0.83 0.83],m,'Color','k','LineWidth',lw)
line([1.65 1.65],m,'Color','k','LineWidth',lw)
line([2.22 2.22],m,'Color','k','LineWidth',lw)


plot(wl,OBSmean)
%%
figure 
fs = 15;
set(gcf,'color','white')
plot(1:6,r)