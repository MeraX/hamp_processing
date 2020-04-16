% These values have been estimated by eye using assess_radiometer_data.m
% Numbers represent indices in raw measurement data and are not yet
% converted to times

%% Errors

function [errors, sawtooth] = radiometerErrorsLookupInt

%183
errors{1,1} = {...
        '20131210',{[]};...
        '20131211',{[]};...
        '20131212',{[]};...
        '20131214',{[]};...
        '20131215',{[]};...
        '20131216',{[]};...
        '20131219',{[]};...
        '20131220',{[]};...
        '20140107',{[]};...
        '20140109',{[]};...
        '20140112',{[]};...
        '20140118',{[]};...
        '20140120',{[]};...
        '20140121',{[]};...
        '20140122',{[3062 3686], 4470};...
        '20160808',{[]};...
        '20160810',{[1 107]};...
        '20160812',{[1 15]};...
        '20160815',{[1 449]};...
        '20160817',{[1 6217]};...
        '20160819',{[1 9074],16096,[16545 16554],[18088 18091]};...
        '20160822',{[1 12797],20375};...
        '20160824',{[1 10849]};...
        '20160826',{[1 12192],[18193 18209],[19740 19749]};...
        '20160830',{[1 9548]};...
        '20160917',{[]};...
        '20160921',{[]};...
        '20160923',{[]};...
        '20160926',{[1 39]};...
        '20160927',{[1 2]};...
        '20161001',{[1 315]};...
        '20161006',{[1 741],3626};...
        '20161009',{[]};...
        '20161010',{[1 1445]};...
        '20161013',{[]};...
        '20161014',{[]};...
        '20161015',{[]};...
        '20161018',{[]};...
        '20200119', {[]};...
        '20200122', {[]};...
        '20200124', {[97936 99937], [125260 127013], [127768 129441]};...
        '20200126', {[1 358], [3516 4325], [14720 16533], [34828 34870]};...
        '20200128', {[]};...
        '20200130', {[]};...
        '20200131', {[37226 38165], [50218 50979], [60604 62715], [78996 81075], [83514 84365]};...
        '20200202', {[1 5642]};...
        '20200205', {[53434 56829]};...
        '20200207', {[1 6647], [29821 30010], [30306 30859], [31501 31988], [84913 86333], [88232 88616]};...
        '20200209', {[]};...
        '20200211', {[26145 27147], [42141 43527], [44798 45865], [64214 64407], [73630 73965], [96760 98944]};...
        '20200213', {[]};...
        '20200215', {[]};...
        '20200218', {[76618 78863]}
        };

%11990
errors{1,2} = {...
        '20131210',{4693, 11103};... %, [1 2],[17215 17216]};...
        '20131211',{7227, 16263};...
        '20131212',{[]};...
        '20131214',{1564, 17361};...
        '20131215',{[1 2]};...
        '20131216',{2944, 11701, 20465, 24855};... % , [13892 13893]
        '20131219',{8375, 15154};... % [3835 3836], , [10644 10645]
        '20131220',{13512, 15766};... % [11263 11264],
        '20140107',{1579, 9846};... % [9379 9380],
        '20140109',{4978, 9633, 18926};...
        '20140112',{820};...
        '20140118',{[]};...
        '20140120',{4697};...
        '20140121',{[]};...
        '20140122',{11806};...
        '20160808',{[]};...
        '20160810',{[]};...
        '20160812',{[]};...
        '20160815',{4355};...
        '20160817',{18700,23730};...
        '20160819',{[]};...
        '20160822',{7263};...
        '20160824',{4123};...
        '20160826',{[]};...
        '20160830',{[]};...
        '20160917',{[]};...
        '20160921',{[]};...
        '20160923',{[1 3]};...
        '20160926',{[1 34]};...
        '20160927',{[1 144]};...
        '20161001',{[1 1979]};...
        '20161006',{[1 93]};...
        '20161009',{[]};...
        '20161010',{[1 703]};...
        '20161013',{[1 678],16132};...
        '20161014',{[1 4513],6995};...
        '20161015',{[1 927],9964,14945,17438};...
        '20161018',{[]};...
        '20200119', {[]};...
        '20200122', {[124529 124538], [126453 126457]};...
        '20200124', {[]};...
        '20200126', {[]};...
        '20200128', {[]};...
        '20200130', {[]};...
        '20200131', {[]};...
        '20200202', {[]};...
        '20200205', {[]};...
        '20200207', {[]};...
        '20200209', {[]};...
        '20200211', {[]};...
        '20200213', {[]};...
        '20200215', {[]};...
        '20200218', {[]}
        };


