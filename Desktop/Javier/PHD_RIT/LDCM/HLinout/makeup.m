addpath('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout');
% script to transfrom data in ENVI format
%%

wavelength = [...
  4.02500E+02  4.07500E+02  4.12500E+02  4.17500E+02  4.22500E+02  4.27500E+02  4.32500E+02  4.37500E+02  4.42500E+02  4.47500E+02 ...
  4.52500E+02  4.57500E+02  4.62500E+02  4.67500E+02  4.72500E+02  4.77500E+02  4.82500E+02  4.87500E+02  4.92500E+02  4.97500E+02 ...
  5.02500E+02  5.07500E+02  5.12500E+02  5.17500E+02  5.22500E+02  5.27500E+02  5.32500E+02  5.37500E+02  5.42500E+02  5.47500E+02 ...
  5.52500E+02  5.57500E+02  5.62500E+02  5.67500E+02  5.72500E+02  5.77500E+02  5.82500E+02  5.87500E+02  5.92500E+02  5.97500E+02 ...
  6.02500E+02  6.07500E+02  6.12500E+02  6.17500E+02  6.22500E+02  6.27500E+02  6.32500E+02  6.37500E+02  6.42500E+02  6.47500E+02 ...
  6.52500E+02  6.57500E+02  6.62500E+02  6.67500E+02  6.72500E+02  6.77500E+02  6.82500E+02  6.87500E+02  6.92500E+02  6.97500E+02 ...
  7.02500E+02  7.07500E+02  7.12500E+02  7.17500E+02  7.22500E+02  7.27500E+02  7.32500E+02  7.37500E+02  7.42500E+02  7.47500E+02 ...
  7.52500E+02  7.57500E+02  7.62500E+02  7.67500E+02  7.72500E+02  7.77500E+02  7.82500E+02  7.87500E+02  7.92500E+02  7.97500E+02 ...
  8.02500E+02  8.07500E+02  8.12500E+02  8.17500E+02  8.22500E+02  8.27500E+02  8.32500E+02  8.37500E+02  8.42500E+02  8.47500E+02 ...
  8.52500E+02  8.57500E+02  8.62500E+02  8.67500E+02  8.72500E+02  8.77500E+02  8.82500E+02  8.87500E+02  8.92500E+02  8.97500E+02 ...
  9.02500E+02  9.07500E+02  9.12500E+02  9.17500E+02  9.22500E+02  9.27500E+02  9.32500E+02  9.37500E+02  9.42500E+02  9.47500E+02 ...
  9.52500E+02  9.57500E+02  9.62500E+02  9.67500E+02  9.72500E+02  9.77500E+02  9.82500E+02  9.87500E+02  9.92500E+02  9.97500E+02];

wavelength = wavelength';
%%
% rr = load('./Rvector130321.txt');
% rr = load('./Rvector130329.txt');
% rr = load('./Rvector130421.txt');
% rr = load('./Rvector130508.txt');
% rr = load('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/Rvector130511.txt');
rr = load('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/Rvector130919.txt');

nruns = size(rr,1)/size(wavelength,1);


Lw = reshape(rr(:,1),size(wavelength,1),nruns);
Ed = reshape(rr(:,2),size(wavelength,1),nruns);

% figure
% fs = 15;
% set(gcf,'color','white')
% plot(wavelength,Lw)
% title('Lw','fontsize',fs)
% xlabel('wavelength [nm]','fontsize',fs)
% ylabel('Radiance [W/m^2/sr/nm]','fontsize',fs)
% set(gca,'fontsize',fs)
% 
% figure
% set(gcf,'color','white')
% plot(wavelength,Ed)
% title('Downwelling Irradiances','fontsize',fs)
% xlabel('wavelength [nm]','fontsize',fs)
% ylabel('Irradiance [W/m^2/nm]','fontsize',fs)
% set(gca,'fontsize',fs)

Rrs = Lw./Ed;
reflectance = Rrs*pi;

figure
fs = 15;
set(gcf,'color','white')
plot(wavelength,reflectance)
title('Reflectance','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)

tt = [wavelength reflectance];
save('LUTjavier.txt','tt','-ascii')

%% Correct file
rr = load('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/Rvector130919_2.txt');
nruns = size(rr,1)/size(wavelength,1);
Rrs = reshape(rr(:,1),size(wavelength,1),nruns);
reflectance_2 = Rrs*pi;

figure
fs = 15;
set(gcf,'color','white')
plot(wavelength,reflectance_2)
title('Reflectance','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)

tt = [wavelength reflectance_2];
save('LUTjavier130919.txt','tt','-ascii')

LUT130919_2conc = load('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/concentration_list130919_2.txt');

%%
rr = load('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/Rvector130919_5.txt');
LUT130919_5conc = load('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/concentration130919_5.txt');


nruns = size(rr,1)/size(wavelength,1);
Rrs = reshape(rr(:,1),size(wavelength,1),nruns);
Rrs = Rrs*pi;

figure
fs = 15;
set(gcf,'color','white')
plot(wavelength,Rrs)
title('Rrs','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
xlim([400 2200])
ylim([0 .3])


tt = [wavelength Rrs];
save('LUTjavier130919_3.txt','tt','-ascii')
%% LUT restricted
CHLmin = 0.0;
CHLmax = 2.5;

SMmin = 0.0;
SMmax = 5.0;

CDOMmin = 0.0;
CDOMmax = 0.5;

Rrs_rest = Rrs(:,LUT130919_5conc(:,1)>=CHLmin & LUT130919_5conc(:,1)<=CHLmax ...
              & LUT130919_5conc(:,2)>=SMmin & LUT130919_5conc(:,2)<=SMmax ... 
              & LUT130919_5conc(:,3)>=CDOMmin & LUT130919_5conc(:,3)<=CDOMmax);
                
figure
fs = 15;
set(gcf,'color','white')
plot(wavelength,Rrs_rest)
title('Rrs restricted','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
xlim([400 2200])
ylim([0 .3])
%% applying solar zenith correction factor in CDR PIF reflectance spectra
L8bands = [0.4430,0.4826,0.5613,0.6546,0.8646,1.6090,2.2010];

CDR115 = [
0.104145;
0.121693;
0.131039;
0.156533;
0.167291;
0.155756];

figure
fs = 15;
set(gcf,'color','white')
plot(L8bands(2:end),CDR115)
% title('d','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
% xlim([400 2200])
ylim([0 .17])
