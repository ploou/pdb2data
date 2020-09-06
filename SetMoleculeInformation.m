% Set Molecule Information

function data = SetMoleculeInformation(data,pdb)
fprintf('Setting molecule information\n');
    for i=1:size(pdb.atoms_num,2)
        switch char(pdb.mols_type{i})
            % Add new molecule template as shown below.
            case 'HOH'
                newdata = H2O(pdb.atoms_num(i),data,pdb.atoms_coord{i});
%             case 'MT'
%                 newdata = MolecularTemplate(pdb.atoms_num(i),data,pdb.atoms_coord{i});
        end
        data = newdata;
    end
fprintf('\t >>> Setting boundary..\n');
    data.boundary = [floor(min(data.Atoms(:,5))), ceil(max(data.Atoms(:,5))); 	% xlo xhi
                     floor(min(data.Atoms(:,6))), ceil(max(data.Atoms(:,6)));   % ylo yhi
                     floor(min(data.Atoms(:,7))), ceil(max(data.Atoms(:,7)));]; % zlo zhi
end
