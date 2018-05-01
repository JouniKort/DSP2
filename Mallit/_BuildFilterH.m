M = 226;
ind = 1;
for i = 1:M
    pos = get_param('Filter/LowpassH/ResonatorTemplate','position');
    if Lowpass_h(i) ~= 0
        add_block('Filter/LowpassH/ResonatorTemplate',strcat('Filter/LowpassH/Resonator',num2str(ind)))
        set_param(strcat('Filter/LowpassH/Resonator',num2str(ind)),'position',[pos(1),pos(2)+60*(ind),pos(3),pos(4)+60*(ind)])
        set_param(strcat('Filter/LowpassH/Resonator',num2str(ind),'/GainH'),'Gain',num2str(Lowpass_h(i)));
        set_param(strcat('Filter/LowpassH/Resonator',num2str(ind),'/Gain'),'Gain',num2str(exp(2*1i*pi*i/M)));
        add_line('Filter/LowpassH','Sum2/1',strcat('Resonator',num2str(ind),'/1'));
        add_line('Filter/LowpassH',strcat('Resonator',num2str(ind),'/1'),strcat('Sum/',num2str(ind)));
        ind = ind + 1;
    end
end

M = 226;
ind = 1;
for i = 1:M
    pos = get_param('Filter/LowpassH/ResonatorTemplate','position');
    if Bandpass_h(i) ~= 0
        add_block('Filter/BandpassH/ResonatorTemplate',strcat('Filter/BandpassH/Resonator',num2str(ind)))
        set_param(strcat('Filter/BandpassH/Resonator',num2str(ind)),'position',[pos(1),pos(2)+60*ind,pos(3),pos(4)+60*ind])
        set_param(strcat('Filter/BandpassH/Resonator',num2str(ind),'/GainH'),'Gain',num2str(Bandpass_h(i)));
        set_param(strcat('Filter/BandpassH/Resonator',num2str(ind),'/Gain'),'Gain',num2str(exp(2*1i*pi*i/M)));
        add_line('Filter/BandpassH','Sum2/1',strcat('Resonator',num2str(ind),'/1'));
        add_line('Filter/BandpassH',strcat('Resonator',num2str(ind),'/1'),strcat('Sum/',num2str(ind)));
        ind = ind + 1;
    end
end

M = 226;
ind = 1;
for i = 1:M
    pos = get_param('Filter/HighpassH/ResonatorTemplate','position');
    if Highpass_h(i) ~= 0
        add_block('Filter/HighpassH/ResonatorTemplate',strcat('Filter/HighpassH/Resonator',num2str(ind)))
        set_param(strcat('Filter/HighpassH/Resonator',num2str(ind)),'position',[pos(1),pos(2)+60*ind,pos(3),pos(4)+60*ind])
        set_param(strcat('Filter/HighpassH/Resonator',num2str(ind),'/GainH'),'Gain',num2str(Highpass_h(i)));
        set_param(strcat('Filter/HighpassH/Resonator',num2str(ind),'/Gain'),'Gain',num2str(exp(2*1i*pi*i/M)));
        add_line('Filter/HighpassH','Sum2/1',strcat('Resonator',num2str(ind),'/1'));
        add_line('Filter/HighpassH',strcat('Resonator',num2str(ind),'/1'),strcat('Sum/',num2str(ind)));
        ind = ind + 1;
    end
end