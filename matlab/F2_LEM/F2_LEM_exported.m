classdef F2_LEM_exported < matlab.apps.AppBase

  % Properties that correspond to app components
  properties (Access = public)
    UIFigure            matlab.ui.Figure
    GridLayout          matlab.ui.container.GridLayout
    LeftPanel           matlab.ui.container.Panel
    ScaleMagnetsButton  matlab.ui.control.Button
    UndoButton          matlab.ui.control.Button
    TabGroup            matlab.ui.container.TabGroup
    EREFSTab            matlab.ui.container.Tab
    GunEditFieldLabel   matlab.ui.control.Label
    GunEref             matlab.ui.control.NumericEditField
    DL1EditFieldLabel   matlab.ui.control.Label
    DL1Eref             matlab.ui.control.NumericEditField
    BC11EditFieldLabel  matlab.ui.control.Label
    BC11Eref            matlab.ui.control.NumericEditField
    BC14EditFieldLabel  matlab.ui.control.Label
    BC14EditField       matlab.ui.control.NumericEditField
    BC20EditFieldLabel  matlab.ui.control.Label
    BC20EditField       matlab.ui.control.EditField
    ErefGeVLabel        matlab.ui.control.Label
    FudgeFactorLabel    matlab.ui.control.Label
    ExtantLabel         matlab.ui.control.Label
    RefLabel            matlab.ui.control.Label
    L0Label             matlab.ui.control.Label
    EditField           matlab.ui.control.NumericEditField
    EditField_2         matlab.ui.control.NumericEditField
    L1Label             matlab.ui.control.Label
    EditField_3         matlab.ui.control.NumericEditField
    EditField_4         matlab.ui.control.NumericEditField
    L3Label             matlab.ui.control.Label
    EditField_5         matlab.ui.control.NumericEditField
    EditField_6         matlab.ui.control.NumericEditField
    L3Label_2           matlab.ui.control.Label
    EditField_7         matlab.ui.control.NumericEditField
    EditField_8         matlab.ui.control.NumericEditField
    QTab                matlab.ui.container.Tab
    BunchChargenCLabel  matlab.ui.control.Label
    L0EditFieldLabel    matlab.ui.control.Label
    L0EditField         matlab.ui.control.NumericEditField
    L1EditFieldLabel    matlab.ui.control.Label
    L1EditField         matlab.ui.control.NumericEditField
    L2EditFieldLabel    matlab.ui.control.Label
    L2EditField         matlab.ui.control.NumericEditField
    L3EditFieldLabel    matlab.ui.control.Label
    L3EditField         matlab.ui.control.NumericEditField
    RFTab               matlab.ui.container.Tab
    FeedbacksTab        matlab.ui.container.Tab
    L0CheckBox          matlab.ui.control.CheckBox
    L1CheckBox          matlab.ui.control.CheckBox
    L2CheckBox          matlab.ui.control.CheckBox
    L3CheckBox          matlab.ui.control.CheckBox
    RightPanel          matlab.ui.container.Panel
    TabGroup2           matlab.ui.container.TabGroup
    EProfileTab         matlab.ui.container.Tab
    UIAxes              matlab.ui.control.UIAxes
    KlysEgainTab        matlab.ui.container.Tab
    GridLayout2         matlab.ui.container.GridLayout
    Label_10            matlab.ui.control.Label
    Label_9             matlab.ui.control.Label
    Label_8             matlab.ui.control.Label
    Label_7             matlab.ui.control.Label
    Label_6             matlab.ui.control.Label
    Label_5             matlab.ui.control.Label
    Label_4             matlab.ui.control.Label
    Label_3             matlab.ui.control.Label
    Label_2             matlab.ui.control.Label
    Label               matlab.ui.control.Label
    L0Label_2           matlab.ui.control.Label
    L1L2Label           matlab.ui.control.Label
    L3Label_3           matlab.ui.control.Label
    EditField_9         matlab.ui.control.EditField
    EditField_10        matlab.ui.control.EditField
    EditField_11        matlab.ui.control.EditField
    EditField_12        matlab.ui.control.EditField
    EditField_13        matlab.ui.control.EditField
    EditField_14        matlab.ui.control.EditField
    EditField_15        matlab.ui.control.EditField
    EditField_16        matlab.ui.control.EditField
    EditField_17        matlab.ui.control.EditField
    EditField_18        matlab.ui.control.EditField
    EditField_19        matlab.ui.control.EditField
    EditField_20        matlab.ui.control.EditField
    EditField_21        matlab.ui.control.EditField
    EditField_22        matlab.ui.control.EditField
    EditField_23        matlab.ui.control.EditField
    EditField_24        matlab.ui.control.EditField
    EditField_25        matlab.ui.control.EditField
    EditField_26        matlab.ui.control.EditField
    EditField_27        matlab.ui.control.EditField
    EditField_28        matlab.ui.control.EditField
    EditField_29        matlab.ui.control.EditField
    EditField_30        matlab.ui.control.EditField
    EditField_31        matlab.ui.control.EditField
    EditField_32        matlab.ui.control.EditField
    EditField_33        matlab.ui.control.EditField
    EditField_34        matlab.ui.control.EditField
    EditField_35        matlab.ui.control.EditField
    EditField_36        matlab.ui.control.EditField
    EditField_37        matlab.ui.control.EditField
    EditField_38        matlab.ui.control.EditField
    EditField_39        matlab.ui.control.EditField
    EditField_40        matlab.ui.control.EditField
    EditField_41        matlab.ui.control.EditField
    EditField_42        matlab.ui.control.EditField
    EditField_43        matlab.ui.control.EditField
    EditField_44        matlab.ui.control.EditField
    EditField_45        matlab.ui.control.EditField
    EditField_46        matlab.ui.control.EditField
    EditField_47        matlab.ui.control.EditField
    EditField_48        matlab.ui.control.EditField
    EditField_49        matlab.ui.control.EditField
    EditField_50        matlab.ui.control.EditField
    EditField_51        matlab.ui.control.EditField
    EditField_52        matlab.ui.control.EditField
    EditField_53        matlab.ui.control.EditField
    EditField_54        matlab.ui.control.EditField
    EditField_55        matlab.ui.control.EditField
    EditField_56        matlab.ui.control.EditField
    EditField_57        matlab.ui.control.EditField
    EditField_58        matlab.ui.control.EditField
    EditField_59        matlab.ui.control.EditField
    EditField_60        matlab.ui.control.EditField
    EditField_61        matlab.ui.control.EditField
    EditField_62        matlab.ui.control.EditField
    EditField_63        matlab.ui.control.EditField
    EditField_64        matlab.ui.control.EditField
    EditField_65        matlab.ui.control.EditField
    EditField_66        matlab.ui.control.EditField
    EditField_67        matlab.ui.control.EditField
    EditField_68        matlab.ui.control.EditField
    EditField_69        matlab.ui.control.EditField
    EditField_70        matlab.ui.control.EditField
    EditField_71        matlab.ui.control.EditField
    EditField_72        matlab.ui.control.EditField
    EditField_73        matlab.ui.control.EditField
    EditField_74        matlab.ui.control.EditField
    EditField_75        matlab.ui.control.EditField
    EditField_76        matlab.ui.control.EditField
    EditField_77        matlab.ui.control.EditField
    EditField_78        matlab.ui.control.EditField
    EditField_79        matlab.ui.control.EditField
    EditField_80        matlab.ui.control.EditField
    EditField_81        matlab.ui.control.EditField
    EditField_82        matlab.ui.control.EditField
    EditField_83        matlab.ui.control.EditField
    EditField_84        matlab.ui.control.EditField
    EditField_85        matlab.ui.control.EditField
    EditField_86        matlab.ui.control.EditField
    EditField_87        matlab.ui.control.EditField
    EditField_88        matlab.ui.control.EditField
    KlysPhaseTab        matlab.ui.container.Tab
    GridLayout2_2       matlab.ui.container.GridLayout
    Label_11            matlab.ui.control.Label
    Label_12            matlab.ui.control.Label
    Label_13            matlab.ui.control.Label
    Label_14            matlab.ui.control.Label
    Label_15            matlab.ui.control.Label
    Label_16            matlab.ui.control.Label
    Label_17            matlab.ui.control.Label
    Label_18            matlab.ui.control.Label
    Label_19            matlab.ui.control.Label
    Label_20            matlab.ui.control.Label
    L0Label_3           matlab.ui.control.Label
    L1L2Label_2         matlab.ui.control.Label
    L3Label_4           matlab.ui.control.Label
    EditField_89        matlab.ui.control.EditField
    EditField_90        matlab.ui.control.EditField
    EditField_91        matlab.ui.control.EditField
    EditField_92        matlab.ui.control.EditField
    EditField_93        matlab.ui.control.EditField
    EditField_94        matlab.ui.control.EditField
    EditField_95        matlab.ui.control.EditField
    EditField_96        matlab.ui.control.EditField
    EditField_97        matlab.ui.control.EditField
    EditField_98        matlab.ui.control.EditField
    EditField_99        matlab.ui.control.EditField
    EditField_100       matlab.ui.control.EditField
    EditField_101       matlab.ui.control.EditField
    EditField_102       matlab.ui.control.EditField
    EditField_103       matlab.ui.control.EditField
    EditField_104       matlab.ui.control.EditField
    EditField_105       matlab.ui.control.EditField
    EditField_106       matlab.ui.control.EditField
    EditField_107       matlab.ui.control.EditField
    EditField_108       matlab.ui.control.EditField
    EditField_109       matlab.ui.control.EditField
    EditField_110       matlab.ui.control.EditField
    EditField_111       matlab.ui.control.EditField
    EditField_112       matlab.ui.control.EditField
    EditField_113       matlab.ui.control.EditField
    EditField_114       matlab.ui.control.EditField
    EditField_115       matlab.ui.control.EditField
    EditField_116       matlab.ui.control.EditField
    EditField_117       matlab.ui.control.EditField
    EditField_118       matlab.ui.control.EditField
    EditField_119       matlab.ui.control.EditField
    EditField_120       matlab.ui.control.EditField
    EditField_121       matlab.ui.control.EditField
    EditField_122       matlab.ui.control.EditField
    EditField_123       matlab.ui.control.EditField
    EditField_124       matlab.ui.control.EditField
    EditField_125       matlab.ui.control.EditField
    EditField_126       matlab.ui.control.EditField
    EditField_127       matlab.ui.control.EditField
    EditField_128       matlab.ui.control.EditField
    EditField_129       matlab.ui.control.EditField
    EditField_130       matlab.ui.control.EditField
    EditField_131       matlab.ui.control.EditField
    EditField_132       matlab.ui.control.EditField
    EditField_133       matlab.ui.control.EditField
    EditField_134       matlab.ui.control.EditField
    EditField_135       matlab.ui.control.EditField
    EditField_136       matlab.ui.control.EditField
    EditField_137       matlab.ui.control.EditField
    EditField_138       matlab.ui.control.EditField
    EditField_139       matlab.ui.control.EditField
    EditField_140       matlab.ui.control.EditField
    EditField_141       matlab.ui.control.EditField
    EditField_142       matlab.ui.control.EditField
    EditField_143       matlab.ui.control.EditField
    EditField_144       matlab.ui.control.EditField
    EditField_145       matlab.ui.control.EditField
    EditField_146       matlab.ui.control.EditField
    EditField_147       matlab.ui.control.EditField
    EditField_148       matlab.ui.control.EditField
    EditField_149       matlab.ui.control.EditField
    EditField_150       matlab.ui.control.EditField
    EditField_151       matlab.ui.control.EditField
    EditField_152       matlab.ui.control.EditField
    EditField_153       matlab.ui.control.EditField
    EditField_154       matlab.ui.control.EditField
    EditField_155       matlab.ui.control.EditField
    EditField_156       matlab.ui.control.EditField
    EditField_157       matlab.ui.control.EditField
    EditField_158       matlab.ui.control.EditField
    EditField_159       matlab.ui.control.EditField
    EditField_160       matlab.ui.control.EditField
    EditField_161       matlab.ui.control.EditField
    EditField_162       matlab.ui.control.EditField
    EditField_163       matlab.ui.control.EditField
    EditField_164       matlab.ui.control.EditField
    EditField_165       matlab.ui.control.EditField
    EditField_166       matlab.ui.control.EditField
    EditField_167       matlab.ui.control.EditField
    EditField_168       matlab.ui.control.EditField
    MagnetsTab          matlab.ui.container.Tab
    MessagesTab         matlab.ui.container.Tab
    TextArea            matlab.ui.control.TextArea
    FileMenu            matlab.ui.container.Menu
    SaveasrefMenu       matlab.ui.container.Menu
    HelpMenu            matlab.ui.container.Menu
  end

  % Properties that correspond to apps with auto-reflow
  properties (Access = private)
    onePanelWidth = 576;
  end

  % Callbacks that handle component events
  methods (Access = private)

    % Selection change function: TabGroup2
    function TabGroup2SelectionChanged(app, event)
      selectedTab = app.TabGroup2.SelectedTab;
      
    end

    % Changes arrangement of the app based on UIFigure width
    function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {424, 424};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {311, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
    end
  end

  % Component initialization
  methods (Access = private)

    % Create UIFigure and components
    function createComponents(app)

      % Create UIFigure and hide until all components are created
      app.UIFigure = uifigure('Visible', 'off');
      app.UIFigure.AutoResizeChildren = 'off';
      app.UIFigure.Position = [100 100 1131 424];
      app.UIFigure.Name = 'MATLAB App';
      app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

      % Create GridLayout
      app.GridLayout = uigridlayout(app.UIFigure);
      app.GridLayout.ColumnWidth = {311, '1x'};
      app.GridLayout.RowHeight = {'1x'};
      app.GridLayout.ColumnSpacing = 0;
      app.GridLayout.RowSpacing = 0;
      app.GridLayout.Padding = [0 0 0 0];
      app.GridLayout.Scrollable = 'on';

      % Create LeftPanel
      app.LeftPanel = uipanel(app.GridLayout);
      app.LeftPanel.Layout.Row = 1;
      app.LeftPanel.Layout.Column = 1;

      % Create ScaleMagnetsButton
      app.ScaleMagnetsButton = uibutton(app.LeftPanel, 'push');
      app.ScaleMagnetsButton.Position = [31 386 100 23];
      app.ScaleMagnetsButton.Text = 'Scale Magnets';

      % Create UndoButton
      app.UndoButton = uibutton(app.LeftPanel, 'push');
      app.UndoButton.Enable = 'off';
      app.UndoButton.Position = [165 386 100 23];
      app.UndoButton.Text = 'Undo';

      % Create TabGroup
      app.TabGroup = uitabgroup(app.LeftPanel);
      app.TabGroup.Position = [0 6 306 340];

      % Create EREFSTab
      app.EREFSTab = uitab(app.TabGroup);
      app.EREFSTab.Title = 'EREFS';

      % Create GunEditFieldLabel
      app.GunEditFieldLabel = uilabel(app.EREFSTab);
      app.GunEditFieldLabel.HorizontalAlignment = 'right';
      app.GunEditFieldLabel.Position = [22 237 28 22];
      app.GunEditFieldLabel.Text = 'Gun';

      % Create GunEref
      app.GunEref = uieditfield(app.EREFSTab, 'numeric');
      app.GunEref.Position = [65 237 85 22];
      app.GunEref.Value = 0.005;

      % Create DL1EditFieldLabel
      app.DL1EditFieldLabel = uilabel(app.EREFSTab);
      app.DL1EditFieldLabel.HorizontalAlignment = 'right';
      app.DL1EditFieldLabel.Position = [23 185 27 22];
      app.DL1EditFieldLabel.Text = 'DL1';

      % Create DL1Eref
      app.DL1Eref = uieditfield(app.EREFSTab, 'numeric');
      app.DL1Eref.Position = [65 185 85 22];
      app.DL1Eref.Value = 0.135;

      % Create BC11EditFieldLabel
      app.BC11EditFieldLabel = uilabel(app.EREFSTab);
      app.BC11EditFieldLabel.HorizontalAlignment = 'right';
      app.BC11EditFieldLabel.Position = [14 133 36 22];
      app.BC11EditFieldLabel.Text = 'BC11';

      % Create BC11Eref
      app.BC11Eref = uieditfield(app.EREFSTab, 'numeric');
      app.BC11Eref.Position = [65 133 85 22];
      app.BC11Eref.Value = 0.335;

      % Create BC14EditFieldLabel
      app.BC14EditFieldLabel = uilabel(app.EREFSTab);
      app.BC14EditFieldLabel.HorizontalAlignment = 'right';
      app.BC14EditFieldLabel.Position = [14 81 36 22];
      app.BC14EditFieldLabel.Text = 'BC14';

      % Create BC14EditField
      app.BC14EditField = uieditfield(app.EREFSTab, 'numeric');
      app.BC14EditField.Position = [65 81 85 22];
      app.BC14EditField.Value = 4.5;

      % Create BC20EditFieldLabel
      app.BC20EditFieldLabel = uilabel(app.EREFSTab);
      app.BC20EditFieldLabel.HorizontalAlignment = 'right';
      app.BC20EditFieldLabel.Position = [14 29 36 22];
      app.BC20EditFieldLabel.Text = 'BC20';

      % Create BC20EditField
      app.BC20EditField = uieditfield(app.EREFSTab, 'text');
      app.BC20EditField.HorizontalAlignment = 'right';
      app.BC20EditField.Position = [65 29 85 22];
      app.BC20EditField.Value = '10.0';

      % Create ErefGeVLabel
      app.ErefGeVLabel = uilabel(app.EREFSTab);
      app.ErefGeVLabel.FontWeight = 'bold';
      app.ErefGeVLabel.Position = [83 267 63 22];
      app.ErefGeVLabel.Text = 'Eref (GeV)';

      % Create FudgeFactorLabel
      app.FudgeFactorLabel = uilabel(app.EREFSTab);
      app.FudgeFactorLabel.FontWeight = 'bold';
      app.FudgeFactorLabel.Position = [174 267 82 22];
      app.FudgeFactorLabel.Text = 'Fudge Factor';

      % Create ExtantLabel
      app.ExtantLabel = uilabel(app.EREFSTab);
      app.ExtantLabel.FontWeight = 'bold';
      app.ExtantLabel.Position = [171 237 42 22];
      app.ExtantLabel.Text = 'Extant';

      % Create RefLabel
      app.RefLabel = uilabel(app.EREFSTab);
      app.RefLabel.FontWeight = 'bold';
      app.RefLabel.Position = [240 237 28 22];
      app.RefLabel.Text = 'Ref.';

      % Create L0Label
      app.L0Label = uilabel(app.EREFSTab);
      app.L0Label.HorizontalAlignment = 'right';
      app.L0Label.Position = [23 212 25 22];
      app.L0Label.Text = 'L0';

      % Create EditField
      app.EditField = uieditfield(app.EREFSTab, 'numeric');
      app.EditField.ValueDisplayFormat = '%5.4f';
      app.EditField.Editable = 'off';
      app.EditField.Position = [165 212 49 22];
      app.EditField.Value = 1;

      % Create EditField_2
      app.EditField_2 = uieditfield(app.EREFSTab, 'numeric');
      app.EditField_2.ValueDisplayFormat = '%5.4f';
      app.EditField_2.Editable = 'off';
      app.EditField_2.Position = [226 212 49 22];
      app.EditField_2.Value = 1;

      % Create L1Label
      app.L1Label = uilabel(app.EREFSTab);
      app.L1Label.HorizontalAlignment = 'right';
      app.L1Label.Position = [25 159 25 22];
      app.L1Label.Text = 'L1';

      % Create EditField_3
      app.EditField_3 = uieditfield(app.EREFSTab, 'numeric');
      app.EditField_3.ValueDisplayFormat = '%5.4f';
      app.EditField_3.Editable = 'off';
      app.EditField_3.Position = [165 159 49 22];
      app.EditField_3.Value = 1;

      % Create EditField_4
      app.EditField_4 = uieditfield(app.EREFSTab, 'numeric');
      app.EditField_4.ValueDisplayFormat = '%5.4f';
      app.EditField_4.Editable = 'off';
      app.EditField_4.Position = [226 159 49 22];
      app.EditField_4.Value = 1;

      % Create L3Label
      app.L3Label = uilabel(app.EREFSTab);
      app.L3Label.HorizontalAlignment = 'right';
      app.L3Label.Position = [25 106 25 22];
      app.L3Label.Text = 'L3';

      % Create EditField_5
      app.EditField_5 = uieditfield(app.EREFSTab, 'numeric');
      app.EditField_5.ValueDisplayFormat = '%5.4f';
      app.EditField_5.Editable = 'off';
      app.EditField_5.Position = [165 106 49 22];
      app.EditField_5.Value = 1;

      % Create EditField_6
      app.EditField_6 = uieditfield(app.EREFSTab, 'numeric');
      app.EditField_6.ValueDisplayFormat = '%5.4f';
      app.EditField_6.Editable = 'off';
      app.EditField_6.Position = [226 106 49 22];
      app.EditField_6.Value = 1;

      % Create L3Label_2
      app.L3Label_2 = uilabel(app.EREFSTab);
      app.L3Label_2.HorizontalAlignment = 'right';
      app.L3Label_2.Position = [25 54 25 22];
      app.L3Label_2.Text = 'L3';

      % Create EditField_7
      app.EditField_7 = uieditfield(app.EREFSTab, 'numeric');
      app.EditField_7.ValueDisplayFormat = '%5.4f';
      app.EditField_7.Editable = 'off';
      app.EditField_7.Position = [165 54 49 22];
      app.EditField_7.Value = 1;

      % Create EditField_8
      app.EditField_8 = uieditfield(app.EREFSTab, 'numeric');
      app.EditField_8.ValueDisplayFormat = '%5.4f';
      app.EditField_8.Editable = 'off';
      app.EditField_8.Position = [226 54 49 22];
      app.EditField_8.Value = 1;

      % Create QTab
      app.QTab = uitab(app.TabGroup);
      app.QTab.Title = 'Q';

      % Create BunchChargenCLabel
      app.BunchChargenCLabel = uilabel(app.QTab);
      app.BunchChargenCLabel.FontWeight = 'bold';
      app.BunchChargenCLabel.Position = [83 262 113 22];
      app.BunchChargenCLabel.Text = 'Bunch Charge (nC)';

      % Create L0EditFieldLabel
      app.L0EditFieldLabel = uilabel(app.QTab);
      app.L0EditFieldLabel.HorizontalAlignment = 'right';
      app.L0EditFieldLabel.Position = [48 228 25 22];
      app.L0EditFieldLabel.Text = 'L0';

      % Create L0EditField
      app.L0EditField = uieditfield(app.QTab, 'numeric');
      app.L0EditField.Position = [88 228 100 22];
      app.L0EditField.Value = 2;

      % Create L1EditFieldLabel
      app.L1EditFieldLabel = uilabel(app.QTab);
      app.L1EditFieldLabel.HorizontalAlignment = 'right';
      app.L1EditFieldLabel.Position = [48 191 25 22];
      app.L1EditFieldLabel.Text = 'L1';

      % Create L1EditField
      app.L1EditField = uieditfield(app.QTab, 'numeric');
      app.L1EditField.Position = [88 191 100 22];
      app.L1EditField.Value = 2;

      % Create L2EditFieldLabel
      app.L2EditFieldLabel = uilabel(app.QTab);
      app.L2EditFieldLabel.HorizontalAlignment = 'right';
      app.L2EditFieldLabel.Position = [48 154 25 22];
      app.L2EditFieldLabel.Text = 'L2';

      % Create L2EditField
      app.L2EditField = uieditfield(app.QTab, 'numeric');
      app.L2EditField.Position = [88 154 100 22];
      app.L2EditField.Value = 2;

      % Create L3EditFieldLabel
      app.L3EditFieldLabel = uilabel(app.QTab);
      app.L3EditFieldLabel.HorizontalAlignment = 'right';
      app.L3EditFieldLabel.Position = [48 117 25 22];
      app.L3EditFieldLabel.Text = 'L3';

      % Create L3EditField
      app.L3EditField = uieditfield(app.QTab, 'numeric');
      app.L3EditField.Position = [88 117 100 22];
      app.L3EditField.Value = 2;

      % Create RFTab
      app.RFTab = uitab(app.TabGroup);
      app.RFTab.Title = 'RF';

      % Create FeedbacksTab
      app.FeedbacksTab = uitab(app.TabGroup);
      app.FeedbacksTab.Title = 'Feedbacks';

      % Create L0CheckBox
      app.L0CheckBox = uicheckbox(app.LeftPanel);
      app.L0CheckBox.Text = 'L0';
      app.L0CheckBox.Position = [9 354 35 22];
      app.L0CheckBox.Value = true;

      % Create L1CheckBox
      app.L1CheckBox = uicheckbox(app.LeftPanel);
      app.L1CheckBox.Text = 'L1';
      app.L1CheckBox.Position = [94 354 35 22];
      app.L1CheckBox.Value = true;

      % Create L2CheckBox
      app.L2CheckBox = uicheckbox(app.LeftPanel);
      app.L2CheckBox.Text = 'L2';
      app.L2CheckBox.Position = [179 354 35 22];
      app.L2CheckBox.Value = true;

      % Create L3CheckBox
      app.L3CheckBox = uicheckbox(app.LeftPanel);
      app.L3CheckBox.Text = 'L3';
      app.L3CheckBox.Position = [264 354 35 22];
      app.L3CheckBox.Value = true;

      % Create RightPanel
      app.RightPanel = uipanel(app.GridLayout);
      app.RightPanel.Layout.Row = 1;
      app.RightPanel.Layout.Column = 2;

      % Create TabGroup2
      app.TabGroup2 = uitabgroup(app.RightPanel);
      app.TabGroup2.SelectionChangedFcn = createCallbackFcn(app, @TabGroup2SelectionChanged, true);
      app.TabGroup2.Position = [6 6 808 417];

      % Create EProfileTab
      app.EProfileTab = uitab(app.TabGroup2);
      app.EProfileTab.Title = 'E-Profile';

      % Create UIAxes
      app.UIAxes = uiaxes(app.EProfileTab);
      title(app.UIAxes, 'Title')
      xlabel(app.UIAxes, 'X')
      ylabel(app.UIAxes, 'Y')
      zlabel(app.UIAxes, 'Z')
      app.UIAxes.Position = [10 13 787 371];

      % Create KlysEgainTab
      app.KlysEgainTab = uitab(app.TabGroup2);
      app.KlysEgainTab.Title = 'Klys Egain';

      % Create GridLayout2
      app.GridLayout2 = uigridlayout(app.KlysEgainTab);
      app.GridLayout2.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
      app.GridLayout2.RowHeight = {'1x', 22, '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};

      % Create Label_10
      app.Label_10 = uilabel(app.GridLayout2);
      app.Label_10.HorizontalAlignment = 'center';
      app.Label_10.FontSize = 16;
      app.Label_10.FontWeight = 'bold';
      app.Label_10.Layout.Row = 2;
      app.Label_10.Layout.Column = 10;
      app.Label_10.Text = '19';

      % Create Label_9
      app.Label_9 = uilabel(app.GridLayout2);
      app.Label_9.HorizontalAlignment = 'center';
      app.Label_9.FontSize = 16;
      app.Label_9.FontWeight = 'bold';
      app.Label_9.Layout.Row = 2;
      app.Label_9.Layout.Column = 9;
      app.Label_9.Text = '18';

      % Create Label_8
      app.Label_8 = uilabel(app.GridLayout2);
      app.Label_8.HorizontalAlignment = 'center';
      app.Label_8.FontSize = 16;
      app.Label_8.FontWeight = 'bold';
      app.Label_8.Layout.Row = 2;
      app.Label_8.Layout.Column = 8;
      app.Label_8.Text = '17';

      % Create Label_7
      app.Label_7 = uilabel(app.GridLayout2);
      app.Label_7.HorizontalAlignment = 'center';
      app.Label_7.FontSize = 16;
      app.Label_7.FontWeight = 'bold';
      app.Label_7.Layout.Row = 2;
      app.Label_7.Layout.Column = 7;
      app.Label_7.Text = '16';

      % Create Label_6
      app.Label_6 = uilabel(app.GridLayout2);
      app.Label_6.HorizontalAlignment = 'center';
      app.Label_6.FontSize = 16;
      app.Label_6.FontWeight = 'bold';
      app.Label_6.Layout.Row = 2;
      app.Label_6.Layout.Column = 6;
      app.Label_6.Text = '15';

      % Create Label_5
      app.Label_5 = uilabel(app.GridLayout2);
      app.Label_5.HorizontalAlignment = 'center';
      app.Label_5.FontSize = 16;
      app.Label_5.FontWeight = 'bold';
      app.Label_5.Layout.Row = 2;
      app.Label_5.Layout.Column = 5;
      app.Label_5.Text = '14';

      % Create Label_4
      app.Label_4 = uilabel(app.GridLayout2);
      app.Label_4.HorizontalAlignment = 'center';
      app.Label_4.FontSize = 16;
      app.Label_4.FontWeight = 'bold';
      app.Label_4.Layout.Row = 2;
      app.Label_4.Layout.Column = 4;
      app.Label_4.Text = '13';

      % Create Label_3
      app.Label_3 = uilabel(app.GridLayout2);
      app.Label_3.HorizontalAlignment = 'center';
      app.Label_3.FontSize = 16;
      app.Label_3.FontWeight = 'bold';
      app.Label_3.Layout.Row = 2;
      app.Label_3.Layout.Column = 3;
      app.Label_3.Text = '12';

      % Create Label_2
      app.Label_2 = uilabel(app.GridLayout2);
      app.Label_2.HorizontalAlignment = 'center';
      app.Label_2.FontSize = 16;
      app.Label_2.FontWeight = 'bold';
      app.Label_2.Layout.Row = 2;
      app.Label_2.Layout.Column = 2;
      app.Label_2.Text = '11';

      % Create Label
      app.Label = uilabel(app.GridLayout2);
      app.Label.HorizontalAlignment = 'center';
      app.Label.FontSize = 16;
      app.Label.FontWeight = 'bold';
      app.Label.Layout.Row = 2;
      app.Label.Layout.Column = 1;
      app.Label.Text = '10';

      % Create L0Label_2
      app.L0Label_2 = uilabel(app.GridLayout2);
      app.L0Label_2.BackgroundColor = [1 1 0.0667];
      app.L0Label_2.HorizontalAlignment = 'center';
      app.L0Label_2.FontSize = 16;
      app.L0Label_2.FontWeight = 'bold';
      app.L0Label_2.Layout.Row = 1;
      app.L0Label_2.Layout.Column = 1;
      app.L0Label_2.Text = 'L0';

      % Create L1L2Label
      app.L1L2Label = uilabel(app.GridLayout2);
      app.L1L2Label.BackgroundColor = [1 1 0.0667];
      app.L1L2Label.HorizontalAlignment = 'center';
      app.L1L2Label.FontSize = 16;
      app.L1L2Label.FontWeight = 'bold';
      app.L1L2Label.Layout.Row = 1;
      app.L1L2Label.Layout.Column = [2 5];
      app.L1L2Label.Text = 'L1 / L2';

      % Create L3Label_3
      app.L3Label_3 = uilabel(app.GridLayout2);
      app.L3Label_3.BackgroundColor = [1 1 0.0667];
      app.L3Label_3.HorizontalAlignment = 'center';
      app.L3Label_3.FontSize = 16;
      app.L3Label_3.FontWeight = 'bold';
      app.L3Label_3.Layout.Row = 1;
      app.L3Label_3.Layout.Column = [6 10];
      app.L3Label_3.Text = 'L3';

      % Create EditField_9
      app.EditField_9 = uieditfield(app.GridLayout2, 'text');
      app.EditField_9.HorizontalAlignment = 'center';
      app.EditField_9.Layout.Row = 3;
      app.EditField_9.Layout.Column = 1;
      app.EditField_9.Value = '0.000';

      % Create EditField_10
      app.EditField_10 = uieditfield(app.GridLayout2, 'text');
      app.EditField_10.HorizontalAlignment = 'center';
      app.EditField_10.Layout.Row = 3;
      app.EditField_10.Layout.Column = 2;
      app.EditField_10.Value = '0.000';

      % Create EditField_11
      app.EditField_11 = uieditfield(app.GridLayout2, 'text');
      app.EditField_11.HorizontalAlignment = 'center';
      app.EditField_11.Layout.Row = 3;
      app.EditField_11.Layout.Column = 3;
      app.EditField_11.Value = '0.000';

      % Create EditField_12
      app.EditField_12 = uieditfield(app.GridLayout2, 'text');
      app.EditField_12.HorizontalAlignment = 'center';
      app.EditField_12.Layout.Row = 3;
      app.EditField_12.Layout.Column = 4;
      app.EditField_12.Value = '0.000';

      % Create EditField_13
      app.EditField_13 = uieditfield(app.GridLayout2, 'text');
      app.EditField_13.HorizontalAlignment = 'center';
      app.EditField_13.Layout.Row = 3;
      app.EditField_13.Layout.Column = 5;
      app.EditField_13.Value = '0.000';

      % Create EditField_14
      app.EditField_14 = uieditfield(app.GridLayout2, 'text');
      app.EditField_14.HorizontalAlignment = 'center';
      app.EditField_14.Layout.Row = 3;
      app.EditField_14.Layout.Column = 6;
      app.EditField_14.Value = '0.000';

      % Create EditField_15
      app.EditField_15 = uieditfield(app.GridLayout2, 'text');
      app.EditField_15.HorizontalAlignment = 'center';
      app.EditField_15.Layout.Row = 3;
      app.EditField_15.Layout.Column = 7;
      app.EditField_15.Value = '0.000';

      % Create EditField_16
      app.EditField_16 = uieditfield(app.GridLayout2, 'text');
      app.EditField_16.HorizontalAlignment = 'center';
      app.EditField_16.Layout.Row = 3;
      app.EditField_16.Layout.Column = 8;
      app.EditField_16.Value = '0.000';

      % Create EditField_17
      app.EditField_17 = uieditfield(app.GridLayout2, 'text');
      app.EditField_17.HorizontalAlignment = 'center';
      app.EditField_17.Layout.Row = 3;
      app.EditField_17.Layout.Column = 9;
      app.EditField_17.Value = '0.000';

      % Create EditField_18
      app.EditField_18 = uieditfield(app.GridLayout2, 'text');
      app.EditField_18.HorizontalAlignment = 'center';
      app.EditField_18.Layout.Row = 3;
      app.EditField_18.Layout.Column = 10;
      app.EditField_18.Value = '0.000';

      % Create EditField_19
      app.EditField_19 = uieditfield(app.GridLayout2, 'text');
      app.EditField_19.HorizontalAlignment = 'center';
      app.EditField_19.Layout.Row = 4;
      app.EditField_19.Layout.Column = 1;
      app.EditField_19.Value = '0.000';

      % Create EditField_20
      app.EditField_20 = uieditfield(app.GridLayout2, 'text');
      app.EditField_20.HorizontalAlignment = 'center';
      app.EditField_20.Layout.Row = 4;
      app.EditField_20.Layout.Column = 2;
      app.EditField_20.Value = '0.000';

      % Create EditField_21
      app.EditField_21 = uieditfield(app.GridLayout2, 'text');
      app.EditField_21.HorizontalAlignment = 'center';
      app.EditField_21.Layout.Row = 4;
      app.EditField_21.Layout.Column = 3;
      app.EditField_21.Value = '0.000';

      % Create EditField_22
      app.EditField_22 = uieditfield(app.GridLayout2, 'text');
      app.EditField_22.HorizontalAlignment = 'center';
      app.EditField_22.Layout.Row = 4;
      app.EditField_22.Layout.Column = 4;
      app.EditField_22.Value = '0.000';

      % Create EditField_23
      app.EditField_23 = uieditfield(app.GridLayout2, 'text');
      app.EditField_23.HorizontalAlignment = 'center';
      app.EditField_23.Layout.Row = 4;
      app.EditField_23.Layout.Column = 5;
      app.EditField_23.Value = '0.000';

      % Create EditField_24
      app.EditField_24 = uieditfield(app.GridLayout2, 'text');
      app.EditField_24.HorizontalAlignment = 'center';
      app.EditField_24.Layout.Row = 4;
      app.EditField_24.Layout.Column = 6;
      app.EditField_24.Value = '0.000';

      % Create EditField_25
      app.EditField_25 = uieditfield(app.GridLayout2, 'text');
      app.EditField_25.HorizontalAlignment = 'center';
      app.EditField_25.Layout.Row = 4;
      app.EditField_25.Layout.Column = 7;
      app.EditField_25.Value = '0.000';

      % Create EditField_26
      app.EditField_26 = uieditfield(app.GridLayout2, 'text');
      app.EditField_26.HorizontalAlignment = 'center';
      app.EditField_26.Layout.Row = 4;
      app.EditField_26.Layout.Column = 8;
      app.EditField_26.Value = '0.000';

      % Create EditField_27
      app.EditField_27 = uieditfield(app.GridLayout2, 'text');
      app.EditField_27.HorizontalAlignment = 'center';
      app.EditField_27.Layout.Row = 4;
      app.EditField_27.Layout.Column = 9;
      app.EditField_27.Value = '0.000';

      % Create EditField_28
      app.EditField_28 = uieditfield(app.GridLayout2, 'text');
      app.EditField_28.HorizontalAlignment = 'center';
      app.EditField_28.Layout.Row = 4;
      app.EditField_28.Layout.Column = 10;
      app.EditField_28.Value = '0.000';

      % Create EditField_29
      app.EditField_29 = uieditfield(app.GridLayout2, 'text');
      app.EditField_29.HorizontalAlignment = 'center';
      app.EditField_29.BackgroundColor = [0 0 0];
      app.EditField_29.Layout.Row = 5;
      app.EditField_29.Layout.Column = 1;
      app.EditField_29.Value = '0.000';

      % Create EditField_30
      app.EditField_30 = uieditfield(app.GridLayout2, 'text');
      app.EditField_30.HorizontalAlignment = 'center';
      app.EditField_30.BackgroundColor = [0 0 0];
      app.EditField_30.Layout.Row = 5;
      app.EditField_30.Layout.Column = 2;
      app.EditField_30.Value = '0.000';

      % Create EditField_31
      app.EditField_31 = uieditfield(app.GridLayout2, 'text');
      app.EditField_31.HorizontalAlignment = 'center';
      app.EditField_31.Layout.Row = 5;
      app.EditField_31.Layout.Column = 3;
      app.EditField_31.Value = '0.000';

      % Create EditField_32
      app.EditField_32 = uieditfield(app.GridLayout2, 'text');
      app.EditField_32.HorizontalAlignment = 'center';
      app.EditField_32.Layout.Row = 5;
      app.EditField_32.Layout.Column = 4;
      app.EditField_32.Value = '0.000';

      % Create EditField_33
      app.EditField_33 = uieditfield(app.GridLayout2, 'text');
      app.EditField_33.HorizontalAlignment = 'center';
      app.EditField_33.Layout.Row = 5;
      app.EditField_33.Layout.Column = 5;
      app.EditField_33.Value = '0.000';

      % Create EditField_34
      app.EditField_34 = uieditfield(app.GridLayout2, 'text');
      app.EditField_34.HorizontalAlignment = 'center';
      app.EditField_34.Layout.Row = 5;
      app.EditField_34.Layout.Column = 6;
      app.EditField_34.Value = '0.000';

      % Create EditField_35
      app.EditField_35 = uieditfield(app.GridLayout2, 'text');
      app.EditField_35.HorizontalAlignment = 'center';
      app.EditField_35.Layout.Row = 5;
      app.EditField_35.Layout.Column = 7;
      app.EditField_35.Value = '0.000';

      % Create EditField_36
      app.EditField_36 = uieditfield(app.GridLayout2, 'text');
      app.EditField_36.HorizontalAlignment = 'center';
      app.EditField_36.Layout.Row = 5;
      app.EditField_36.Layout.Column = 8;
      app.EditField_36.Value = '0.000';

      % Create EditField_37
      app.EditField_37 = uieditfield(app.GridLayout2, 'text');
      app.EditField_37.HorizontalAlignment = 'center';
      app.EditField_37.Layout.Row = 5;
      app.EditField_37.Layout.Column = 9;
      app.EditField_37.Value = '0.000';

      % Create EditField_38
      app.EditField_38 = uieditfield(app.GridLayout2, 'text');
      app.EditField_38.HorizontalAlignment = 'center';
      app.EditField_38.Layout.Row = 5;
      app.EditField_38.Layout.Column = 10;
      app.EditField_38.Value = '0.000';

      % Create EditField_39
      app.EditField_39 = uieditfield(app.GridLayout2, 'text');
      app.EditField_39.HorizontalAlignment = 'center';
      app.EditField_39.BackgroundColor = [0 0 0];
      app.EditField_39.Layout.Row = 6;
      app.EditField_39.Layout.Column = 1;
      app.EditField_39.Value = '0.000';

      % Create EditField_40
      app.EditField_40 = uieditfield(app.GridLayout2, 'text');
      app.EditField_40.HorizontalAlignment = 'center';
      app.EditField_40.Layout.Row = 6;
      app.EditField_40.Layout.Column = 2;
      app.EditField_40.Value = '0.000';

      % Create EditField_41
      app.EditField_41 = uieditfield(app.GridLayout2, 'text');
      app.EditField_41.HorizontalAlignment = 'center';
      app.EditField_41.Layout.Row = 6;
      app.EditField_41.Layout.Column = 3;
      app.EditField_41.Value = '0.000';

      % Create EditField_42
      app.EditField_42 = uieditfield(app.GridLayout2, 'text');
      app.EditField_42.HorizontalAlignment = 'center';
      app.EditField_42.Layout.Row = 6;
      app.EditField_42.Layout.Column = 4;
      app.EditField_42.Value = '0.000';

      % Create EditField_43
      app.EditField_43 = uieditfield(app.GridLayout2, 'text');
      app.EditField_43.HorizontalAlignment = 'center';
      app.EditField_43.Layout.Row = 6;
      app.EditField_43.Layout.Column = 5;
      app.EditField_43.Value = '0.000';

      % Create EditField_44
      app.EditField_44 = uieditfield(app.GridLayout2, 'text');
      app.EditField_44.HorizontalAlignment = 'center';
      app.EditField_44.Layout.Row = 6;
      app.EditField_44.Layout.Column = 6;
      app.EditField_44.Value = '0.000';

      % Create EditField_45
      app.EditField_45 = uieditfield(app.GridLayout2, 'text');
      app.EditField_45.HorizontalAlignment = 'center';
      app.EditField_45.Layout.Row = 6;
      app.EditField_45.Layout.Column = 7;
      app.EditField_45.Value = '0.000';

      % Create EditField_46
      app.EditField_46 = uieditfield(app.GridLayout2, 'text');
      app.EditField_46.HorizontalAlignment = 'center';
      app.EditField_46.Layout.Row = 6;
      app.EditField_46.Layout.Column = 8;
      app.EditField_46.Value = '0.000';

      % Create EditField_47
      app.EditField_47 = uieditfield(app.GridLayout2, 'text');
      app.EditField_47.HorizontalAlignment = 'center';
      app.EditField_47.Layout.Row = 6;
      app.EditField_47.Layout.Column = 9;
      app.EditField_47.Value = '0.000';

      % Create EditField_48
      app.EditField_48 = uieditfield(app.GridLayout2, 'text');
      app.EditField_48.HorizontalAlignment = 'center';
      app.EditField_48.Layout.Row = 6;
      app.EditField_48.Layout.Column = 10;
      app.EditField_48.Value = '0.000';

      % Create EditField_49
      app.EditField_49 = uieditfield(app.GridLayout2, 'text');
      app.EditField_49.HorizontalAlignment = 'center';
      app.EditField_49.BackgroundColor = [0 0 0];
      app.EditField_49.Layout.Row = 7;
      app.EditField_49.Layout.Column = 1;
      app.EditField_49.Value = '0.000';

      % Create EditField_50
      app.EditField_50 = uieditfield(app.GridLayout2, 'text');
      app.EditField_50.HorizontalAlignment = 'center';
      app.EditField_50.Layout.Row = 7;
      app.EditField_50.Layout.Column = 2;
      app.EditField_50.Value = '0.000';

      % Create EditField_51
      app.EditField_51 = uieditfield(app.GridLayout2, 'text');
      app.EditField_51.HorizontalAlignment = 'center';
      app.EditField_51.Layout.Row = 7;
      app.EditField_51.Layout.Column = 3;
      app.EditField_51.Value = '0.000';

      % Create EditField_52
      app.EditField_52 = uieditfield(app.GridLayout2, 'text');
      app.EditField_52.HorizontalAlignment = 'center';
      app.EditField_52.Layout.Row = 7;
      app.EditField_52.Layout.Column = 4;
      app.EditField_52.Value = '0.000';

      % Create EditField_53
      app.EditField_53 = uieditfield(app.GridLayout2, 'text');
      app.EditField_53.HorizontalAlignment = 'center';
      app.EditField_53.Layout.Row = 7;
      app.EditField_53.Layout.Column = 5;
      app.EditField_53.Value = '0.000';

      % Create EditField_54
      app.EditField_54 = uieditfield(app.GridLayout2, 'text');
      app.EditField_54.HorizontalAlignment = 'center';
      app.EditField_54.Layout.Row = 7;
      app.EditField_54.Layout.Column = 6;
      app.EditField_54.Value = '0.000';

      % Create EditField_55
      app.EditField_55 = uieditfield(app.GridLayout2, 'text');
      app.EditField_55.HorizontalAlignment = 'center';
      app.EditField_55.Layout.Row = 7;
      app.EditField_55.Layout.Column = 7;
      app.EditField_55.Value = '0.000';

      % Create EditField_56
      app.EditField_56 = uieditfield(app.GridLayout2, 'text');
      app.EditField_56.HorizontalAlignment = 'center';
      app.EditField_56.Layout.Row = 7;
      app.EditField_56.Layout.Column = 8;
      app.EditField_56.Value = '0.000';

      % Create EditField_57
      app.EditField_57 = uieditfield(app.GridLayout2, 'text');
      app.EditField_57.HorizontalAlignment = 'center';
      app.EditField_57.Layout.Row = 7;
      app.EditField_57.Layout.Column = 9;
      app.EditField_57.Value = '0.000';

      % Create EditField_58
      app.EditField_58 = uieditfield(app.GridLayout2, 'text');
      app.EditField_58.HorizontalAlignment = 'center';
      app.EditField_58.Layout.Row = 7;
      app.EditField_58.Layout.Column = 10;
      app.EditField_58.Value = '0.000';

      % Create EditField_59
      app.EditField_59 = uieditfield(app.GridLayout2, 'text');
      app.EditField_59.HorizontalAlignment = 'center';
      app.EditField_59.BackgroundColor = [0 0 0];
      app.EditField_59.Layout.Row = 8;
      app.EditField_59.Layout.Column = 1;
      app.EditField_59.Value = '0.000';

      % Create EditField_60
      app.EditField_60 = uieditfield(app.GridLayout2, 'text');
      app.EditField_60.HorizontalAlignment = 'center';
      app.EditField_60.Layout.Row = 8;
      app.EditField_60.Layout.Column = 2;
      app.EditField_60.Value = '0.000';

      % Create EditField_61
      app.EditField_61 = uieditfield(app.GridLayout2, 'text');
      app.EditField_61.HorizontalAlignment = 'center';
      app.EditField_61.Layout.Row = 8;
      app.EditField_61.Layout.Column = 3;
      app.EditField_61.Value = '0.000';

      % Create EditField_62
      app.EditField_62 = uieditfield(app.GridLayout2, 'text');
      app.EditField_62.HorizontalAlignment = 'center';
      app.EditField_62.Layout.Row = 8;
      app.EditField_62.Layout.Column = 4;
      app.EditField_62.Value = '0.000';

      % Create EditField_63
      app.EditField_63 = uieditfield(app.GridLayout2, 'text');
      app.EditField_63.HorizontalAlignment = 'center';
      app.EditField_63.Layout.Row = 8;
      app.EditField_63.Layout.Column = 5;
      app.EditField_63.Value = '0.000';

      % Create EditField_64
      app.EditField_64 = uieditfield(app.GridLayout2, 'text');
      app.EditField_64.HorizontalAlignment = 'center';
      app.EditField_64.Layout.Row = 8;
      app.EditField_64.Layout.Column = 6;
      app.EditField_64.Value = '0.000';

      % Create EditField_65
      app.EditField_65 = uieditfield(app.GridLayout2, 'text');
      app.EditField_65.HorizontalAlignment = 'center';
      app.EditField_65.Layout.Row = 8;
      app.EditField_65.Layout.Column = 7;
      app.EditField_65.Value = '0.000';

      % Create EditField_66
      app.EditField_66 = uieditfield(app.GridLayout2, 'text');
      app.EditField_66.HorizontalAlignment = 'center';
      app.EditField_66.Layout.Row = 8;
      app.EditField_66.Layout.Column = 8;
      app.EditField_66.Value = '0.000';

      % Create EditField_67
      app.EditField_67 = uieditfield(app.GridLayout2, 'text');
      app.EditField_67.HorizontalAlignment = 'center';
      app.EditField_67.Layout.Row = 8;
      app.EditField_67.Layout.Column = 9;
      app.EditField_67.Value = '0.000';

      % Create EditField_68
      app.EditField_68 = uieditfield(app.GridLayout2, 'text');
      app.EditField_68.HorizontalAlignment = 'center';
      app.EditField_68.Layout.Row = 8;
      app.EditField_68.Layout.Column = 10;
      app.EditField_68.Value = '0.000';

      % Create EditField_69
      app.EditField_69 = uieditfield(app.GridLayout2, 'text');
      app.EditField_69.HorizontalAlignment = 'center';
      app.EditField_69.BackgroundColor = [0 0 0];
      app.EditField_69.Layout.Row = 9;
      app.EditField_69.Layout.Column = 1;
      app.EditField_69.Value = '0.000';

      % Create EditField_70
      app.EditField_70 = uieditfield(app.GridLayout2, 'text');
      app.EditField_70.HorizontalAlignment = 'center';
      app.EditField_70.Layout.Row = 9;
      app.EditField_70.Layout.Column = 2;
      app.EditField_70.Value = '0.000';

      % Create EditField_71
      app.EditField_71 = uieditfield(app.GridLayout2, 'text');
      app.EditField_71.HorizontalAlignment = 'center';
      app.EditField_71.Layout.Row = 9;
      app.EditField_71.Layout.Column = 3;
      app.EditField_71.Value = '0.000';

      % Create EditField_72
      app.EditField_72 = uieditfield(app.GridLayout2, 'text');
      app.EditField_72.HorizontalAlignment = 'center';
      app.EditField_72.Layout.Row = 9;
      app.EditField_72.Layout.Column = 4;
      app.EditField_72.Value = '0.000';

      % Create EditField_73
      app.EditField_73 = uieditfield(app.GridLayout2, 'text');
      app.EditField_73.HorizontalAlignment = 'center';
      app.EditField_73.BackgroundColor = [0 0 0];
      app.EditField_73.Layout.Row = 9;
      app.EditField_73.Layout.Column = 5;
      app.EditField_73.Value = '0.000';

      % Create EditField_74
      app.EditField_74 = uieditfield(app.GridLayout2, 'text');
      app.EditField_74.HorizontalAlignment = 'center';
      app.EditField_74.Layout.Row = 9;
      app.EditField_74.Layout.Column = 6;
      app.EditField_74.Value = '0.000';

      % Create EditField_75
      app.EditField_75 = uieditfield(app.GridLayout2, 'text');
      app.EditField_75.HorizontalAlignment = 'center';
      app.EditField_75.Layout.Row = 9;
      app.EditField_75.Layout.Column = 7;
      app.EditField_75.Value = '0.000';

      % Create EditField_76
      app.EditField_76 = uieditfield(app.GridLayout2, 'text');
      app.EditField_76.HorizontalAlignment = 'center';
      app.EditField_76.Layout.Row = 9;
      app.EditField_76.Layout.Column = 8;
      app.EditField_76.Value = '0.000';

      % Create EditField_77
      app.EditField_77 = uieditfield(app.GridLayout2, 'text');
      app.EditField_77.HorizontalAlignment = 'center';
      app.EditField_77.Layout.Row = 9;
      app.EditField_77.Layout.Column = 9;
      app.EditField_77.Value = '0.000';

      % Create EditField_78
      app.EditField_78 = uieditfield(app.GridLayout2, 'text');
      app.EditField_78.HorizontalAlignment = 'center';
      app.EditField_78.BackgroundColor = [0 0 0];
      app.EditField_78.Layout.Row = 9;
      app.EditField_78.Layout.Column = 10;
      app.EditField_78.Value = '0.000';

      % Create EditField_79
      app.EditField_79 = uieditfield(app.GridLayout2, 'text');
      app.EditField_79.HorizontalAlignment = 'center';
      app.EditField_79.BackgroundColor = [0 0 0];
      app.EditField_79.Layout.Row = 10;
      app.EditField_79.Layout.Column = 1;
      app.EditField_79.Value = '0.000';

      % Create EditField_80
      app.EditField_80 = uieditfield(app.GridLayout2, 'text');
      app.EditField_80.HorizontalAlignment = 'center';
      app.EditField_80.Layout.Row = 10;
      app.EditField_80.Layout.Column = 2;
      app.EditField_80.Value = '0.000';

      % Create EditField_81
      app.EditField_81 = uieditfield(app.GridLayout2, 'text');
      app.EditField_81.HorizontalAlignment = 'center';
      app.EditField_81.Layout.Row = 10;
      app.EditField_81.Layout.Column = 3;
      app.EditField_81.Value = '0.000';

      % Create EditField_82
      app.EditField_82 = uieditfield(app.GridLayout2, 'text');
      app.EditField_82.HorizontalAlignment = 'center';
      app.EditField_82.Layout.Row = 10;
      app.EditField_82.Layout.Column = 4;
      app.EditField_82.Value = '0.000';

      % Create EditField_83
      app.EditField_83 = uieditfield(app.GridLayout2, 'text');
      app.EditField_83.HorizontalAlignment = 'center';
      app.EditField_83.BackgroundColor = [0 0 0];
      app.EditField_83.Layout.Row = 10;
      app.EditField_83.Layout.Column = 5;
      app.EditField_83.Value = '0.000';

      % Create EditField_84
      app.EditField_84 = uieditfield(app.GridLayout2, 'text');
      app.EditField_84.HorizontalAlignment = 'center';
      app.EditField_84.Layout.Row = 10;
      app.EditField_84.Layout.Column = 6;
      app.EditField_84.Value = '0.000';

      % Create EditField_85
      app.EditField_85 = uieditfield(app.GridLayout2, 'text');
      app.EditField_85.HorizontalAlignment = 'center';
      app.EditField_85.Layout.Row = 10;
      app.EditField_85.Layout.Column = 7;
      app.EditField_85.Value = '0.000';

      % Create EditField_86
      app.EditField_86 = uieditfield(app.GridLayout2, 'text');
      app.EditField_86.HorizontalAlignment = 'center';
      app.EditField_86.Layout.Row = 10;
      app.EditField_86.Layout.Column = 8;
      app.EditField_86.Value = '0.000';

      % Create EditField_87
      app.EditField_87 = uieditfield(app.GridLayout2, 'text');
      app.EditField_87.HorizontalAlignment = 'center';
      app.EditField_87.Layout.Row = 10;
      app.EditField_87.Layout.Column = 9;
      app.EditField_87.Value = '0.000';

      % Create EditField_88
      app.EditField_88 = uieditfield(app.GridLayout2, 'text');
      app.EditField_88.HorizontalAlignment = 'center';
      app.EditField_88.BackgroundColor = [0 0 0];
      app.EditField_88.Layout.Row = 10;
      app.EditField_88.Layout.Column = 10;
      app.EditField_88.Value = '0.000';

      % Create KlysPhaseTab
      app.KlysPhaseTab = uitab(app.TabGroup2);
      app.KlysPhaseTab.Title = 'Klys Phase';

      % Create GridLayout2_2
      app.GridLayout2_2 = uigridlayout(app.KlysPhaseTab);
      app.GridLayout2_2.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
      app.GridLayout2_2.RowHeight = {'1x', 22, '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};

      % Create Label_11
      app.Label_11 = uilabel(app.GridLayout2_2);
      app.Label_11.HorizontalAlignment = 'center';
      app.Label_11.FontSize = 16;
      app.Label_11.FontWeight = 'bold';
      app.Label_11.Layout.Row = 2;
      app.Label_11.Layout.Column = 10;
      app.Label_11.Text = '19';

      % Create Label_12
      app.Label_12 = uilabel(app.GridLayout2_2);
      app.Label_12.HorizontalAlignment = 'center';
      app.Label_12.FontSize = 16;
      app.Label_12.FontWeight = 'bold';
      app.Label_12.Layout.Row = 2;
      app.Label_12.Layout.Column = 9;
      app.Label_12.Text = '18';

      % Create Label_13
      app.Label_13 = uilabel(app.GridLayout2_2);
      app.Label_13.HorizontalAlignment = 'center';
      app.Label_13.FontSize = 16;
      app.Label_13.FontWeight = 'bold';
      app.Label_13.Layout.Row = 2;
      app.Label_13.Layout.Column = 8;
      app.Label_13.Text = '17';

      % Create Label_14
      app.Label_14 = uilabel(app.GridLayout2_2);
      app.Label_14.HorizontalAlignment = 'center';
      app.Label_14.FontSize = 16;
      app.Label_14.FontWeight = 'bold';
      app.Label_14.Layout.Row = 2;
      app.Label_14.Layout.Column = 7;
      app.Label_14.Text = '16';

      % Create Label_15
      app.Label_15 = uilabel(app.GridLayout2_2);
      app.Label_15.HorizontalAlignment = 'center';
      app.Label_15.FontSize = 16;
      app.Label_15.FontWeight = 'bold';
      app.Label_15.Layout.Row = 2;
      app.Label_15.Layout.Column = 6;
      app.Label_15.Text = '15';

      % Create Label_16
      app.Label_16 = uilabel(app.GridLayout2_2);
      app.Label_16.HorizontalAlignment = 'center';
      app.Label_16.FontSize = 16;
      app.Label_16.FontWeight = 'bold';
      app.Label_16.Layout.Row = 2;
      app.Label_16.Layout.Column = 5;
      app.Label_16.Text = '14';

      % Create Label_17
      app.Label_17 = uilabel(app.GridLayout2_2);
      app.Label_17.HorizontalAlignment = 'center';
      app.Label_17.FontSize = 16;
      app.Label_17.FontWeight = 'bold';
      app.Label_17.Layout.Row = 2;
      app.Label_17.Layout.Column = 4;
      app.Label_17.Text = '13';

      % Create Label_18
      app.Label_18 = uilabel(app.GridLayout2_2);
      app.Label_18.HorizontalAlignment = 'center';
      app.Label_18.FontSize = 16;
      app.Label_18.FontWeight = 'bold';
      app.Label_18.Layout.Row = 2;
      app.Label_18.Layout.Column = 3;
      app.Label_18.Text = '12';

      % Create Label_19
      app.Label_19 = uilabel(app.GridLayout2_2);
      app.Label_19.HorizontalAlignment = 'center';
      app.Label_19.FontSize = 16;
      app.Label_19.FontWeight = 'bold';
      app.Label_19.Layout.Row = 2;
      app.Label_19.Layout.Column = 2;
      app.Label_19.Text = '11';

      % Create Label_20
      app.Label_20 = uilabel(app.GridLayout2_2);
      app.Label_20.HorizontalAlignment = 'center';
      app.Label_20.FontSize = 16;
      app.Label_20.FontWeight = 'bold';
      app.Label_20.Layout.Row = 2;
      app.Label_20.Layout.Column = 1;
      app.Label_20.Text = '10';

      % Create L0Label_3
      app.L0Label_3 = uilabel(app.GridLayout2_2);
      app.L0Label_3.BackgroundColor = [1 1 0.0667];
      app.L0Label_3.HorizontalAlignment = 'center';
      app.L0Label_3.FontSize = 16;
      app.L0Label_3.FontWeight = 'bold';
      app.L0Label_3.Layout.Row = 1;
      app.L0Label_3.Layout.Column = 1;
      app.L0Label_3.Text = 'L0';

      % Create L1L2Label_2
      app.L1L2Label_2 = uilabel(app.GridLayout2_2);
      app.L1L2Label_2.BackgroundColor = [1 1 0.0667];
      app.L1L2Label_2.HorizontalAlignment = 'center';
      app.L1L2Label_2.FontSize = 16;
      app.L1L2Label_2.FontWeight = 'bold';
      app.L1L2Label_2.Layout.Row = 1;
      app.L1L2Label_2.Layout.Column = [2 5];
      app.L1L2Label_2.Text = 'L1 / L2';

      % Create L3Label_4
      app.L3Label_4 = uilabel(app.GridLayout2_2);
      app.L3Label_4.BackgroundColor = [1 1 0.0667];
      app.L3Label_4.HorizontalAlignment = 'center';
      app.L3Label_4.FontSize = 16;
      app.L3Label_4.FontWeight = 'bold';
      app.L3Label_4.Layout.Row = 1;
      app.L3Label_4.Layout.Column = [6 10];
      app.L3Label_4.Text = 'L3';

      % Create EditField_89
      app.EditField_89 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_89.HorizontalAlignment = 'center';
      app.EditField_89.Layout.Row = 3;
      app.EditField_89.Layout.Column = 1;
      app.EditField_89.Value = '0.000';

      % Create EditField_90
      app.EditField_90 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_90.HorizontalAlignment = 'center';
      app.EditField_90.Layout.Row = 3;
      app.EditField_90.Layout.Column = 2;
      app.EditField_90.Value = '0.000';

      % Create EditField_91
      app.EditField_91 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_91.HorizontalAlignment = 'center';
      app.EditField_91.Layout.Row = 3;
      app.EditField_91.Layout.Column = 3;
      app.EditField_91.Value = '0.000';

      % Create EditField_92
      app.EditField_92 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_92.HorizontalAlignment = 'center';
      app.EditField_92.Layout.Row = 3;
      app.EditField_92.Layout.Column = 4;
      app.EditField_92.Value = '0.000';

      % Create EditField_93
      app.EditField_93 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_93.HorizontalAlignment = 'center';
      app.EditField_93.Layout.Row = 3;
      app.EditField_93.Layout.Column = 5;
      app.EditField_93.Value = '0.000';

      % Create EditField_94
      app.EditField_94 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_94.HorizontalAlignment = 'center';
      app.EditField_94.Layout.Row = 3;
      app.EditField_94.Layout.Column = 6;
      app.EditField_94.Value = '0.000';

      % Create EditField_95
      app.EditField_95 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_95.HorizontalAlignment = 'center';
      app.EditField_95.Layout.Row = 3;
      app.EditField_95.Layout.Column = 7;
      app.EditField_95.Value = '0.000';

      % Create EditField_96
      app.EditField_96 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_96.HorizontalAlignment = 'center';
      app.EditField_96.Layout.Row = 3;
      app.EditField_96.Layout.Column = 8;
      app.EditField_96.Value = '0.000';

      % Create EditField_97
      app.EditField_97 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_97.HorizontalAlignment = 'center';
      app.EditField_97.Layout.Row = 3;
      app.EditField_97.Layout.Column = 9;
      app.EditField_97.Value = '0.000';

      % Create EditField_98
      app.EditField_98 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_98.HorizontalAlignment = 'center';
      app.EditField_98.Layout.Row = 3;
      app.EditField_98.Layout.Column = 10;
      app.EditField_98.Value = '0.000';

      % Create EditField_99
      app.EditField_99 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_99.HorizontalAlignment = 'center';
      app.EditField_99.Layout.Row = 4;
      app.EditField_99.Layout.Column = 1;
      app.EditField_99.Value = '0.000';

      % Create EditField_100
      app.EditField_100 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_100.HorizontalAlignment = 'center';
      app.EditField_100.Layout.Row = 4;
      app.EditField_100.Layout.Column = 2;
      app.EditField_100.Value = '0.000';

      % Create EditField_101
      app.EditField_101 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_101.HorizontalAlignment = 'center';
      app.EditField_101.Layout.Row = 4;
      app.EditField_101.Layout.Column = 3;
      app.EditField_101.Value = '0.000';

      % Create EditField_102
      app.EditField_102 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_102.HorizontalAlignment = 'center';
      app.EditField_102.Layout.Row = 4;
      app.EditField_102.Layout.Column = 4;
      app.EditField_102.Value = '0.000';

      % Create EditField_103
      app.EditField_103 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_103.HorizontalAlignment = 'center';
      app.EditField_103.Layout.Row = 4;
      app.EditField_103.Layout.Column = 5;
      app.EditField_103.Value = '0.000';

      % Create EditField_104
      app.EditField_104 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_104.HorizontalAlignment = 'center';
      app.EditField_104.Layout.Row = 4;
      app.EditField_104.Layout.Column = 6;
      app.EditField_104.Value = '0.000';

      % Create EditField_105
      app.EditField_105 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_105.HorizontalAlignment = 'center';
      app.EditField_105.Layout.Row = 4;
      app.EditField_105.Layout.Column = 7;
      app.EditField_105.Value = '0.000';

      % Create EditField_106
      app.EditField_106 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_106.HorizontalAlignment = 'center';
      app.EditField_106.Layout.Row = 4;
      app.EditField_106.Layout.Column = 8;
      app.EditField_106.Value = '0.000';

      % Create EditField_107
      app.EditField_107 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_107.HorizontalAlignment = 'center';
      app.EditField_107.Layout.Row = 4;
      app.EditField_107.Layout.Column = 9;
      app.EditField_107.Value = '0.000';

      % Create EditField_108
      app.EditField_108 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_108.HorizontalAlignment = 'center';
      app.EditField_108.Layout.Row = 4;
      app.EditField_108.Layout.Column = 10;
      app.EditField_108.Value = '0.000';

      % Create EditField_109
      app.EditField_109 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_109.HorizontalAlignment = 'center';
      app.EditField_109.BackgroundColor = [0 0 0];
      app.EditField_109.Layout.Row = 5;
      app.EditField_109.Layout.Column = 1;
      app.EditField_109.Value = '0.000';

      % Create EditField_110
      app.EditField_110 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_110.HorizontalAlignment = 'center';
      app.EditField_110.BackgroundColor = [0 0 0];
      app.EditField_110.Layout.Row = 5;
      app.EditField_110.Layout.Column = 2;
      app.EditField_110.Value = '0.000';

      % Create EditField_111
      app.EditField_111 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_111.HorizontalAlignment = 'center';
      app.EditField_111.Layout.Row = 5;
      app.EditField_111.Layout.Column = 3;
      app.EditField_111.Value = '0.000';

      % Create EditField_112
      app.EditField_112 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_112.HorizontalAlignment = 'center';
      app.EditField_112.Layout.Row = 5;
      app.EditField_112.Layout.Column = 4;
      app.EditField_112.Value = '0.000';

      % Create EditField_113
      app.EditField_113 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_113.HorizontalAlignment = 'center';
      app.EditField_113.Layout.Row = 5;
      app.EditField_113.Layout.Column = 5;
      app.EditField_113.Value = '0.000';

      % Create EditField_114
      app.EditField_114 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_114.HorizontalAlignment = 'center';
      app.EditField_114.Layout.Row = 5;
      app.EditField_114.Layout.Column = 6;
      app.EditField_114.Value = '0.000';

      % Create EditField_115
      app.EditField_115 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_115.HorizontalAlignment = 'center';
      app.EditField_115.Layout.Row = 5;
      app.EditField_115.Layout.Column = 7;
      app.EditField_115.Value = '0.000';

      % Create EditField_116
      app.EditField_116 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_116.HorizontalAlignment = 'center';
      app.EditField_116.Layout.Row = 5;
      app.EditField_116.Layout.Column = 8;
      app.EditField_116.Value = '0.000';

      % Create EditField_117
      app.EditField_117 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_117.HorizontalAlignment = 'center';
      app.EditField_117.Layout.Row = 5;
      app.EditField_117.Layout.Column = 9;
      app.EditField_117.Value = '0.000';

      % Create EditField_118
      app.EditField_118 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_118.HorizontalAlignment = 'center';
      app.EditField_118.Layout.Row = 5;
      app.EditField_118.Layout.Column = 10;
      app.EditField_118.Value = '0.000';

      % Create EditField_119
      app.EditField_119 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_119.HorizontalAlignment = 'center';
      app.EditField_119.BackgroundColor = [0 0 0];
      app.EditField_119.Layout.Row = 6;
      app.EditField_119.Layout.Column = 1;
      app.EditField_119.Value = '0.000';

      % Create EditField_120
      app.EditField_120 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_120.HorizontalAlignment = 'center';
      app.EditField_120.Layout.Row = 6;
      app.EditField_120.Layout.Column = 2;
      app.EditField_120.Value = '0.000';

      % Create EditField_121
      app.EditField_121 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_121.HorizontalAlignment = 'center';
      app.EditField_121.Layout.Row = 6;
      app.EditField_121.Layout.Column = 3;
      app.EditField_121.Value = '0.000';

      % Create EditField_122
      app.EditField_122 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_122.HorizontalAlignment = 'center';
      app.EditField_122.Layout.Row = 6;
      app.EditField_122.Layout.Column = 4;
      app.EditField_122.Value = '0.000';

      % Create EditField_123
      app.EditField_123 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_123.HorizontalAlignment = 'center';
      app.EditField_123.Layout.Row = 6;
      app.EditField_123.Layout.Column = 5;
      app.EditField_123.Value = '0.000';

      % Create EditField_124
      app.EditField_124 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_124.HorizontalAlignment = 'center';
      app.EditField_124.Layout.Row = 6;
      app.EditField_124.Layout.Column = 6;
      app.EditField_124.Value = '0.000';

      % Create EditField_125
      app.EditField_125 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_125.HorizontalAlignment = 'center';
      app.EditField_125.Layout.Row = 6;
      app.EditField_125.Layout.Column = 7;
      app.EditField_125.Value = '0.000';

      % Create EditField_126
      app.EditField_126 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_126.HorizontalAlignment = 'center';
      app.EditField_126.Layout.Row = 6;
      app.EditField_126.Layout.Column = 8;
      app.EditField_126.Value = '0.000';

      % Create EditField_127
      app.EditField_127 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_127.HorizontalAlignment = 'center';
      app.EditField_127.Layout.Row = 6;
      app.EditField_127.Layout.Column = 9;
      app.EditField_127.Value = '0.000';

      % Create EditField_128
      app.EditField_128 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_128.HorizontalAlignment = 'center';
      app.EditField_128.Layout.Row = 6;
      app.EditField_128.Layout.Column = 10;
      app.EditField_128.Value = '0.000';

      % Create EditField_129
      app.EditField_129 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_129.HorizontalAlignment = 'center';
      app.EditField_129.BackgroundColor = [0 0 0];
      app.EditField_129.Layout.Row = 7;
      app.EditField_129.Layout.Column = 1;
      app.EditField_129.Value = '0.000';

      % Create EditField_130
      app.EditField_130 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_130.HorizontalAlignment = 'center';
      app.EditField_130.Layout.Row = 7;
      app.EditField_130.Layout.Column = 2;
      app.EditField_130.Value = '0.000';

      % Create EditField_131
      app.EditField_131 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_131.HorizontalAlignment = 'center';
      app.EditField_131.Layout.Row = 7;
      app.EditField_131.Layout.Column = 3;
      app.EditField_131.Value = '0.000';

      % Create EditField_132
      app.EditField_132 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_132.HorizontalAlignment = 'center';
      app.EditField_132.Layout.Row = 7;
      app.EditField_132.Layout.Column = 4;
      app.EditField_132.Value = '0.000';

      % Create EditField_133
      app.EditField_133 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_133.HorizontalAlignment = 'center';
      app.EditField_133.Layout.Row = 7;
      app.EditField_133.Layout.Column = 5;
      app.EditField_133.Value = '0.000';

      % Create EditField_134
      app.EditField_134 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_134.HorizontalAlignment = 'center';
      app.EditField_134.Layout.Row = 7;
      app.EditField_134.Layout.Column = 6;
      app.EditField_134.Value = '0.000';

      % Create EditField_135
      app.EditField_135 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_135.HorizontalAlignment = 'center';
      app.EditField_135.Layout.Row = 7;
      app.EditField_135.Layout.Column = 7;
      app.EditField_135.Value = '0.000';

      % Create EditField_136
      app.EditField_136 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_136.HorizontalAlignment = 'center';
      app.EditField_136.Layout.Row = 7;
      app.EditField_136.Layout.Column = 8;
      app.EditField_136.Value = '0.000';

      % Create EditField_137
      app.EditField_137 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_137.HorizontalAlignment = 'center';
      app.EditField_137.Layout.Row = 7;
      app.EditField_137.Layout.Column = 9;
      app.EditField_137.Value = '0.000';

      % Create EditField_138
      app.EditField_138 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_138.HorizontalAlignment = 'center';
      app.EditField_138.Layout.Row = 7;
      app.EditField_138.Layout.Column = 10;
      app.EditField_138.Value = '0.000';

      % Create EditField_139
      app.EditField_139 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_139.HorizontalAlignment = 'center';
      app.EditField_139.BackgroundColor = [0 0 0];
      app.EditField_139.Layout.Row = 8;
      app.EditField_139.Layout.Column = 1;
      app.EditField_139.Value = '0.000';

      % Create EditField_140
      app.EditField_140 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_140.HorizontalAlignment = 'center';
      app.EditField_140.Layout.Row = 8;
      app.EditField_140.Layout.Column = 2;
      app.EditField_140.Value = '0.000';

      % Create EditField_141
      app.EditField_141 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_141.HorizontalAlignment = 'center';
      app.EditField_141.Layout.Row = 8;
      app.EditField_141.Layout.Column = 3;
      app.EditField_141.Value = '0.000';

      % Create EditField_142
      app.EditField_142 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_142.HorizontalAlignment = 'center';
      app.EditField_142.Layout.Row = 8;
      app.EditField_142.Layout.Column = 4;
      app.EditField_142.Value = '0.000';

      % Create EditField_143
      app.EditField_143 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_143.HorizontalAlignment = 'center';
      app.EditField_143.Layout.Row = 8;
      app.EditField_143.Layout.Column = 5;
      app.EditField_143.Value = '0.000';

      % Create EditField_144
      app.EditField_144 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_144.HorizontalAlignment = 'center';
      app.EditField_144.Layout.Row = 8;
      app.EditField_144.Layout.Column = 6;
      app.EditField_144.Value = '0.000';

      % Create EditField_145
      app.EditField_145 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_145.HorizontalAlignment = 'center';
      app.EditField_145.Layout.Row = 8;
      app.EditField_145.Layout.Column = 7;
      app.EditField_145.Value = '0.000';

      % Create EditField_146
      app.EditField_146 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_146.HorizontalAlignment = 'center';
      app.EditField_146.Layout.Row = 8;
      app.EditField_146.Layout.Column = 8;
      app.EditField_146.Value = '0.000';

      % Create EditField_147
      app.EditField_147 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_147.HorizontalAlignment = 'center';
      app.EditField_147.Layout.Row = 8;
      app.EditField_147.Layout.Column = 9;
      app.EditField_147.Value = '0.000';

      % Create EditField_148
      app.EditField_148 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_148.HorizontalAlignment = 'center';
      app.EditField_148.Layout.Row = 8;
      app.EditField_148.Layout.Column = 10;
      app.EditField_148.Value = '0.000';

      % Create EditField_149
      app.EditField_149 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_149.HorizontalAlignment = 'center';
      app.EditField_149.BackgroundColor = [0 0 0];
      app.EditField_149.Layout.Row = 9;
      app.EditField_149.Layout.Column = 1;
      app.EditField_149.Value = '0.000';

      % Create EditField_150
      app.EditField_150 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_150.HorizontalAlignment = 'center';
      app.EditField_150.Layout.Row = 9;
      app.EditField_150.Layout.Column = 2;
      app.EditField_150.Value = '0.000';

      % Create EditField_151
      app.EditField_151 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_151.HorizontalAlignment = 'center';
      app.EditField_151.Layout.Row = 9;
      app.EditField_151.Layout.Column = 3;
      app.EditField_151.Value = '0.000';

      % Create EditField_152
      app.EditField_152 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_152.HorizontalAlignment = 'center';
      app.EditField_152.Layout.Row = 9;
      app.EditField_152.Layout.Column = 4;
      app.EditField_152.Value = '0.000';

      % Create EditField_153
      app.EditField_153 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_153.HorizontalAlignment = 'center';
      app.EditField_153.BackgroundColor = [0 0 0];
      app.EditField_153.Layout.Row = 9;
      app.EditField_153.Layout.Column = 5;
      app.EditField_153.Value = '0.000';

      % Create EditField_154
      app.EditField_154 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_154.HorizontalAlignment = 'center';
      app.EditField_154.Layout.Row = 9;
      app.EditField_154.Layout.Column = 6;
      app.EditField_154.Value = '0.000';

      % Create EditField_155
      app.EditField_155 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_155.HorizontalAlignment = 'center';
      app.EditField_155.Layout.Row = 9;
      app.EditField_155.Layout.Column = 7;
      app.EditField_155.Value = '0.000';

      % Create EditField_156
      app.EditField_156 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_156.HorizontalAlignment = 'center';
      app.EditField_156.Layout.Row = 9;
      app.EditField_156.Layout.Column = 8;
      app.EditField_156.Value = '0.000';

      % Create EditField_157
      app.EditField_157 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_157.HorizontalAlignment = 'center';
      app.EditField_157.Layout.Row = 9;
      app.EditField_157.Layout.Column = 9;
      app.EditField_157.Value = '0.000';

      % Create EditField_158
      app.EditField_158 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_158.HorizontalAlignment = 'center';
      app.EditField_158.BackgroundColor = [0 0 0];
      app.EditField_158.Layout.Row = 9;
      app.EditField_158.Layout.Column = 10;
      app.EditField_158.Value = '0.000';

      % Create EditField_159
      app.EditField_159 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_159.HorizontalAlignment = 'center';
      app.EditField_159.BackgroundColor = [0 0 0];
      app.EditField_159.Layout.Row = 10;
      app.EditField_159.Layout.Column = 1;
      app.EditField_159.Value = '0.000';

      % Create EditField_160
      app.EditField_160 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_160.HorizontalAlignment = 'center';
      app.EditField_160.Layout.Row = 10;
      app.EditField_160.Layout.Column = 2;
      app.EditField_160.Value = '0.000';

      % Create EditField_161
      app.EditField_161 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_161.HorizontalAlignment = 'center';
      app.EditField_161.Layout.Row = 10;
      app.EditField_161.Layout.Column = 3;
      app.EditField_161.Value = '0.000';

      % Create EditField_162
      app.EditField_162 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_162.HorizontalAlignment = 'center';
      app.EditField_162.Layout.Row = 10;
      app.EditField_162.Layout.Column = 4;
      app.EditField_162.Value = '0.000';

      % Create EditField_163
      app.EditField_163 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_163.HorizontalAlignment = 'center';
      app.EditField_163.BackgroundColor = [0 0 0];
      app.EditField_163.Layout.Row = 10;
      app.EditField_163.Layout.Column = 5;
      app.EditField_163.Value = '0.000';

      % Create EditField_164
      app.EditField_164 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_164.HorizontalAlignment = 'center';
      app.EditField_164.Layout.Row = 10;
      app.EditField_164.Layout.Column = 6;
      app.EditField_164.Value = '0.000';

      % Create EditField_165
      app.EditField_165 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_165.HorizontalAlignment = 'center';
      app.EditField_165.Layout.Row = 10;
      app.EditField_165.Layout.Column = 7;
      app.EditField_165.Value = '0.000';

      % Create EditField_166
      app.EditField_166 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_166.HorizontalAlignment = 'center';
      app.EditField_166.Layout.Row = 10;
      app.EditField_166.Layout.Column = 8;
      app.EditField_166.Value = '0.000';

      % Create EditField_167
      app.EditField_167 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_167.HorizontalAlignment = 'center';
      app.EditField_167.Layout.Row = 10;
      app.EditField_167.Layout.Column = 9;
      app.EditField_167.Value = '0.000';

      % Create EditField_168
      app.EditField_168 = uieditfield(app.GridLayout2_2, 'text');
      app.EditField_168.HorizontalAlignment = 'center';
      app.EditField_168.BackgroundColor = [0 0 0];
      app.EditField_168.Layout.Row = 10;
      app.EditField_168.Layout.Column = 10;
      app.EditField_168.Value = '0.000';

      % Create MagnetsTab
      app.MagnetsTab = uitab(app.TabGroup2);
      app.MagnetsTab.Title = 'Magnets';

      % Create MessagesTab
      app.MessagesTab = uitab(app.TabGroup2);
      app.MessagesTab.Title = 'Messages';

      % Create TextArea
      app.TextArea = uitextarea(app.MessagesTab);
      app.TextArea.Position = [1 44 757 340];

      % Create FileMenu
      app.FileMenu = uimenu(app.UIFigure);
      app.FileMenu.Text = 'File';

      % Create SaveasrefMenu
      app.SaveasrefMenu = uimenu(app.FileMenu);
      app.SaveasrefMenu.Text = 'Save as ref...';

      % Create HelpMenu
      app.HelpMenu = uimenu(app.UIFigure);
      app.HelpMenu.Text = 'Help';

      % Show the figure after all components are created
      app.UIFigure.Visible = 'on';
    end
  end

  % App creation and deletion
  methods (Access = public)

    % Construct app
    function app = F2_LEM_exported

      runningApp = getRunningApp(app);

      % Check for running singleton app
      if isempty(runningApp)

        % Create UIFigure and components
        createComponents(app)

        % Register the app with App Designer
        registerApp(app, app.UIFigure)
      else

        % Focus the running singleton app
        figure(runningApp.UIFigure)

        app = runningApp;
      end

      if nargout == 0
        clear app
      end
    end

    % Code that executes before app deletion
    function delete(app)

      % Delete UIFigure when app is deleted
      delete(app.UIFigure)
    end
  end
end