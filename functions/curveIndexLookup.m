function [curveIndex] = curveIndexLookup(date)

curveInd = {'20140112',[6100 6300;15060 15220;18910 19010];
            '20140118',[3900 4150;9500 9750;11500 11750;12750 12850];
            '20140120',[6950 7150;10500 10700;13750 13950];
            '20140122',[8650 8950;9050 9300;12250 12500];
            '20160808',[12357 12466];
            '20160810',[10554 10743];
            '20160812',[11639 11889];
            '20160815',[5243 5813];
            '20160817',[4453 4797];
            '20160819',[13443 13748];
            '20160822',[9984 10188];
            '20200218',[3250 3450; 20490 20576]
             };
         
index = cellfun(@(x) strcmp(x,date),curveInd(:,1))==1;
             
curveIndex = curveInd{index,2};