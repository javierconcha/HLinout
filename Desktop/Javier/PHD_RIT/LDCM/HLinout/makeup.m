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

%% Determination of dpf for ONTNS

% rr = load('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/RvectorONTNSdpfdet.txt');
rr = load('/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/RvectorONTNSdpfdetFINAL.txt');
nruns = size(rr,1)/size(wavelength,1);
RrsONTNS = reshape(rr(:,1),size(wavelength,1),nruns);
RrsONTNS = RrsONTNS*pi;

ONTNSRefinterp = interp1(wavelengthSVC*1000,ONTNSRef,wavelength);
ONTNSRefinterp(wavelength>=897.5) = ONTNSRefinterp(wavelength==897.5);
ONTNSRefinterp = ONTNSRefinterp-ONTNSRefinterp(wavelength==897.5);

figure
fs = 15;
set(gcf,'color','white')
plot(wavelength,RrsONTNS)
hold on
plot(wavelength,ONTNSRefinterp,'.-r')
title('Rrs for ONTNS','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
grid on
xlim([400 2200])
% ylim([0 .3])

% [Y,I] = min(sqrt(sum((RrsONTNS-ONTNSRefinterp*ones(1,nruns)).^2)));
[Y,I] = min(sqrt(sum((RrsONTNS(wavelength>=500,:)-ONTNSRefinterp(wavelength>=500)*ones(1,nruns)).^2)));

filename = 'input_listONTNSdpfdetFINAL.txt';

fid = fopen(filename);
c = textscan(fid,'%s','delimiter','\n');
fclose all;

C = textscan(c{1}{I},'%s');
disp(C{:})

figure
fs = 15;
set(gcf,'color','white')
plot(wavelength,RrsONTNS(:,I),'b')
hold on
plot(wavelength,ONTNSRefinterp,'r')
title('Rrs for ONTNS','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('reflectance','fontsize',fs)
set(gca,'fontsize',fs)
legend('Rrs from LUT','Rrs from field')
grid on

%% Chl scattering from Rolo and Aaron dissertation
filename = '/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/code/IOPold/ChloroSct.txt';

fid = fopen(filename);
c = textscan(fid,'%s','delimiter','\n');
fclose all;

for index = 11:size(c{:},1)-1
    C = textscan(c{1}{index},'%f%f');
    wl_chl_scat(index-10) = C{1};
    chl_scat(index-10) = C{2};
end

figure 
fs = 15;
set(gcf,'color','white')
plot(wl_chl_scat,chl_scat)
title('chlorophyll mass-specific scattering coefficient','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('b*, [m^2/\mug]','fontsize',fs)
set(gca,'fontsize',fs)
grid on
%% Suspended Solids scattering from Aaron dissertation
filename = '/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/code/IOPold/OopsSusMinSct.txt';

fid = fopen(filename);
c = textscan(fid,'%s','delimiter','\n');
fclose all;

for index = 11:size(c{:},1)-1
    C = textscan(c{1}{index},'%f%f');
    wl_sm_scat(index-10) = C{1};
    sm_scat(index-10) = C{2};
end

figure 
fs = 15;
set(gcf,'color','white')
plot(wl_sm_scat,sm_scat)
title('Suspended Solids mass-specific scattering coefficient','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('b*, [m^2/mg]','fontsize',fs)
set(gca,'fontsize',fs)
grid on
%% Suspended Solids scattering from HL default
filename = '/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/code/IOPold/bstarmin_average.txt';

fid = fopen(filename);
c = textscan(fid,'%s','delimiter','\n');
fclose all;

for index = 11:size(c{:},1)-1
    C = textscan(c{1}{index},'%f%f');
    wl_sm_scat2(index-10) = C{1};
    sm_scat2(index-10) = C{2};
end

figure 
fs = 15;
set(gcf,'color','white')
plot(wl_sm_scat2,sm_scat2)
title('Suspended Solids mass-specific scattering coefficient','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('b*, [m^2/mg]','fontsize',fs)
set(gca,'fontsize',fs)
grid on
%% Suspended Solids scattering from ROLO dissertation
filename = '/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/code/IOPold/susmin.sct';

fid = fopen(filename);
c = textscan(fid,'%s','delimiter','\n');
fclose all;

for index = 11:size(c{:},1)-1
    C = textscan(c{1}{index},'%f%f');
    wl_sm_scat3(index-10) = C{1};
    sm_scat3(index-10) = C{2};
end

figure 
fs = 15;
set(gcf,'color','white')
plot(wl_sm_scat3,sm_scat3)
title('mineral particle mass-specific scattering coefficient','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('b*, [m^2/mg]','fontsize',fs)
set(gca,'fontsize',fs)
grid on
%% Suspended Solids scattering from Bukata 91
filename = '/Users/javier/Desktop/Javier/PHD_RIT/LDCM/HLinout/code/IOPold/susmin_bukata91.sct';

fid = fopen(filename);
c = textscan(fid,'%s','delimiter','\n');
fclose all;

for index = 11:size(c{:},1)-1
    index
    C = textscan(c{1}{index},'%f%f');
    wl_sm_scat4(index-10) = C{1};
    sm_scat4(index-10) = C{2};
end

figure 
fs = 15;
set(gcf,'color','white')
plot(wl_sm_scat4,sm_scat4,'.-')
title('Suspended Solids mass-specific absorption coefficient','fontsize',fs)
xlabel('wavelength [nm]','fontsize',fs)
ylabel('b*, [m^2/mg]','fontsize',fs)
set(gca,'fontsize',fs)
grid on