%KV
errors{1,3} = {...
        '20131210',{5054, 6059, 7057, 8037};...
        '20131211',{693, 2761, [3773 3776], 4797};...
        '20131212',{1, 4559};... % , [7532 7533]
        '20131214',{[1 2], [718 835], [2214 2295], [2416 2424], 3713, 4798, 5874};...
        '20131215',{4122};...
        '20131216',{135, 2103};...
        '20131219',{11296};...
        '20131220',{[]};...
        '20140107',{904};...
        '20140109',{[]};...
        '20140112',{319};...
        '20140118',{[]};...
        '20140120',{[]};...
        '20140121',{[]};...
        '20140122',{1236, 7170};...
        '20160808',{9541,13912,22678};...
        '20160810',{[1668 1712],1961,4136,6302,14977};...
        '20160812',{[]};...
        '20160815',{5562,12035,14202};...
        '20160817',{2762,11429};...
        '20160819',{8900,17611};...
        '20160822',{6347,5837,12330,14483,16642};...
        '20160824',{[]};...
        '20160826',{[]};...
        '20160830',{25135,25168};...
        '20160917',{[]};...
        '20160921',{[]};...
        '20160923',{[]};...
        '20160926',{[1 110]};...
        '20160927',{[1 85]};...
        '20161001',{[1 880]};...
        '20161006',{[1 2],[2189 4625],10954};...
        '20161009',{10017};...
        '20161010',{[1 2959],5394,16311};...
        '20161013',{[1 2441]};...
        '20161014',{[1 1530]};...
        '20161015',{[1 493]};...
        '20161018',{[1 1658]};...
        '20200119', {[]};...
        '20200122', {[]};...
        '20200124', {[]};...
        '20200126', {[]};...
        '20200128', {[]};...
        '20200130', {[]};...
        '20200131', {[]};...
        '20200202', {[]};...
        '20200205', {[]};...
        '20200207', {[]};...
        '20200209', {[]};...
        '20200211', {[]};...
        '20200213', {[]};...
        '20200215', {[]};...
        '20200218', {[]}
        };

errors{2,1} = {'183'};
errors{2,2} = {'11990'};
errors{2,3} = {'KV'};

%% Saw tooth

%183
sawtooth{1} = {...
        '20131210',{[]};...
        '20131211',{[2345 16798]};...
        '20131212',{[2042 23063]};...
        '20131214',{[838 10379]};...
        '20131215',{[4710 13202]};...
        '20131216',{[5933 14153]};...
        '20131219',{[]};...
        '20131220',{[1760 10449]};...
        '20140107',{[]};...
        '20140109',{[]};...
        '20140112',{[3019 3254]};...
        '20140118',{[]};...
        '20140120',{[]};...
        '20140121',{[]};...
        '20140122',{[]};...
        '20160808',{[1 6450]};...
        '20160810',{[108 7649]};...
        '20160812',{[16 8309]};...
        '20160815',{[450 5603]};...
        '20160817',{[6218 12205]};...
        '20160819',{[9075 15713]};...
        '20160822',{[12798 17395]};...
        '20160824',{[10850 17868]};...
        '20160826',{[12193 17808]};...
        '20160830',{[9549 14735]};...
        '20160917',{[]};...
        '20160921',{[]};...
        '20160923',{[]};...
        '20160926',{[]};...
        '20160927',{[3 546]};...
        '20161001',{[316 1029]};...
        '20161006',{[742 3625]};...
        '20161009',{[]};...
        '20161010',{[1446 2887]};...
        '20161013',{[]};...
        '20161014',{[1728 3130]};...
        '20161015',{[]};...
        '20161018',{[]};...
        '20200119', {[61 16230]};...
        '20200122', {[]};...
        '20200124', {[]};...
        '20200126', {[]};...
        '20200128', {[]};... % 34870 39497
        '20200130', {[]};...
        '20200131', {[]};...
        '20200202', {[]};...
        '20200205', {[]};...
        '20200207', {[]};...
        '20200209', {[]};...
        '20200211', {[]};...
        '20200213', {[1 6165]};...
        '20200215', {[]};...
        '20200218', {[1 5680]}
        };

