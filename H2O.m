% Water molecule (HOH)
%      H (atom 1)
%    /
%   O (atom 3) 
%    \
%      H (atoms 2)
 function new_data = H2O(Placed_atoms_num,data,atoms_XYZ)
 fprintf('\t# HOH molecules\n');
    %%%% ============= Setting coefficients of HOH molecule ===============
    atoms_num = 3;      % atoms number in a HOH molecule
    bonds_num = 2;
    angles_num = 1;
    dihedrals_num = 0;
    impropers_num = 0;
    atom_types = 2;     % atom types in a HOH molecule
    bond_types = 1;
    angle_types = 1;
    dihedral_types = 0;
    improper_types = 0;
    %   name | epsilon(KJ/mol) | sigma(A) | mass/m | charge/q
    pair_coeffs = { 'H' 0.0000  0.000    1.007940   0.417000  ;         % H
                    'O' 0.6502  3.169   15.999400  -0.834000  ;         % O
                     };
    bond_coeffs = { 'OH' 450   0.9572  ;                                % O-H
                     };
    angle_coeffs = { 'HOH' 55   104.52  ;                               % H-O-H
                      };
    dihedral_coeffs = { 
                         };
    improper_coeffs = { 
                         };
    % Molecular topology
    % atom ID | molecule ID | atoms type
    Atoms(1:atoms_num,1:3) = [1 1 1;    
                              2 1 1;
                              3 1 2;];
    % bond ID | bond type | atom1 ID | atom2 ID
    Bonds(1:bonds_num,1:4) = [1 1 1 3;    
                              2 1 2 3;];
    % angle ID | angle type | atom1 ID | atom2 ID | atom3 ID
    Angles(1:angles_num,1:5) = [1 1 1 3 2;];
    %%%% =============== Expanding the setting information ================
    % molecule numberplaced in data
    mol_num = Placed_atoms_num/atoms_num;
 fprintf('\t\t numbers: %d\n',mol_num);
 fprintf('\t\t molecule type: %d\n',data.mol.type + 1);
    %%%% Atoms information ------------------------------------------------
    for i = 2:mol_num
        Atoms((i-1)*atoms_num+1:(i)*atoms_num,1:3) = Atoms((i-2)*atoms_num+1:(i-1)*atoms_num,1:3);
        Atoms((i-1)*atoms_num+1:(i)*atoms_num,1) = Atoms((i-1)*atoms_num+1:(i)*atoms_num,1)+atoms_num;  % atom ID
        Atoms((i-1)*atoms_num+1:(i)*atoms_num,2) = Atoms((i-1)*atoms_num+1:(i)*atoms_num,2)+1;          % molecule ID
    end
    for i = 1:mol_num*atoms_num     
        Atoms(i,4) = pair_coeffs{Atoms(i,3),5};              % charge
    end
    Atoms(:,5:7) = atoms_XYZ;                                % atom coordinates
    Atoms;
    %%%% Bonds information ------------------------------------------------
    for i = 2:mol_num
        Bonds((i-1)*bonds_num+1:(i)*bonds_num,1:4) = Bonds((i-2)*bonds_num+1:(i-1)*bonds_num,1:4);
        Bonds((i-1)*bonds_num+1:(i)*bonds_num,1) = Bonds((i-1)*bonds_num+1:(i)*bonds_num,1)+bonds_num;    % bond ID
        Bonds((i-1)*bonds_num+1:(i)*bonds_num,3:4) = Bonds((i-1)*bonds_num+1:(i)*bonds_num,3:4)+atoms_num;% atoms ID
    end
    Bonds;
    %%%% Angles information -----------------------------------------------
    for i = 2:mol_num
        Angles((i-1)*angles_num+1:(i)*angles_num,1:5) = Angles((i-2)*angles_num+1:(i-1)*angles_num,1:5);
        Angles((i-1)*angles_num+1:(i)*angles_num,1) = Angles((i-1)*angles_num+1:(i)*angles_num,1)+angles_num;   % angle ID
        Angles((i-1)*angles_num+1:(i)*angles_num,3:5) = Angles((i-1)*angles_num+1:(i)*angles_num,3:5)+atoms_num;% atoms ID
    end
    Angles;
    %%%% Dihedrals information --------------------------------------------
    for i = 2:mol_num
        Dihedrals((i-1)*dihedrals_num+1:(i)*dihedrals_num,1:6) = Dihedrals((i-2)*dihedrals_num+1:(i-1)*dihedrals_num,1:6);
        Dihedrals((i-1)*dihedrals_num+1:(i)*dihedrals_num,1) = Dihedrals((i-1)*dihedrals_num+1:(i)*dihedrals_num,1)+dihedrals_num;   % angle ID
        Dihedrals((i-1)*dihedrals_num+1:(i)*dihedrals_num,3:6) = Dihedrals((i-1)*dihedrals_num+1:(i)*dihedrals_num,3:6)+atoms_num;% atoms ID
    end
    Dihedrals;
    %%%% Impropers information --------------------------------------------
    for i = 2:mol_num
        Impropers((i-1)*impropers_num+1:(i)*impropers_num,1:7) = Impropers((i-2)*impropers_num+1:(i-1)*impropers_num,1:7);
        Impropers((i-1)*impropers_num+1:(i)*impropers_num,1) = Impropers((i-1)*impropers_num+1:(i)*impropers_num,1)+impropers_num;   % angle ID
        Impropers((i-1)*impropers_num+1:(i)*impropers_num,3:7) = Impropers((i-1)*impropers_num+1:(i)*impropers_num,3:7)+atoms_num;% atoms ID
    end
    Impropers;
    %%%% ======================= Saving new data ==========================
    new_data = data;
    % numbers
    new_data.mol.num = new_data.mol.num + mol_num;                          % molecules
    new_data.mol.type = new_data.mol.type +1;                               % molecule types
    new_data.atom.num = new_data.atom.num + mol_num*atoms_num;              % atoms
    new_data.atom.type = new_data.atom.type + atom_types;                   % atom types
    new_data.bond.num = new_data.bond.num + mol_num*bonds_num;              % bonds
    new_data.bond.type = new_data.bond.type + bond_types;                   % bond types
    new_data.angle.num = new_data.angle.num + mol_num*angles_num;           % angles
    new_data.angle.type = new_data.angle.type + angle_types;                % angle types
    new_data.dihedral.num = new_data.dihedral.num + mol_num*dihedrals_num;  % dihedrals
    new_data.dihedral.type = new_data.dihedral.type + dihedral_types;       % dihedral types
    new_data.improper.num = new_data.improper.num + mol_num*impropers_num;  % impropers
    new_data.improper.type = new_data.improper.type + improper_types;       % improper types
    % coefficients
    for i=1:size(pair_coeffs,1)     % Pair_Coeffs
        new_data.Pair_Coeffs{i+new_data.atom.type-atom_types} = {pair_coeffs{i,1},pair_coeffs{i,2},pair_coeffs{i,3}};
    end
    for i=1:size(bond_coeffs,1)     % Bond_Coeffs
        new_data.Bond_Coeffs{i+new_data.bond.type-bond_types} = {bond_coeffs{i,1},bond_coeffs{i,2},bond_coeffs{i,3}};
    end
    for i=1:size(angle_coeffs,1)    % Angle_Coeffs
        new_data.Angle_Coeffs{i+new_data.angle.type-angle_types} = {angle_coeffs{i,1},angle_coeffs{i,2},angle_coeffs{i,3}};
    end
    for i=1:size(dihedral_coeffs,1) % Dihedral_Coeffs
        new_data.Dihedral_Coeffs{i+new_data.dihedral.type-dihedral_types} = {dihedral_coeffs{i,1},dihedral_coeffs{i,2},dihedral_coeffs{i,3},dihedral_coeffs{i,4},dihedral_coeffs{i,5},dihedral_coeffs{i,6}};
    end
    for i=1:size(improper_coeffs,1) % Improper_Coeffs
        new_data.Improper_Coeffs{i+new_data.improper.type-improper_types} = {improper_coeffs{i,1},improper_coeffs{i,2},improper_coeffs{i,3},improper_coeffs{i,4},improper_coeffs{i,5},improper_coeffs{i,6},improper_coeffs{i,7}};
    end
    for i=1:size(pair_coeffs,1)     % Masses
        new_data.Masses{i+new_data.atom.type-atom_types} = {pair_coeffs{i,1},pair_coeffs{i,4}};
    end
    % data
    new_data.Atoms =  [data.Atoms; Atoms;];             % Atoms
    new_data.Bonds =  [data.Bonds; Bonds;];             % Bonds
    new_data.Angles =  [data.Angles; Angles;];          % Angles
    new_data.Dihedrals =  [data.Dihedrals; Dihedrals;]; % Dihedral
    new_data.Impropers =  [data.Impropers; Impropers;]; % Improper
end