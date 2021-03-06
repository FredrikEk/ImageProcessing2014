%% Homework
clear
clf

time = 1:256;
signal = cos(2*pi*(2/256)*time)+randn(1,256);
plot(signal)

%%
dwtmode('per')
[C,L]=wavedec(signal,8,'rbio6.8');
figure, plot(C)

%%
figure, subplot(3,3,1), plot(signal)
for level=1:8
    C(256/2^level+1:256)=0;
    smoothed_signal = waverec(C,L,'rbio6.8');
    subplot(3,3,(level+1)), plot(smoothed_signal)
end