%11990
sawtooth{2} = {...
        '20131210',{[]};...
        '20131211',{[]};...
        '20131212',{[]};...
        '20131214',{[]};...
        '20131215',{[]};...
        '20131216',{[]};...
        '20131219',{[]};...
        '20131220',{[]};...
        '20140107',{[]};...
        '20140109',{[]};...
        '20140112',{[]};...
        '20140118',{[]};...
        '20140120',{[]};...
        '20140121',{[]};...
        '20140122',{[]};...
        '20160808',{[]};...
        '20160810',{[]};...
        '20160812',{[]};...
        '20160815',{[]};...
        '20160817',{[]};...
        '20160819',{[]};...
        '20160822',{[]};...
        '20160824',{[]};...
        '20160826',{[]};...
        '20160830',{[]};...
        '20160917',{[]};...
        '20160921',{[]};...
        '20160923',{[]};...
        '20160926',{[]};...
        '20160927',{[]};...
        '20161001',{[]};...
        '20161006',{[]};...
        '20161009',{[]};...
        '20161010',{[]};...
        '20161013',{[]};...
        '20161014',{[]};...
        '20161015',{[]};...
        '20161018',{[]};...
        '20200119', {[]};...
        '20200122', {[]};...
        '20200124', {[]};...
        '20200126', {[]};...
        '20200128', {[]};...
        '20200130', {[]};...
        '20200131', {[]};...
        '20200202', {[]};...
        '20200205', {[]};...
        '20200207', {[]};...
        '20200209', {[]};...
        '20200211', {[]};...
        '20200213', {[]};...
        '20200215', {[]};...
        '20200218', {[]}
        };

%KV
sawtooth{3} = {...
        '20131210',{[]};...
        '20131211',{[]};...
        '20131212',{[]};...
        '20131214',{[]};...
        '20131215',{[]};...
        '20131216',{[]};...
        '20131219',{[]};...
        '20131220',{[]};...
        '20140107',{[]};...
        '20140109',{[]};...
        '20140112',{[]};...
        '20140118',{[]};...
        '20140120',{[]};...
        '20140121',{[]};...
        '20140122',{[]};...
        '20160808',{[]};...
        '20160810',{[]};...
        '20160812',{[]};...
        '20160815',{[]};...
        '20160817',{[]};...
        '20160819',{[]};...
        '20160822',{[]};...
        '20160824',{[]};...
        '20160826',{[]};...
        '20160830',{[]};...
        '20160917',{[]};...
        '20160921',{[]};...
        '20160923',{[]};...
        '20160926',{[]};...
        '20160927',{[]};...
        '20161001',{[]};...
        '20161006',{[]};...
        '20161009',{[]};...
        '20161010',{[]};...
        '20161013',{[]};...
        '20161014',{[]};...
        '20161015',{[]};...
        '20161018',{[]};...
        '20200119', {[]};...
        '20200122', {[]};...
        '20200124', {[]};...
        '20200126', {[]};...
        '20200128', {[]};...
        '20200130', {[]};...
        '20200131', {[]};...
        '20200202', {[]};...
        '20200205', {[]};...
        '20200207', {[]};...
        '20200209', {[]};...
        '20200211', {[]};...
        '20200213', {[]};...
        '20200215', {[]};...
        '20200218', {[]}
        };



sawtooth{2,1} = {'183'};
sawtooth{2,2} = {'11990'};
sawtooth{2,3} = {'KV'};
