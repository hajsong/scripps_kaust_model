clear all;

% update GSW LWUPB/LWDNB LH HFX
resultsFile = 'wrfout_d01_2012-06-01_00:00:00';
iniFile = 'wrfinput_d01';
results_swupb = ncread(resultsFile,'SWUPB');
results_swdnb = ncread(resultsFile,'SWDNB');
results_lwupb = ncread(resultsFile,'LWUPB');
results_lwdnb = ncread(resultsFile,'LWDNB');
results_lh    = ncread(resultsFile,'LH');
results_hfx   = ncread(resultsFile,'HFX');

ini_swupb = ncread(iniFile,'SWUPB');
ini_swdnb = ncread(iniFile,'SWDNB');
ini_lwupb = ncread(iniFile,'LWUPB');
ini_lwdnb = ncread(iniFile,'LWDNB');
ini_lh    = ncread(iniFile,'LH');
ini_hfx   = ncread(iniFile,'HFX');

[nx,ny,nt] = size(results_lh)

for i = 1:nx
  for j = 1:ny
    ini_swupb(i,j,1) = results_swupb(i,j,2);
    ini_swdnb(i,j,1) = results_swdnb(i,j,2);
    ini_lwupb(i,j,1) = results_lwupb(i,j,2);
    ini_lwdnb(i,j,1) = results_lwdnb(i,j,2);
    ini_lh(i,j,1)    = results_lh(i,j,2);
    ini_hfx(i,j,1)   = results_hfx(i,j,2);
  end
end

ncwrite(iniFile,'SWUPB',ini_swupb);
ncwrite(iniFile,'SWDNB',ini_swdnb);
ncwrite(iniFile,'LWUPB',ini_lwupb);
ncwrite(iniFile,'LWDNB',ini_lwdnb);
ncwrite(iniFile,'LH'   ,ini_lh);
ncwrite(iniFile,'HFX'  ,ini_hfx);
