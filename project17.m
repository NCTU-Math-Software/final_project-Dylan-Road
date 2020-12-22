%n odd or even
%if odd then left upper
%if even then right down
%must less the 32768
function project17(n)
tic
format long
% 1
summ=n^2;
remain=n^2;
A=ones(n,n);
if n<=20 && rem(n,2)==1 %n is odd
    start=n^2;
    for jj=0:(n-3)/2
        for ii=1:n-(1+2*jj) %右上橫
            A(jj+1,n+1-ii-jj)=start;
            start=start-1;
        end
        for ii=1:n-(1+2*jj) %左上直
            A(jj+ii,jj+1)=start;
            start=start-1;
        end
        for ii=1:n-(1+2*jj) %左下橫
            A(n-jj,jj+ii)=start;
            start=start-1;
        end
        for ii=1:n-(1+2*jj) %右下直
            A(n+1-ii-jj,n-jj)=start;
            start=start-1;
        end
    end
    disp(A)
elseif n<=20 && rem(n,2)==0 %n is even
    nn=n-1;
    start=nn^2;
    for jj=0:(nn-3)/2
        for ii=1:nn-(1+2*jj)
            A(jj+1,nn+1-ii-jj)=start;
            start=start-1;
        end
        for ii=1:nn-(1+2*jj)
            A(jj+ii,jj+1)=start;
            start=start-1;
        end
        for ii=1:nn-(1+2*jj)
            A(nn-jj,jj+ii)=start;
            start=start-1;
        end
        for ii=1:nn-(1+2*jj)
            A(nn+1-ii-jj,nn-jj)=start;
            start=start-1;
        end
    end
    %先做n-1使得照抄以上奇數的做法，再多加一個L形
    for ii=1:n
        A(n,ii)=n^2-ii+1;
    end
    for ii=0:n-1
        A(n-ii,n)=n^2-n-ii+1;
    end
    disp(A)
end

% 1
%combine and from inside
stpoint=ceil(n/2);
start=1;
a(stpoint,stpoint)=start;
if n<=20
    for ii=1:n-1
        if rem(ii,2)==1
            for jj=1:ii
                a(stpoint,stpoint+jj)=start+1;
                start=start+1;
            end
            for jj=1:ii
                a(stpoint+jj,stpoint+ii)=start+1;
                start=start+1;
            end
            if rem(n,2)==0 && ii==n-1
                stpoint=n;
                for jj=1:ii
                    a(stpoint,stpoint-jj)=start+1;
                    start=start+1;
                end
            end
        else
            for jj=1:ii
                a(stpoint+ii-1,stpoint+ii-1-jj)=start+1;
                start=start+1;
            end
            for jj=1:ii
                a(stpoint+ii-1-jj,stpoint-1)=start+1;
                start=start+1;
            end
            stpoint=stpoint-1;
            if rem(n,2)==1 && ii==n-1
                for jj=1:ii
                    a(stpoint,stpoint+jj)=start+1;
                    start=start+1;
                end
            end
        end
    end
end
disp(a)
% 2
jj=0;
if rem(n,2)==1 %n is odd
    while 1
        for ii=1:4
            summ=summ+(remain-n+(1+2*jj));
            remain=remain-n+(1+2*jj);
        end
        jj=jj+1;
        if remain==1
            break
        end
    end
    disp(summ)
else %n is even
    while 1
        
        for ii=1:4
            summ=summ+(remain-n+(1+2*jj));
            remain=remain-n+(1+2*jj);
        end
        jj=jj+1;
        if remain==4
            summ=summ+6;
            break
        end
    end
    disp(summ)
end
    
% 3

%1 at (100,100)
%2 at (100,101) 先記2為質數 入矩陣內
%3 at (101,101) 也將三入矩陣內內
%5 開根除以 2

prime(1)=2;
prime(2)=3;

