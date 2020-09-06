% Screen Output

function ScreenOutput(data)
    fprintf('Screen output\n');
    fprintf(' ==========================================\n');
    fprintf('         Type of molecules:   %5.d \n',data.mol.type);
    fprintf('         Number of molecules: %5.d \n',data.mol.num);
    fprintf('   ---------------------------------------\n');
    fprintf('    atoms     %5.d | atom types     %2.d \n',data.atom.num,data.atom.type);
    fprintf('    bonds     %5.d | bond types     %2.d \n',data.bond.num,data.bond.type);
    fprintf('    angles    %5.d | angle types    %2.d \n',data.angle.num,data.angle.type);
    fprintf('    dihedrals %5.d | dihedral types %2.d \n',data.dihedral.num,data.dihedral.type);
    fprintf('    impropers %5.d | improper types %2.d \n',data.improper.num,data.improper.type);
    fprintf('   ---------------------------------------\n');
    fprintf('        Boundary of simulation box:\n');
    fprintf('           X:  %4.2f   %4.2f \n',data.boundary(1,:));
    fprintf('           Y:  %4.2f   %4.2f \n',data.boundary(2,:));
    fprintf('           Z:  %4.2f   %4.2f \n',data.boundary(3,:));
    fprintf(' ===========================================\n');
end