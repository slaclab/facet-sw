classdef F2_mags < handle
  %F2_MAGS FACET-II magnet data
  events
    PVUpdated
  end
  properties(SetObservable)
    UseSector(1,5) logical = true(1,5) % L0, L1, L2, L3, S20
  end
  properties(SetAccess=private)
    Initial
    ModelRegionID(1,5) uint32
    LM % Lucretia model object
  end
  properties(Constant)
    version single = 1.0
  end
  methods
    function obj = F2_mags(LM)
      
      % Argument checks
      if ~exist('LM','var') || ~isa(LM,'LucretiaModel')
        error('Must provide LucretiaModel object');
      end
      obj.LM=LM;
      
    end
  end
end