close all
clear all
d=2 % dipole spacing
n=101 % number of points of interpolation

%% Get data
DELIMITER = ' ';
HEADERLINES = 23; % 24 is wrong and 23 is correct. But if it does not work for 23 just use 24. You can check whether the is no space between the numbers in the ddfield.E file.
field=importdata('ddfield.E',DELIMITER, HEADERLINES);
data=field.data;
x=data(:,1)
y=data(:,2)
e=sqrt((abs(complex(data(:,4),data(:,5)))).^2+(abs(complex(data(:,6),data(:,7)))).^2+(abs(complex(data(:,8),data(:,9)))).^2)
xr=reshape(x,n,n)
xy=reshape(y,n,n)
xe=reshape(e,n,n)
pcolor(xr*d,xy*d,xe)
shading interp
xlabel('x')
ylabel('y')
axis square
print(gcf, '-dpng','-r300', 'efield.png');