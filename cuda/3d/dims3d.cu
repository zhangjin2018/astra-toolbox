/*
-----------------------------------------------------------------------
Copyright 2012 iMinds-Vision Lab, University of Antwerp

Contact: astra@ua.ac.be
Website: http://astra.ua.ac.be


This file is part of the
All Scale Tomographic Reconstruction Antwerp Toolbox ("ASTRA Toolbox").

The ASTRA Toolbox is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

The ASTRA Toolbox is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the ASTRA Toolbox. If not, see <http://www.gnu.org/licenses/>.

-----------------------------------------------------------------------
$Id$
*/

#include "dims3d.h"

namespace astra {

// (See declaration in header for (mathematical) description of these functions)


void computeBP_UV_Coeffs(const SPar3DProjection& proj, double &fUX, double &fUY, double &fUZ, double &fUC,
                                                       double &fVX, double &fVY, double &fVZ, double &fVC)
{
	double denom = (proj.fRayX*proj.fDetUY*proj.fDetVZ - proj.fRayX*proj.fDetUZ*proj.fDetVY - proj.fRayY*proj.fDetUX*proj.fDetVZ + proj.fRayY*proj.fDetUZ*proj.fDetVX + proj.fRayZ*proj.fDetUX*proj.fDetVY - proj.fRayZ*proj.fDetUY*proj.fDetVX);

	fUX = ( - (proj.fRayY*proj.fDetVZ - proj.fRayZ*proj.fDetVY)) / denom;
	fUY = ( (proj.fRayX*proj.fDetVZ - proj.fRayZ*proj.fDetVX)) / denom;
	fUZ = (- (proj.fRayX*proj.fDetVY - proj.fRayY*proj.fDetVX) ) / denom;
	fUC = (-(proj.fDetSY*proj.fDetVZ - proj.fDetSZ*proj.fDetVY)*proj.fRayX + (proj.fRayY*proj.fDetVZ - proj.fRayZ*proj.fDetVY)*proj.fDetSX - (proj.fRayY*proj.fDetSZ - proj.fRayZ*proj.fDetSY)*proj.fDetVX) / denom;

	fVX = ((proj.fRayY*proj.fDetUZ - proj.fRayZ*proj.fDetUY) ) / denom;
	fVY = (- (proj.fRayX*proj.fDetUZ - proj.fRayZ*proj.fDetUX) ) / denom;
	fVZ = ((proj.fRayX*proj.fDetUY - proj.fRayY*proj.fDetUX) ) / denom;
	fVC = ((proj.fDetSY*proj.fDetUZ - proj.fDetSZ*proj.fDetUY)*proj.fRayX - (proj.fRayY*proj.fDetUZ - proj.fRayZ*proj.fDetUY)*proj.fDetSX + (proj.fRayY*proj.fDetSZ - proj.fRayZ*proj.fDetSY)*proj.fDetUX ) / denom;
}



void computeBP_UV_Coeffs(const SConeProjection& proj, double &fUX, double &fUY, double &fUZ, double &fUC,
                                                      double &fVX, double &fVY, double &fVZ, double &fVC,
                                                      double &fDX, double &fDY, double &fDZ, double &fDC)
{
	fUX = (proj.fDetSZ - proj.fSrcZ)*proj.fDetVY - (proj.fDetSY - proj.fSrcY)*proj.fDetVZ;
	fUY = (proj.fDetSX - proj.fSrcX)*proj.fDetVZ -(proj.fDetSZ - proj.fSrcZ)*proj.fDetVX;
	fUZ = (proj.fDetSY - proj.fSrcY)*proj.fDetVX - (proj.fDetSX - proj.fSrcX)*proj.fDetVY;
	fUC = (proj.fDetSY*proj.fDetVZ - proj.fDetSZ*proj.fDetVY)*proj.fSrcX - (proj.fDetSX*proj.fDetVZ - proj.fDetSZ*proj.fDetVX)*proj.fSrcY + (proj.fDetSX*proj.fDetVY - proj.fDetSY*proj.fDetVX)*proj.fSrcZ;

	fVX = (proj.fDetSY - proj.fSrcY)*proj.fDetUZ-(proj.fDetSZ - proj.fSrcZ)*proj.fDetUY;
	fVY = (proj.fDetSZ - proj.fSrcZ)*proj.fDetUX - (proj.fDetSX - proj.fSrcX)*proj.fDetUZ;
	fVZ = (proj.fDetSX - proj.fSrcX)*proj.fDetUY-(proj.fDetSY - proj.fSrcY)*proj.fDetUX;
	fVC = -(proj.fDetSY*proj.fDetUZ - proj.fDetSZ*proj.fDetUY)*proj.fSrcX + (proj.fDetSX*proj.fDetUZ - proj.fDetSZ*proj.fDetUX)*proj.fSrcY - (proj.fDetSX*proj.fDetUY - proj.fDetSY*proj.fDetUX)*proj.fSrcZ;

	fDX = proj.fDetUY*proj.fDetVZ - proj.fDetUZ*proj.fDetVY;
	fDY = proj.fDetUZ*proj.fDetVX - proj.fDetUX*proj.fDetVZ;
	fDZ = proj.fDetUX*proj.fDetVY - proj.fDetUY*proj.fDetVX;
	fDC = -proj.fSrcX * (proj.fDetUY*proj.fDetVZ - proj.fDetUZ*proj.fDetVY) - proj.fSrcY * (proj.fDetUZ*proj.fDetVX - proj.fDetUX*proj.fDetVZ) - proj.fSrcZ * (proj.fDetUX*proj.fDetVY - proj.fDetUY*proj.fDetVX);
}

}