n=200;
B=zeros(n,n);
stpoint=ceil(n/2);
start=1;
a(stpoint,stpoint)=start;
for ii=1:n-1
    if rem(ii,2)==1
        for jj=1:ii
            a(stpoint,stpoint+jj)=start+1;
            %判斷質數開始
            if rem(start+1,2)==1
                bond=ceil(sqrt(start+1));
                long=length(prime);
                for kk=1:long
                    if prime(kk)<=bond
                        remain(kk)=rem(start+1,prime(kk));
                    else
                        break
                    end
                end
                long2=length(remain);
                summ=0;
                for tt=1:long2
                    if remain(tt)~=0
                        remain(tt)=1;
                    end
                    summ=summ+remain(tt);
                end
                if summ==long2
                    prime=[prime start+1];
                    B(stpoint,stpoint+jj)=255;
                end
            end   
            %判斷完
            start=start+1;
        end
        for jj=1:ii
            a(stpoint+jj,stpoint+ii)=start+1;
            %判斷質數開始
            if rem(start+1,2)==1 && (start+1)~=3
                bond=ceil(sqrt(start+1));
                long=length(prime);
                for kk=1:long
                    if prime(kk)<=bond
                        remain(kk)=rem(start+1,prime(kk));
                    else
                        break
                    end
                end
                long2=length(remain);
                summ=0;
                for tt=1:long2
                    if remain(tt)~=0
                        remain(tt)=1;
                    end
                    summ=summ+remain(tt);
                end
                if summ==long2
                    prime=[prime start+1];
                    B(stpoint+jj,stpoint+ii)=255;
                end
            end   
            %判斷完
            start=start+1;
        end
        if rem(n,2)==0 && ii==n-1
            stpoint=n;
            for jj=1:ii
                a(stpoint,stpoint-jj)=start+1;
                %判斷質數開始
            if rem(start+1,2)==1
                bond=ceil(sqrt(start+1));
                long=length(prime);
                for kk=1:long
                    if prime(kk)<=bond
                        remain(kk)=rem(start+1,prime(kk));
                    else
                        break
                    end
                end
                long2=length(remain);
                summ=0;
                for tt=1:long2
                    if remain(tt)~=0
                        remain(tt)=1;
                    end
                    summ=summ+remain(tt);
                end
                if summ==long2
                    prime=[prime start+1];
                    B(stpoint,stpoint-jj)=255;
                end
            end   
            %判斷完
                start=start+1;
            end
        end
    else
        for jj=1:ii %when jj=ii-1, then sqrt（start+1）=k^2
            a(stpoint+ii-1,stpoint+ii-1-jj)=start+1;
            %判斷質數開始
            if rem(start+1,2)==1
                bond=ceil(sqrt(start+1));
                long=length(prime);
                for kk=1:long
                    if prime(kk)<=bond
                        remain(kk)=rem(start+1,prime(kk));
                    else
                        break
                    end
                end
                long2=length(remain);
                summ=0;
                for tt=1:long2
                    if remain(tt)~=0
                        remain(tt)=1;
                    end
                    summ=summ+remain(tt);
                end
                if summ==long2
                    prime=[prime start+1];
                    B(stpoint+ii-1,stpoint+ii-1-jj)=255;
                end
            end   
            %判斷完
            start=start+1;
        end
        for jj=1:ii
            a(stpoint+ii-1-jj,stpoint-1)=start+1;
            %判斷質數開始
            if rem(start+1,2)==1
                bond=ceil(sqrt(start+1));
                long=length(prime);
                for kk=1:long
                    if prime(kk)<=bond
                        remain(kk)=rem(start+1,prime(kk));
                    else
                        break
                    end
                end
                long2=length(remain);
                summ=0;
                for tt=1:long2
                    if remain(tt)~=0
                        remain(tt)=1;
                    end
                    summ=summ+remain(tt);
                end
                if summ==long2
                    prime=[prime start+1];
                    B(stpoint+ii-1-jj,stpoint-1)=255;
                end
            end   
            %判斷完
            start=start+1;
        end
        stpoint=stpoint-1;
    end
end
image(B)
map=[1 1 1;0 0 0];
colormap(map)
length(prime)
toc
end