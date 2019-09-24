%% To find the maximum torque per rotor volume TRV %%
dmin=input('enter the minimum value of bore diameter:');
dmax=input('enter the maximum value of bore diameter:');
lmin=input('enter the minimum value of stack length:');
lmax=input('enter the maximum value of stack length:');
i=1;
for(L=lmin:1:lmax)
    for(D=dmin:1:dmax)
        vol(i)=D*D*L;
    end
    i=i+1;
end
    
plot(vol);