%% CALCOLO CAMPO FLUIDODINAMICO

N=size(u_component);
N=N(1,1)-1;             %numero di frames - senza media
D=6e-3;                 %Diametro m

NSIZE=size(u_component{1}); 
Nx=NSIZE(2);          %pixels x
Ny=NSIZE(1);          %pixels y
n=round(Ny/2);        %pixel medio y

u_mean=u_component{N+1}; %vel media orizzontale
v_mean=v_component{N+1}; %vel media verticale


x1=x{1,1};
y1=y{1,1};

x2=x1(1,:);
y2=y1(:,1);

figure(1)
plot(x2/D,flip(abs(u_mean(n,:))/abs(u_mean(n,end))));
xlabel('x/D')
ylabel('u/U')
Legend=cell(8,1);
figure(2)
for i=1:7;
    plot(y2-y2(n),u_mean(:,5+(i)*10));
    hold on
    grid on
    xlabel('y (mm) ')
    ylabel('u (m/s)')
    Legend{i}=strcat('x/D=', num2str(i-1));
end
figure(3)
for i=1:4:5;
    plot(y2-y2(n),v_mean(:,5+(i-1)*10));
    hold on
    grid on
    xlabel('y (mm) ')
    ylabel('v (m/s)')
    Legend{i}=strcat('x/D=', num2str(i-1));
end



%%
%Calcolo Statistica u , v |U|.
%Inizializzazione:

K_u=zeros(Ny,Nx);      % kurtosis della componente u
Skw_u=zeros(Ny,Nx);    % skewness della componente u
Std_u=zeros(Ny,Nx);    % standard deviation componente u
I_u=zeros(Ny,Nx);      % intensità di turbolenza della componente u


K_v=zeros(Ny,Nx);      % kurtosis della componente v
Skw_v=zeros(Ny,Nx);    % skewness della componente v
Std_v=zeros(Ny,Nx);    % standard deviation componente v
I_v=zeros(Ny,Nx);      % intensità di turbolenza della componente v
E_v=0;

K=zeros(Ny,Nx);        % kurtosis del modulo |U|
Skw=zeros(Ny,Nx);      % skewness del modulo |U|
Std1=zeros(Ny,Nx);
Std=zeros(Ny,Nx);      % standard deviation del modulo |U|
I=zeros(Ny,Nx);        % intensità di turbolenza del modulo |U|
E_u=0;


for i=1:Ny;
    for j=1:Nx;
        for k=1:N;
            V(k)=v_component{k,1}(i,j);
            U(k)=u_component{k,1}(i,j);
            V1(k)=v_component{k,1}(i,j)-u_mean(i,j);
            U1(k)=u_component{k,1}(i,j)-v_mean(i,j);
            E_v=E_v+V1(k)^2;
            E_u=E_u+U1(k)^2;
        end
I_v=E_v/N;
I_u=E_u/N;

E_v=0;
E_u=0;
        
Std_u(i,j)=std(U);
Std_v(i,j)=std(V);
Std(i,j)=std(sqrt(V.^2+U.^2));


I(i,j)=sqrt(I_v+I_u)/sqrt((u_mean(i,j))^2+(v_mean(i,j))^2);



        end
end

for i=1:Ny;
    for j=1:Nx;
        for k=1:N;
            if abs(v_component{k,1}(i,j)-v_mean(i,j))< 3*Std_v(i,j);
            V(k)=v_component{k,1}(i,j);
            else
            V(k)=NaN;
            end
            if abs(u_component{k,1}(i,j)-u_mean(i,j))<3*Std_u(i,j);
            U(k)=u_component{k,1}(i,j);
            else
            U(k)=NaN;
            end
        end
K_u(i,j)=kurtosis(U);
Skw_u(i,j)= skewness(-U);


K_v(i,j)=kurtosis(V);
Skw_v(i,j)= skewness(V);


