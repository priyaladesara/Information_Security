%monoalphabatic cipher
clc;
close all;
clear all;
promt='enter your message';
p1=input(prompt,'s');
A=1:1:26;
disp(A);
B=randperm(length(A));
disp(B);
K=mod(B-A,26);
disp(K);
for i= 1:length(p1)
    p=p1(i);
    if(double(p)>=65 && double(p)<=90)
        t1=mod(double(p)-65+K(double(p)-65+1),26);
        t2=char(t1+65);
        c(i)=t2;
    elseif(double(p)>=97 && double(p)<=122)
        t1=mod(double(p)-97+K(double(p)-97+1),26);
        t2=char(t1+97);
        c(i)=t2;
    else
        c(i)=p1(i);
    end
end
disp('encrypted text: ');
disp(c);
[A1,B1]=sort(B,'ascend');
K1=mod(A1-B1,26);
for i=1:length(c)
    c1=c(i);
    if(double(c1)>=65 && double(c1)<=90)
        t1=mod(double(c1)-65-K1(double(c1)-65+1),26);
        t2=char(t1+65);
        c2(i)=t2;
    elseif(double(c1)>=97 && double(c1)<=122)
        t1=mod(double(c1)-97-K1(double(c1)-65+1),26);
        t2=char(t1+97);
        c2(i)=t2;
    else
        c2(i)=c(i);
    end
end
disp('decrypted text:');
disp(c2);

    


     


