for i = 1:16
    set_param(strcat('Filter/Lowpass/GainA',num2str(i)),'Gain',num2str(A_l(i)));
    set_param(strcat('Filter/Lowpass/GainB',num2str(i)),'Gain',num2str(B_l(i)));
    if i < 16
        if i == 1
            set_param('Filter/Lowpass/Gain','Gain',num2str(2*cos(2*pi*i/32)));
        else
            set_param(strcat('Filter/Lowpass/Gain',num2str((i-1)*2)),'Gain',num2str(2*cos(2*pi*i/32)));
        end
    end
end

for i = 1:16
    set_param(strcat('Filter/Bandpass/GainA',num2str(i)),'Gain',num2str(A_b(i)));
    set_param(strcat('Filter/Bandpass/GainB',num2str(i)),'Gain',num2str(B_b(i)));
    if i < 16
        if i == 1
            set_param('Filter/Bandpass/Gain','Gain',num2str(2*cos(2*pi*i/32)));
        else
            set_param(strcat('Filter/Bandpass/Gain',num2str((i-1)*2)),'Gain',num2str(2*cos(2*pi*i/32)));
        end
    end
end

for i = 1:16
    set_param(strcat('Filter/Highpass/GainA',num2str(i)),'Gain',num2str(A_h(i)));
    set_param(strcat('Filter/Highpass/GainB',num2str(i)),'Gain',num2str(B_h(i)));
    if i < 16
        if i == 1
            set_param('Filter/Highpass/Gain','Gain',num2str(2*cos(2*pi*i/32)));
        else
            set_param(strcat('Filter/Highpass/Gain',num2str((i-1)*2)),'Gain',num2str(2*cos(2*pi*i/32)));
        end
    end
end