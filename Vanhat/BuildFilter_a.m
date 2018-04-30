M = 64;
for i = 1:M/2
    set_param(strcat('Filter2017a/Lowpass/GainA',num2str(i)),'Gain',num2str(A_l(i)));
    set_param(strcat('Filter2017a/Lowpass/GainB',num2str(i)),'Gain',num2str(B_l(i)));
    if i <= M/2
        if i == 1
            set_param('Filter2017a/Lowpass/Gain','Gain',num2str(2*cos(2*pi*i/M)));
        else
            set_param(strcat('Filter2017a/Lowpass/Gain',num2str((i-1)*2)),'Gain',num2str(2*cos(2*pi*i/M)));
        end
    end
end

for i = 1:M/2
    set_param(strcat('Filter2017a/Bandpass/GainA',num2str(i)),'Gain',num2str(A_b(i)));
    set_param(strcat('Filter2017a/Bandpass/GainB',num2str(i)),'Gain',num2str(B_b(i)));
    if i <= M/2
        if i == 1
            set_param('Filter2017a/Bandpass/Gain','Gain',num2str(2*cos(2*pi*i/M)));
        else
            set_param(strcat('Filter2017a/Bandpass/Gain',num2str((i-1)*2)),'Gain',num2str(2*cos(2*pi*i/M)));
        end
    end
end

for i = 1:M/2
    set_param(strcat('Filter2017a/Highpass/GainA',num2str(i)),'Gain',num2str(A_h(i)));
    set_param(strcat('Filter2017a/Highpass/GainB',num2str(i)),'Gain',num2str(B_h(i)));
    if i <= M/2
        if i == 1
            set_param('Filter2017a/Highpass/Gain','Gain',num2str(2*cos(2*pi*i/M)));
        else
            set_param(strcat('Filter2017a/Highpass/Gain',num2str((i-1)*2)),'Gain',num2str(2*cos(2*pi*i/M)));
        end
    end
end