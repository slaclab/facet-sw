classdef F2_LEMApp < handle
  properties
    version single = 1
    Eref(1,4) = [0.005 0.135 0.335 4.5 10]
    linacsel(1,4) logical = [true true true true] % use: L0, L1, L2, L3
  end
  properties(SetAccess=private)
    pvlist
    pvs
  end
  methods
    function obj = F2_LEMApp
      context = PV.Initialize(PVtype.EPICS) ;
      obj.pvlist=[];
      for isec=10:11 
        obj.pvlist(end+1) = PV(context,'name',sprintf("sb%d_pha",isec),'pvname',sprintf("LI%d:SBST:1:PDES",isec),'monitor',true); % Sub-booster phases
        
      end
      pset(obj.pvlist,'debug',0) ;
      obj.pvs = struct(obj.pvlist) ;
    end
  end
end