K(i,j)=kurtosis(sqrt(V.^2+U.^2));
Skw(i,j)= skewness(sqrt(V.^2+U.^2));



        end
end


  
%% Filtraggio Skewness e Kurtosis

for i=1:Ny
    for j=1:Nx
if Skw_u(i,j)>10
    Skw_u(i,j)=10;
end
if Skw_u(i,j)<-10
    Skw_u(i,j)=-10;
end
    end
end

for i=1:Ny
    for j=1:Nx
if Skw_v(i,j)>3
    Skw_v(i,j)=3;
end
if Skw_v(i,j)<-3
    Skw_v(i,j)=-3;
end
    end
end

for i=1:Ny
    for j=1:Nx
if Skw(i,j)>3
    Skw(i,j)=3;
end
if Skw(i,j)<-3;
    Skw(i,j)=-3;
end
    end
end


for i=1:Ny
    for j=1:Nx
if K_u(i,j)>10
    K_u(i,j)=10;
end
if K_u(i,j)<-10
    K_u(i,j)=-10;
end
    end
end

for i=1:Ny
    for j=1:Nx
if K_v(i,j)>10
    K_v(i,j)=10;
end
if K_v(i,j)<-10
    K_v(i,j)=-10;
end
    end
end

for i=1:Ny
    for j=1:Nx
if K(i,j)>10
    K(i,j)=10;
end
if K(i,j)<-10
    K(i,j)=-10;
end
    end
end

for i=1:Ny
    for j=1:Nx
if I(i,j)>1
    I(i,j)=1;
end
    end
end
%% PLOT DEVIAZIONI STANDARD

figure(4)

