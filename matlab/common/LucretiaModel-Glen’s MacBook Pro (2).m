classdef LucretiaModel < handle
  %LUCRETIAMODEL Interface to Lucretia model
  properties(SetAccess=private)
    Initial % Lucretia Initial structure
  end
  properties(Dependent)
    ModelRegionID(11,2) uint32
    ModelRegionE(11,2) single % Region boundary  energy (GeV)
  end
  properties(Constant)
    LucretiaModelVersion single = 1.0 
    ModelRegionName(11,1) string = ["INJ";"L0";"DL1";"L1";"BC11";"L2";"BC14";"L3";"BC20";"FFS";"SPECTDUMP"]
  end
  properties(Access=private)
    ModelDat
  end
  methods
    function obj = LucretiaModel(LucretiaFile)
      global BEAMLINE
      if ~exist('LucretiaFile','var')
        error('Must provide Lucretia beamline file');
      end
      % Load Lucretia BEAMLINE database and configure
      ld = load(LucretiaFile,'BEAMLINE','Initial') ;
      if ~isfield(ld,'BEAMLINE') || ~isfield(ld,'Initial')
        error('Beamline and/or Initial structures not found in provided Lucretia file');
      end
      BEAMLINE = ld.BEAMLINE ;
      obj.Initial = ld.Initial ;
      SetElementSlices(1,length(BEAMLINE));
    end
    function id = GetModelClassID(obj,classname,regionID)
      global BEAMLINE
      if ~exist('regionID','var') || isempty(regionID)
        regionID=1:length(obj.ModelRegionName);
      end
      if ~isfield(obj.ModelDat,'classID') || ~isfield(obj.ModelDat.classID,classname)
        obj.ModelDat.classID.(classname) = cell(1,length(obj.ModelRegionName)) ;
      end
      for ireg=1:length(regionID)
        if isempty(obj.ModelDat.classID.(classname){regionID(ireg)})
          obj.ModelDat.classID.(classname){regionID(ireg)} = ...
            findcells(BEAMLINE,'Class',classname,obj.ModelRegionID(regionID(ireg,1)),obj.ModelRegionID(regionID(ireg,2))) ;
        end
      end
      id = [obj.ModelDat.classID.(classname){regionID}] ;
    end
    function emod = get.ModelRegionE(obj)
      global BEAMLINE
      if ~isfield(obj.ModelDat,'RegionE') && ~isempty(BEAMLINE)
        id = obj.ModelRegionID ;
        emod = zeros(length(id),2,'single') ;
        for ireg=1:length(id)
          emod(ireg,1) = BEAMLINE{id(ireg,1)}.P ;
          emod(ireg,2) = BEAMLINE{id(ireg,2)}.P ;
        end
        obj.ModelDat.RegionE = emod ;
      else
        emod = obj.ModelDat.RegionE ;
      end
    end
    function id = get.ModelRegionID(obj)
      global BEAMLINE
      if ~isfield(obj.ModelDat,'RegionID') && ~isempty(BEAMLINE)
        id = zeros(11,2,'uint32') ;
        id(1,1)=1;
        id(1,2)=findcells(BEAMLINE,'Name','L0BFBEG')-1;
        id(2,1)=findcells(BEAMLINE,'Name','L0BFBEG');
        id(2,2)=findcells(BEAMLINE,'Name','L0BFEND');
        id(3,1)=findcells(BEAMLINE,'Name','L0BFEND')+1;
        id(3,2)=findcells(BEAMLINE,'Name','BEGL1F')-1;
        id(4,1)=findcells(BEAMLINE,'Name','BEGL1F');
        id(4,2)=findcells(BEAMLINE,'Name','ENDL1F');
        id(5,1)=findcells(BEAMLINE,'Name','ENDL1F')+1;
        id(5,2)=findcells(BEAMLINE,'Name','ENDBC11_2');
        id(6,1)=findcells(BEAMLINE,'Name','ENDBC11_2')+1;
        id(6,2)=findcells(BEAMLINE,'Name','BEGL2F')-1;
        id(7,1)=findcells(BEAMLINE,'Name','BEGL2F');
        id(7,2)=findcells(BEAMLINE,'Name','ENDL2F');
        id(8,1)=findcells(BEAMLINE,'Name','ENDL2F')+1;
        id(8,2)=findcells(BEAMLINE,'Name','ENDBC14_2');
        id(9,1)=findcells(BEAMLINE,'Name','ENDBC14_2')+1;
        id(9,2)=findcells(BEAMLINE,'Name','BEGFF20')-1;
        id(10,1)=findcells(BEAMLINE,'Name','BEGFF20');
        id(10,2)=findcells(BEAMLINE,'Name','MIP');
        id(11,1)=findcells(BEAMLINE,'Name','MIP')+1;
        id(11,2)=length(BEAMLINE);
        obj.ModelDat.RegionID = id ;
      else
        id = obj.ModelDat.RegionID ;
      end
    end
  end
  methods(Static)
    function names = GetModelNames(id)
      global BEAMLINE
      names=arrayfun(@(x) BEAMLINE{x}.Name,id,'UniformOutput',false);
    end
  end
end