% Tetrachloromethane

 function new_data = CCl4(Placed_atoms_num,data,atoms_XYZ)
 fprintf('\t# CCl4 molecules\n');
    %%%% ============= Setting coefficients of new molecule ===============
    atoms_num = 5;      % atoms number in a new molecule
    bonds_num = 4;
    angles_num = 6;
    atom_types = 2;     % atom types in a new molecule
    bond_types = 1;
    angle_types = 1;
    %   name | epsilon(KJ/mol) | sigma(A) | mass/m | charge/q
    pair_coeffs = { 'C'  0.4180 3.41 12.0 -0.1616; % C
                    'Cl' 1.0868 3.45 35.5  0.0404; % Cl
                     };
    bond_coeffs = { 'CCl'  1.77 1000; % C-Cl
                     };
    angle_coeffs = { 'ClCCl' 109.47 1000  ; % Cl-C-Cl
                      };
    % molecule numberplaced in data
    mol_num = Placed_atoms_num/atoms_num;
 fprintf('\t\t numbers: %d\n',mol_num);
 fprintf('\t\t molecule type: %d\n',data.mol.type + 1);
    %%%% Atoms information ------------------------------------------------
    Atoms(1:atoms_num,1:3) = [1 1 1;    % atom ID | molecule ID | atoms type
                              2 1 2;
                              3 1 2;
                              4 1 2;
                              5 1 2;];
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
    Bonds(1:bonds_num,1:4) = [1 1 1 2;    % bond ID | bond type | atom1 ID | atom2 ID
                              2 1 1 3;
                              3 1 1 4;
                              4 1 1 5;];
    for i = 2:mol_num
        Bonds((i-1)*bonds_num+1:(i)*bonds_num,1:4) = Bonds((i-2)*bonds_num+1:(i-1)*bonds_num,1:4);
        Bonds((i-1)*bonds_num+1:(i)*bonds_num,1) = Bonds((i-1)*bonds_num+1:(i)*bonds_num,1)+bonds_num;    % bond ID
        Bonds((i-1)*bonds_num+1:(i)*bonds_num,3:4) = Bonds((i-1)*bonds_num+1:(i)*bonds_num,3:4)+atoms_num;% atoms ID
    end
    Bonds;
    %%%% Angles information -----------------------------------------------
    Angles(1:angles_num,1:5) = [1 1 2 1 3;    % angle ID | atom1 ID | atom2 ID | atom3 ID
                                2 1 2 1 4;
                                3 1 2 1 5;
                                4 1 3 1 4;
                                5 1 3 1 5;
                                6 1 4 1 5;];
    for i = 2:mol_num
        Angles((i-1)*angles_num+1:(i)*angles_num,1:5) = Angles((i-2)*angles_num+1:(i-1)*angles_num,1:5);
        Angles((i-1)*angles_num+1:(i)*angles_num,1) = Angles((i-1)*angles_num+1:(i)*angles_num,1)+angles_num;   % angle ID
        Angles((i-1)*angles_num+1:(i)*angles_num,3:5) = Angles((i-1)*angles_num+1:(i)*angles_num,3:5)+atoms_num;% atoms ID
    end
    Angles;
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
    for i=1:size(pair_coeffs,1)     % Masses
        new_data.Masses{i+new_data.atom.type-atom_types} = {pair_coeffs{i,1},pair_coeffs{i,4}};
    end
    % data
    new_data.Atoms =  [data.Atoms; Atoms;];             % Atoms
    new_data.Bonds =  [data.Bonds; Bonds;];             % Bonds
    new_data.Angles =  [data.Angles; Angles;];          % Angles
end
