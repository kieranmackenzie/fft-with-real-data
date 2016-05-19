A = xlsread('C2_trace_withmore.xlsx'); %import the data

% seperate the data
time = A(:,1);
amp = A(:,2);
%plot the sine wave form
figure
plot(time,amp)

%get the sampling frequency
samplesize = time(2) - time(1);
sampletime = samplesize*(size(time));

%fundamental frequency
fundF = 60; 
T = 1/fundF;

%sampling rate
Fs = (1/samplesize); 
sampT = 1/Fs %sampling period
L = length(amp);
sampleTime = L*Fs;

%% Plot the fast fourier transform

%the fft transform divided by length of signal to normalize
newAmp = fft(amp/L);

%matlab gives us a two sided specturm
%get rid of imaginary parts
P2 = abs(newAmp); 
P2(1:L/2 + 1);

%create the single sided spectrum P1
P1 = P2(1:L/2 + 1); 
P1(2:end-1) = 2*P1(2:end-1);
f = (0:(L/2));

figure
plot(f,P1); 
x = 40000;

Pcheck1 = P1(1:x);
Pcheck2 = P1(x:2*x);
Pcheck3 = P1(2*x:3*x);
Pcheck4 = P1(3*x:4*x);
Pcheck5 = P1(4*x:5*x);
Pcheck6 = P1(5*x:6*x);
Pcheck7 = P1(6*x:7*x);
Pcheck8 = P1(7*x:8*x);


first = max(Pcheck1);
second = max(Pcheck2);
third = max(Pcheck3);
fourth = max(Pcheck4);
five = max(Pcheck5);
six = max(Pcheck6);
seven = max(Pcheck7);
eight = max(Pcheck8);

check = [first second third fourth five six seven eight];
fundamental = max(check);

if (first == fundamental)
 totalHarmonicDistortion = (((second^2+third^2+fourth^2+five^2+six^2+seven^2+eight^2)^0.5)/fundamental)*100
elseif (second == fundamental)
    totalHarmonicDistortion = (((third^2+fourth^2+five^2+six^2+seven^2+eight^2)^0.5)/fundamental)*100
elseif (third == fundamental)
    totalHarmonicDistortion = (((fourth^2+five^2+six^2+seven^2+eight^2)^0.5)/fundamental)*100
elseif (fourth == fundamental)
    totalHarmonicDistortion = (((five^2+six^2+seven^2+eight^2)^0.5)/fundamental)*100
elseif (five == fundamental)
    totalHarmonicDistortion = (((six^2+seven^2+eight^2)^0.5)/fundamental)*100
elseif (six == fundamental)
    totalHarmonicDistortion = (((seven^2+eight^2)^0.5)/fundamental)*100
elseif (seven == fundamental)
    totalHarmonicDistortion = (((eight^2)^0.5)/fundamental)*100
end
    
    















% 
% % random stuff
% freq1 = 1/(0.1);
% freq2 = Fs*100;
% freq = linspace(freq1,freq2,500002);
% freq = transpose(freq);
% size(newAmp);
% size(freq);
% freq(60000:500002) = [];
% newAmp(60000:500002) = [];
% figure
% plot(freq, abs(newAmp))
% newAmp = abs(newAmp);
% 
% Pcheck1 = newAmp(1:50);
% Pcheck2 = newAmp(51:80);
% Pcheck3 = newAmp(90:130);
% Pcheck4 = newAmp(120:230);
% Pcheck5 = newAmp(230:320);
% Pcheck6 = newAmp(320:520);
% Pcheck7 = newAmp(520:1000);
% 
% first = max(Pcheck1);
% second = max(Pcheck2);
% third = max(Pcheck3);
% fourth = max(Pcheck4);
% fifth = max(Pcheck5);
% sixth = max(Pcheck6);
% seven = max(Pcheck7);
% 
% check = [first second third fourth fifth sixth seven];
% fundamental = max(check)
% 
% if (first == fundamental)
%  totalHarmonicDistortion = (((second^2+third^2+fourth^2+fifth^2+sixth^2+seven^2)^0.5)/fundamental)*100
% elseif (second == fundamental)
%     totalHarmonicDistortion = (((first^2+third^2+fourth^2+fifth^2+sixth^2+seven^2)^0.5)/fundamental)*100
% elseif (third == fundamental)
%     totalHarmonicDistortion = (((second^2+first^2+fourth^2+fifth^2+sixth^2+seven^2)^0.5)/fundamental)*100
% elseif (fourth == fundamental)
%     totalHarmonicDistortion = (((second^2+third^2+first^2+fifth^2+sixth^2+seven^2)^0.5)/fundamental)*100
% elseif (fifth == fundamental)
%     totalHarmonicDistortion = (((second^2+third^2+fourth^2+first^2+sixth^2+seven^2)^0.5)/fundamental)*100
% elseif (sixth == fundamental)
%     totalHarmonicDistortion = (((second^2+third^2+fourth^2+fifth^2+first^2+seven^2)^0.5)/fundamental)*100
% elseif (seven == fundamental)
%     totalHarmonicDistortion = (((second^2+third^2+fourth^2+fifth^2+sixth^2+first^2)^0.5)/fundamental)*100
% end
%     
