
    %  rotation-mean
    %
    %     Nils Hamel - nils.hamel@bluewin.ch
    %     Copyright (c) 2020 EPFL
    %
    %  This program is free software: you can redistribute it and/or modify
    %  it under the terms of the GNU General Public License as published by
    %  the Free Software Foundation, either version 3 of the License, or
    %  (at your option) any later version.
    %
    %  This program is distributed in the hope that it will be useful,
    %  but WITHOUT ANY WARRANTY; without even the implied warranty of
    %  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    %  GNU General Public License for more details.
    %
    %  You should have received a copy of the GNU General Public License
    %  along with this program.  If not, see <http://www.gnu.org/licenses/>.

    % Note : This function is designed to work on octave. You need to install
    % and load the linear-algebra package.

    function mean_rotation = rotation_mean( rotation_list )

        % initialise parameters
        v_sum = zeros(1,3);
        a_sum = 0.;

        % parsing rotation list - assumed to be a n by one cell array of 3 by 3 matrix
        for i = 1 : length( rotation_list )

            % extract rotation axis vector and angle
            [ v a ] = rotparams( rotation_list{i} );

            % update sums %
            v_sum = v_sum + v;
            a_sum = a_sum + a;

        end

        % compute mean values of rotation axis vector and angle
        v_sum = v_sum / length( rotation_list );
        a_sum = a_sum / length( rotation_list );

        % compute pseudo-mean rotation matrix
        mean_rotation = rotv( v_sum, a_sum );

    end
