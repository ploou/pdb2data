% Template of New Molecule 

 function new_data = TemplateMolecule(Placed_atoms_num,data,atoms_XYZ)
 fprintf('\t# Template molecules\n');
    %%%% ============= Setting coefficients of new molecule ===============
    atoms_num = 0;      % atoms number in a new molecule
    bonds_num = 0;
    angles_num = 0;
    dihedrals_num = 0;
    impropers_num = 0;
    atom_types = 0;     % atom types in a new molecule
    bond_types = 0;
    angle_types = 0;
    dihedral_types = 0;
    improper_types = 0;
    %   name | epsilon(KJ/mol) | sigma(A) | mass/m | charge/q
    pair_coeffs = { 'AtomName'  1 2 3 4; % AtomName
                     };
    bond_coeffs = { 'BondName'  1 2; % BondName
                     };
    angle_coeffs = { 'AngleName' 1 2  ; % AngleName
                      };
    dihedral_coeffs = { 'DihedralName' 1 2 3 4 5; % DihedralName
                         };
    improper_coeffs = { 'ImproperName' 1 2 3 4 5 6; % ImproperName
                         };
    % molecule numberplaced in data
    mol_num = Placed_atoms_num/atoms_num;
 fprintf('\t\t numbers: %d\n',mol_num);
 fprintf('\t\t molecule type: %d\n',data.mol.type + 1);
    %%%% Atoms information ------------------------------------------------
    for i = 1:mol_num*atoms_num
        Atoms(i,1) = data.atom.num + i;                      % atom ID
        Atoms(i,2) = data.mol.num + ceil(i/atoms_num);       % molecule ID
%         Atoms(i,3) = data.atom.type+1;            % atom type
%         Atoms(i,4) = pair_coeffs{1,5};            % charge
    end
    Atoms(:,5:7) = atoms_XYZ;                                % atom coordinates
    Atoms;
    %%%% Bonds information ------------------------------------------------
    for i = 1:mol_num*bonds_num
        Bonds(i,1) = data.bond.num + i;                      % bond ID
%         Bonds(i,2) = 	% bond type
%         Bonds(i,3) = 	% atomID1 in bond
%         Bonds(i,4) = 	% atomID2 in bond
    end
    Bonds;
    %%%% Angles information -----------------------------------------------
    for i = 1:mol_num*angles_num
        Angles(i,1) = data.angle.num + i;                    % angle ID 
        Angles(i,2) = data.angle.type + angle_types;         % angle type
%         Angles(i,3) = 	%atomID1 in HOH angle
%         Angles(i,4) = 	% atomID2 in angle
%         Angles(i,5) = 	% atomID3 in angle
    end
    Angles;
    %%%% Dihedrals information -----------------------------------------------
    for i = 1:mol_num*dihedrals_num
        Dihedrals(i,1) = data.dihedral.num + i;               % dihedrale ID 
        Dihedrals(i,2) = data.dihedral.type + dihedral_types; % dihedrale type
%         Dihedrals(i,3) = 	% atomID1 in dihedral
%         Dihedrals(i,4) = 	% atomID2 in dihedral
%         Dihedrals(i,5) = 	% atomID3 in dihedral
%         Dihedrals(i,6) = 	% atomID4 in dihedral
    end
    Dihedrals;
    %%%% Impropers information -----------------------------------------------
    for i = 1:mol_num*impropers_num
        Impropers(i,1) = data.improper.num + i;               % improper ID 
        Impropers(i,2) = data.improper.type + improper_types; % improper type
%         Impropers(i,3) = 	% atomID1 in improper
%         Impropers(i,4) = 	% atomID2 in improper
%         Impropers(i,5) = 	% atomID3 in improper
%         Impropers(i,6) = 	% atomID4 in improper
%         Impropers(i,7) = 	% atomID5 in improper
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
