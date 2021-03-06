classdef F2_IN10GunWatcherApp < handle
  events
    PVUpdated % PV object list notifies this event after each set of monitored PVs have finished updating
  end
  properties
    pvlist PV
    pvs
    guihan
  end
  properties(Hidden)
    listeners
  end
  properties(Constant)
    maxbeat=1e7 % max heartbeat count, wrap to zero
    triglevel=0.5 % trigger level on scope / V
    scalevals = [1 2 5 10 20 50 100 200 500 1000 2000 5000 10000] % V/div on scope
  end
  methods
    function obj = F2_IN10GunWatcherApp(apph)
      context = PV.Initialize(PVtype.EPICS) ;
      obj.pvlist=[...
        PV(context,'name',"State",'pvname',"SIOC:SYS1:ML00:AO843",'mode',"rw",'monitor',true); % Watcher state -1 OFF, 0 no error, 1 Gun FPWR error, 2 scope tarce derived error
        PV(context,'name',"MaxPwr",'pvname',"SIOC:SYS1:ML00:AO844",'mode',"rw",'monitor',true); % Max forward gun power
        PV(context,'name',"Enable",'pvname',"SIOC:SYS1:ML00:AO845",'mode',"rw",'monitor',true); % Watcher enable state 0 = OFF 1 = ON
        PV(context,'name',"Heartbeat",'pvname',"SIOC:SYS1:ML00:AO846",'mode',"rw",'monitor',true); % Watcher heartbeat
        PV(context,'name',"pconv",'pvname',"SIOC:SYS1:ML00:AO847",'mode',"rw",'monitor',true); % V:MW conversion factor
        PV(context,'name',"GunPowerWFout",'pvname',"SIOC:SYS1:ML00:AO848",'mode',"rw",'monitor',true); % PV to write forward power calc from waveform
        PV(context,'name',"pconv_off",'pvname',"SIOC:SYS1:ML00:AO849",'mode',"rw",'monitor',true); % V:MW conversion offset factor
        PV(context,'name',"GunFwdPwr",'pvname',"KLYS:LI10:21:SLED_PWR",'monitor',true); % Forward gun power
        PV(context,'name',"ScopeTriggerWF",'pvname',"SCOP:IN10:FC01:WF_CH2_TRACE",'monitor',true); % Laser trigger signal on scope / V
        PV(context,'name',"GunPowerWF",'pvname',"SCOP:IN10:FC01:WF_CH0_TRACE",'monitor',true); % Gun cavity power signal on scope / V
        PV(context,'name',"GunRFcntrl",'pvname',"KLYS:LI10:21:OUTPUTENBL",'mode',"rw"); % Low-level RF control for 10-2
        PV(context,'name',"GunRF",'pvname',"KLYS:LI10:21:OUTPUTENBL.RVAL",'monitor',true); % Low-level RF readback for 10-2
        PV(context,'name',"ScopePowerScale",'pvname',"SCOP:IN10:FC01:MBBO_CH0_SCL.RVAL",'monitor',true); % scale on scope
        PV(context,'name',"ScopeTriggerScale",'pvname',"SCOP:IN10:FC01:MBBO_CH2_SCL.RVAL",'monitor',true); % scale on scope
        PV(context,'name',"ScopePowerPos",'pvname',"SCOP:IN10:FC01:AO_CH0_POS",'monitor',true); % pos on scope
        PV(context,'name',"ScopeTriggerPos",'pvname',"SCOP:IN10:FC01:AO_CH2_POS",'monitor',true); % scale on scope
        PV(context,'name',"ScopeTimeScale",'pvname',"SCOP:IN10:FC01:AI_TIME_DIV",'monitor',true); % time scale s / div
        PV(context,'name',"FcupWF",'pvname',"SCOP:IN10:FC01:WF_CH1_TRACE",'monitor',true); % Gun cavity power signal on faraday cup / V
        PV(context,'name',"FcupScale",'pvname',"SCOP:IN10:FC01:MBBO_CH1_SCL.RVAL",'monitor',true); % scale on faraday
        PV(context,'name',"FcupPos",'pvname',"SCOP:IN10:FC01:AO_CH0_POS",'monitor',true); % pos on scope
        PV(context,'name',"Fcup2WF",'pvname',"SCOP:IN10:FC02:WF_CH0_TRACE",'monitor',true); % Gun cavity power signal on faraday cup 2 / V
        PV(context,'name',"Fcup2Scale",'pvname',"SCOP:IN10:FC02:MBBO_CH0_SCL.RVAL",'monitor',true); % scale on faraday
        PV(context,'name',"Fcup2Pos",'pvname',"SCOP:IN10:FC02:AO_CH0_POS",'monitor',true); % pos on scope
        PV(context,'name',"Scope2TimeScale",'pvname',"SCOP:IN10:FC02:AI_TIME_DIV",'monitor',true); % time scale s / div
        PV(context,'name',"LaserEnergy",'pvname',"LASR:LT10:930:PWR",'monitor',true); % IN10 laser power meter
        PV(context,'name',"FCQ",'pvname',"SIOC:SYS1:ML00:AO850",'monitor',true,'mode',"rw"); % output faraday cup charge meas
        PV(context,'name',"QE",'pvname',"SIOC:SYS1:ML00:AO840",'monitor',true,'mode',"rw"); % output faraday cup QE meas
        PV(context,'name',"FCQ2",'pvname',"SIOC:SYS1:ML00:AO802",'monitor',true,'mode',"rw"); % output faraday cup charge meas
        PV(context,'name',"QE2",'pvname',"SIOC:SYS1:ML00:AO801",'monitor',true,'mode',"rw"); % output faraday cup QE meas
        ] ;
      pset(obj.pvlist,'debug',0) ;
      obj.pvs = struct(obj.pvlist) ;
      if exist('apph','var')
        obj.guihan=apph;
        obj.pvs.Enable.guihan = apph.EnableEditField ;
        obj.pvs.GunRF.guihan = apph.RFONLamp ;
        obj.pvs.MaxPwr.guihan = apph.MaxPWRMWEditField ;
        obj.pvs.State.guihan = apph.StateEditField ;
        obj.pvs.Heartbeat.guihan = apph.HeartbeatEditField ;
        obj.pvs.pconv.guihan = apph.PowerConversionVMWEditField ;
        obj.pvs.pconv_off.guihan = apph.PowerConversionVOffsetEditField ;
        obj.pvs.GunFwdPwr.guihan = [apph.EditField, apph.GunPwrPVMWGauge] ;
        obj.pvs.GunPowerWFout.guihan = [apph.EditField_2, apph.GunPwrPVMWGauge_2] ;
        obj.pvs.FCQ.guihan = apph.EditField_3 ;
        obj.pvs.QE.guihan = apph.EditField_4 ;
        obj.pvs.FCQ2.guihan = apph.EditField_5 ;
        obj.pvs.QE2.guihan = apph.EditField_6 ;
      end
      obj.listeners = addlistener(obj,'PVUpdated',@(~,~) obj.wdfun) ;
      run(obj.pvlist,false,0.1,obj,'PVUpdated');
      diary('/u1/facet/physics/log/matlab/F2_IN10GunWatcher.log');
      fprintf('%s (F2_IN10GunWatcher) Started.\n',datestr(now));
    end
    function wdfun(obj)
      %WDFUN Watchdog function calls when PV values change
      persistent lastmax lasthb
      
      % Update limits on GUI gauge if GUI showing
      if ~isempty(obj.guihan) && (isempty(lastmax) || lastmax~=obj.pvs.MaxPwr.val{1})
        lastmax=obj.pvs.MaxPwr.val{1};
        obj.pvs.GunFwdPwr.limits = [0 obj.pvs.MaxPwr.val{1}];
        obj.pvs.GunPowerWFout.limits = [0 obj.pvs.MaxPwr.val{1}];
      end
      
      % Update heartbeat
      if isempty(lasthb)
        caput(obj.pvs.Heartbeat,1);
        lasthb=clock;
      elseif obj.pvs.Heartbeat.val{1} >= obj.maxbeat
        caput(obj.pvs.Heartbeat,1);
      elseif etime(clock,lasthb)>1
        caput(obj.pvs.Heartbeat,obj.pvs.Heartbeat.val{1}+1);
        lasthb=clock;
      end
      
      % Check forward Gun RF power readout from PV
      pverr=false;
      if obj.pvs.GunRF.val{1}==1 && obj.pvs.Enable.val{1} > 0 && obj.pvs.GunFwdPwr.val{1} > obj.pvs.MaxPwr.val{1} % disable RF if power level too high
          pverr=true;
        fprintf('%s (F2_IN10GunWatcher) Gun FWD power PV exceeds limits: %g > %g MW\n',datestr(now),obj.pvs.GunFwdPwr.val{1},obj.pvs.MaxPwr.val{1});
        caput(obj.pvs.State,0);
        caput(obj.pvs.GunRFcntrl,"Disable");
      elseif obj.pvs.GunRF.val{1}==1
        caput(obj.pvs.State,0);
      end
      
      % Get time base
      dt = obj.pvs.ScopeTimeScale.val{1}*10 ;
      dt2 = obj.pvs.Scope2TimeScale.val{1}*10 ;
      
      % Check Gun cavity power from scope waveforms
      wf1 = obj.pvs.ScopeTriggerWF.val{1} - obj.pvs.ScopeTriggerPos.val{1} ; wf1(abs(wf1)>8)=[];
      sscale = obj.scalevals(obj.pvs.ScopeTriggerScale.val{1}+1) ; wf1=wf1.*sscale.*1e-3;
      trigV = max(wf1) ;
      wf = obj.pvs.GunPowerWF.val{1} - obj.pvs.ScopePowerPos.val{1} ; wf(abs(wf)>8)=[];
      sscale = obj.scalevals(obj.pvs.ScopePowerScale.val{1}+1) ; wf=wf.*sscale.*1e-3;
      powerMW = -mean(wf-obj.pvs.pconv_off.val{1}) * obj.pvs.pconv.val{1} ;
      
      % Faraday cup trace
      wf_fc = obj.pvs.FcupWF.val{1} - obj.pvs.FcupPos.val{1} ; wf_fc(abs(wf_fc)>8)=[];
      sscale = obj.scalevals(obj.pvs.FcupScale.val{1}+1) ; wf_fc=wf_fc.*sscale.*1e-3;
      % use first 10% of waveform to get integration pedastal, then
      % integrate until first zero crossing after first peak
      ped=mean(wf_fc(1:ceil(length(wf_fc)/10)));
      wf_fc=wf_fc-ped;
      [~,ipk]=min(wf_fc);
      i1=ipk+find(wf_fc(ipk:end)>0,1)-0.5;
      t1=dt*(i1/length(wf_fc));
      Vs = integral(@(x) interp1(linspace(0,dt,length(wf_fc)),wf_fc,x,'linear'),0,t1);
      Q = 1e9 * abs(Vs)/50 ; % Charge in nC
      QE = ( Q / obj.pvs.LaserEnergy.val{1} ) * 0.004661010785703 ;
      caput(obj.pvs.FCQ,Q);
      caput(obj.pvs.QE,QE);
      
      % Faraday cup 2
      wf_fc2 = obj.pvs.Fcup2WF.val{1} - obj.pvs.Fcup2Pos.val{1} ; wf_fc2(abs(wf_fc2)>8)=[];
      sscale = obj.scalevals(obj.pvs.Fcup2Scale.val{1}+1) ; wf_fc2=wf_fc2.*sscale.*1e-3;
      % use first 10% of waveform to get integration pedastal, then
      % integrate until first zero crossing after first peak
      ped2=mean(wf_fc2(1:ceil(length(wf_fc2)/10)));
      wf_fc2=wf_fc2-ped2;
      Vs = integral(@(x) interp1(linspace(0,dt2,length(wf_fc2)),wf_fc2,x,'linear'),0,dt2);
      Q = 1e9 * abs(Vs)/50 ; % Charge in nC
      QE = ( Q / obj.pvs.LaserEnergy.val{1} ) * 0.004661010785703 ;
      caput(obj.pvs.FCQ2,Q);
      caput(obj.pvs.QE2,QE);
      
      caput(obj.pvs.GunPowerWFout,powerMW);
      if obj.pvs.GunRF.val{1}==1 && obj.pvs.Enable.val{1} > 1 && trigV > obj.triglevel && powerMW > obj.pvs.MaxPwr.val{1}
        fprintf('%s (F2_IN10GunWatcher) Gun FWD power exceeds limits (from scope waveform): %g > %g MW\n',datestr(now),powerMW,obj.pvs.MaxPwr.val{1});
        caput(obj.pvs.State,2);
        caput(obj.pvs.GunRFcntrl,"Disable");        
      elseif obj.pvs.GunRF.val{1}==1 && ~pverr
        caput(obj.pvs.State,0);
      end
      
      % Update waveform on GUI if showing
      if ~isempty(obj.guihan)
        t=linspace(0,dt,length(wf1)).*1e9;
        t2=linspace(0,dt2,length(wf_fc2)).*1e9;
        plot(obj.guihan.UIAxes,t,wf1,t,wf,t,wf_fc,t2,wf_fc2);
        hold(obj.guihan.UIAxes,'on');
        line(obj.guihan.UIAxes,[t(1) t(end)],ones(1,2).*obj.triglevel,'LineStyle','--');
        grid(obj.guihan.UIAxes,'on');
        hold(obj.guihan.UIAxes,'off');
        axis(obj.guihan.UIAxes,'tight');
        legend(obj.guihan.UIAxes,{'Laser Trigger', 'Gun Cavity Power' 'Faraday Cup 1' 'Faraday Cup 2'},'Location','NE');
        drawnow
      end
      
    end
  end
end
