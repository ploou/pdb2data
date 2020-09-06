% Initialize Data Structure

function  data = InitializeData()
fprintf('Initializing data...\n');
    data.boundary = zeros(3,2);
    
    data.mol.num = 0;
    data.mol.type = 0;

    data.atom.num = 0;      % atom
    data.atom.type = 0;
    
    data.bond.num = 0;      % bond
    data.bond.type = 0;
    
    data.angle.num = 0;     % angle
    data.angle.type = 0;
    
    data.dihedral.num = 0;  % dihedral
    data.dihedral.type = 0;
    
    data.improper.num = 0;  % improper
    data.improper.type = 0;
    
    data.Masses = [];
    
    data.Pair_Coeffs = [];
    data.Bond_Coeffs = [];
    data.Angle_Coeffs = [];
    data.Dihedral_Coeffs = [];
    data.Improper_Coeffs = [];
    
    data.Atoms = [];
    data.Bonds =  [];
    data.Angles = [];
    data.Dihedrals = [];
    data.Impropers = [];
fprintf('\t data initialized successfully!\n');
end