contourf(Std_u,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
xlabel('x/D')
ylabel('y/D')
title('STD, velocità - componente orizzontale, [m/s]')
colorbar('southoutside')
[cmin,cmax] = caxis;
caxis([0,cmax])
% c = colorbar;
% c.Label.String = 'Elevation (ft in 1000s)';

figure(5)
title('STD, velocità - componente verticale, [m/s]')
contourf(Std_v,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
title('STD, velocità - componente verticale,[m/s]')
xlabel('x/D')
ylabel('y/D')
colorbar('southoutside')
caxis([0,cmax])
% c = colorbar;
% c.Label.String = 'Elevation (ft in 1000s)';


% Andamento standard deviation (u,v) nella centerline al variare di x
figure(6)
contourf(Std,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
xlabel('x/D')
ylabel('y/D')
title('STD, velocità - modulo, [m/s]')
colorbar('southoutside')
[cmin,cmax] = caxis;
caxis([0,cmax])




%% PLOT SKEWNESS

cmin1=min(min(Skw_u));
cmin2=min(min(Skw_v));
cmin=min([cmin1,cmin2]);

cmax1=max(max(Skw_u));
cmax2=max(max(Skw_v));
cmax=max([cmax1,cmax2]);

figure(7)

contourf(Skw_u,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
xlabel('x/D')
ylabel('y/D')
title('SKEWNESS, velocità - componente orizzontale, [1]')
colorbar('southoutside')
% [cmin,cmax] = caxis;
% caxis([cmin,cmax])
% c = colorbar;
% c.Label.String = 'Elevation (ft in 1000s)';

figure(8)

contourf(Skw_v,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
title('SKEWNESS, velocità - componente verticale, [1]')
xlabel('x/D')
ylabel('y/D')
colorbar('southoutside')
% caxis([cmin,cmax])
% c = colorbar;
% c.Label.String = 'Elevation (ft in 1000s)';

% Andamento skewness (u,v) nella centerline al variare di x

figure(9)



contourf(Skw,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
xlabel('x/D')
ylabel('y/D')
title('SKEWNESS, velocità - modulo, [1]')
colorbar('southoutside')




%% PLOT KURTOSIS

cmin1=min(min(K_u));
cmin2=min(min(K_v));
cmin=min([cmin1,cmin2]);

cmax1=max(max(K_u));
cmax2=max(max(K_v));
cmax=max([cmax1,cmax2]);

figure(10)

contourf(K_u,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
xlabel('x/D')
ylabel('y/D')
title('KURTOSIS, velocità - componente orizzontale, [1]')
colorbar('southoutside')
% [cmin,cmax] = caxis;
caxis([cmin,cmax])
% c = colorbar;
% c.Label.String = 'Elevation (ft in 1000s)';

figure(11)

contourf(K_v,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
title('KURTOSIS, velocità - componente verticale, [1]')
xlabel('x/D')
ylabel('y/D')
colorbar('southoutside')
caxis([cmin,cmax])
% c = colorbar;
% c.Label.String = 'Elevation (ft in 1000s)';


figure(12)


contourf(K,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
xlabel('x/D')
ylabel('y/D')
title('KURTOSIS, velocità - modulo, [1]')
colorbar('southoutside')
% [cmin,cmax] = caxis;
caxis([cmin,cmax])
%% PLOT Intensità di turbolenza

figure(13)

contourf(I,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
xlabel('x/D')
ylabel('y/D')
title('Intensità di turbolenza')
colorbar('southoutside')
[cmin,cmax] = caxis;
caxis([0,cmax])
% c = colorbar;
% c.Label.String = 'Elevation (ft in 1000s)';

% Andamento intensità di turbolenza nella centerline al variare di x

figure(14)
for i=1:3;
plot(x2/D, flip(I(n+(i-1)*3,:)))
hold on
title('I_{CL} intensità di turbolenza')
xlabel('x/D')
ylabel('I')
end
grid on
%% CALCOLO INVARIANTI PER DIFFERENZE FINITE

%du/dx
for i=1:N
u_x{i,1}=zeros(Ny,Nx);
for j=2:(Ny-1)
for k=2:(Nx-1)
u_x{i,1}(j,k)=(u_component{i}(j+1,k)-u_component{i}(j-1,k))/(2);
end
end
end

%dv/dx
for i=1:N
v_x{i,1}=zeros(Ny,Nx);
for j=2:(Ny-1)
for k=2:(Nx-1)
v_x{i,1}(j,k)=(v_component{i}(j+1,k)-v_component{i}(j-1,k))/(2);
end
end
end

%du/dy
for i=1:N
u_y{i,1}=zeros(Ny,Nx);
for j=2:(Ny-1)
for k=2:(Nx-1)
u_y{i,1}(j,k)=(u_component{i}(j,k+1)-u_component{i}(j,k-1))/(2);
end
end
end

%dv/dy
for i=1:N
v_y{i,1}=zeros(Ny,Nx);
for j=2:(Ny-1)
for k=2:(Nx-1)
v_y{i,1}(j,k)=(v_component{i}(j,k+1)-v_component{i}(j,k-1))/(2);
end
end
end


%% Calcolo invarianti e funzione DELTA

for i=1:N
    DIV{i,1}=u_x{i}+v_y{i};
    ROT{i,1}=u_x{i}.*v_y{i}-u_y{i}.*v_x{i};
    DELTA{i,1}=(DIV{i}).^2-4*(ROT{i});
end

%% calcolo media DELTA

DELTA_MEAN=zeros(Ny,Nx);
for i=1:N
    DELTA_MEAN=DELTA_MEAN+DELTA{i};
end
DELTA_MEAN=DELTA_MEAN/N;

%%

figure(15)

contourf(DELTA_MEAN,15,'LineWidth',0,'linecolor','w')

set(gca,'XTick',x2/D,'xticklabel',{linspace(1,8,8)})
set(gca,'YTick',y2/D,'yticklabel',{'-3.5',' ','-3',' ','-2.5',' ','-2',' ',...
    '-1.5',' ','-1',' ','-0.5',' ','0',' ','0.5',' ','1',' ','1.5',' ','2',' '})
xlabel('x/D')
ylabel('y/D')
title('DELTA, MEDIA - [m^2/s^2]')
colorbar('southoutside')
% [cmin,cmax] = caxis;
% caxis([cmin,cmax])
% c = colorbar;
% c.Label.String = 'Elevation (ft in 1000s)';
%% componentI DEL TENSORE DI REYNOLDS <u'u'>  <u'v'>  <v'v'>


T_R11=zeros(Ny,Nx); % <u'u'>
T_R12=zeros(Ny,Nx); % <u'v'>
T_R22=zeros(Ny,Nx); % <v'v'>


for i=1:N;
    u_f{i}=u_component{i,1}-u_mean;
    v_f{i}=v_component{i,1}-v_mean;
    u_mod_f{i}=sqrt(u_f{i}.^2+v_f{i}.^2);
    U_mod{i}=sqrt(u_component{i,1}.^2+v_component{i,1}.^2);
    T_R11_i{i}=u_f{i}.*u_f{i};
    T_R12_i{i}=u_f{i}.*v_f{i};
    T_R22_i{i}=v_f{i}.*v_f{i};
end

for j=1:N;
    T_R11=T_R11+T_R11_i{j};
    T_R12=T_R12+T_R12_i{j};
    T_R22=T_R22+T_R22_i{j};
end

T_R11=T_R11/N;
T_R12=T_R12/N;
T_R22=T_R22/N;

%Andamento delle componenti del Tensore di Reynolds nella centerline al
%variare di x

figure(16)
plot(x2/D, -1.22*flip(T_R11(n,:)),'b')
hold on
plot(x2/D, -1.22*flip(T_R12(n,:)),'r')
hold on
plot(x2/D, -1.22*flip(T_R22(n,:)),'g')
grid on
xlabel('x/D')
ylabel('T_{R}')

legend('T_{R_{11}}=-\rho <u''u''>','T_{R_{12}}=-\rho<u''v''>','T_{R_{22}}-\rho<v''v''>')

figure(17)
plot(-1.22*flip(T_R11(:,20)),y2/D,'b')
hold on
plot(-1.22*flip(T_R12(:,20)),y2/D,'r')
hold on
plot(-1.22*flip(T_R22(:,20)),y2/D,'g')
grid on
ylabel('y/D')
xlabel('T_{R}')

legend('T_{R_{11}}=-\rho <u''u''>','T_{R_{12}}=-\rho<u''v''>','T_{R_{22}}-\rho<v''v''>')

%% DENSITA' SPETTRALE DI POTENZA E IN FUNZIONE DEL NUMERO D'ONDA K


E=zeros(3000000,1); index_x=zeros(3000000,1); E11_sum=zeros();
Lx=abs(x2(1)-x2(2));
k1=2.*pi.*((1:1:Nx)-(Nx/2))./Lx;
k2=2.*pi.*((1:1:Ny)-(Ny/2))./Lx; 
for k=1:N;
    u_fft=fftshift(fft2(u_mod_f{k}));
    u_fft1=abs(u_fft).^2;
    for i=1:Ny
        for j=1:Nx
            wavenumber=round(sqrt((k1(j)^2+k2(i)^2)));
            if wavenumber==0
               wavenumber=wavenumber+1;
               E(wavenumber)=E(wavenumber)+u_fft1(i,j);
               index_x(wavenumber)=wavenumber; 
            else
            E(wavenumber)=E(wavenumber)+u_fft1(i,j);
            index_x(wavenumber)=wavenumber;
            end
        end
    end
    E11_sum=E11_sum+E;
end
E=E11_sum;
E = E/N;
index_longitudinal=find(E~=0);
E11=E(index_longitudinal);
k_l=index_x(index_longitudinal);


figure(18);
loglog(k_l,E11);
hold on
loglog(k_l,10^(20)*k_l.^(-5/3),'r');
grid on
xlabel('k [m^{-1}]');
ylabel('E [m^{3}/s^{2}]');
title('Spettro di energia');