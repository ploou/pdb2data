% Template of New Molecule 

 function new_data = MolecularTemplate(Placed_atoms_num,data,atoms_XYZ)
 fprintf('\t# Template molecules\n');
    %%%% =========== Setting coefficients of the new molecule =============
    atoms_num = 0;      % atoms number in the new molecule
    bonds_num = 0;
    angles_num = 0;
    dihedrals_num = 0;
    impropers_num = 0;
    atom_types = 0;     % atom types in the new molecule
    bond_types = 0;
    angle_types = 0;
    dihedral_types = 0;
    improper_types = 0;
    % Force field 
    pair_coeffs = { 'AtomName'  1 2 3 4; % AtomName | epsilon(KJ/mol) | sigma(A) | mass/m | charge/q
                     }; 
    bond_coeffs = { 'BondName'  1 2; % BondName
                     };
    angle_coeffs = { 'AngleName' 1 2  ; % AngleName
                      };
    dihedral_coeffs = { 'DihedralName' 1 2 3 4 5; % DihedralName
                         };
    improper_coeffs = { 'ImproperName' 1 2 3 4 5 6; % ImproperName
                         };
    % Molecular topology
    Atoms(1:atoms_num,1:3) = [1 1 1;    % atom ID | molecule ID | atoms type
                              2 1 2;
                              3 1 2;
                              4 1 2;
                              5 1 2;];
    Bonds(1:bonds_num,1:4) = [1 1 1 2;    % bond ID | bond type | atom1 ID | atom2 ID
                              2 1 1 3;
                              3 1 1 4;
                              4 1 1 5;];
    Angles(1:angles_num,1:5) = [1 1 2 1 3;    % angle ID | angle type | atom1 ID | atom2 ID | atom3 ID
                                2 1 2 1 4;
                                3 1 2 1 5;
                                4 1 3 1 4;
                                5 1 3 1 5;
                                6 1 4 1 5;];
    Dihedrals(1:dihedrals_num,1:6) = [1 1 2 1 3 4;    % dihedral ID | dihedral type | atom1 ID | atom2 ID | atom3 ID  | atom4 ID
                                      2 1 2 1 4 5;
                                      3 1 2 1 5 6 ;
                                      4 1 3 1 4 5;];
    Impropers(1:impropers_num,1:7) = [1 1 2 1 3 4 5;    % improper ID | improper type | atom1 ID | atom2 ID | atom3 ID  | atom4 ID   | atom5 ID
                                      2 1 2 1 4 5 6;
                                      3 1 2 1 5 6 7;];
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
