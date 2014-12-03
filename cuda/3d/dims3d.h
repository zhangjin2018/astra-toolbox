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

#ifndef _CUDA_CONE_DIMS_H
#define _CUDA_CONE_DIMS_H

namespace astra {

struct SConeProjection {
	// the source
	double fSrcX, fSrcY, fSrcZ;

	// the origin ("bottom left") of the (flat-panel) detector
	double fDetSX, fDetSY, fDetSZ;

	// the U-edge of a detector pixel
	double fDetUX, fDetUY, fDetUZ;

	// the V-edge of a detector pixel
	double fDetVX, fDetVY, fDetVZ;
};

struct SPar3DProjection {
	// the ray direction
	double fRayX, fRayY, fRayZ;

	// the origin ("bottom left") of the (flat-panel) detector
	double fDetSX, fDetSY, fDetSZ;

	// the U-edge of a detector pixel
	double fDetUX, fDetUY, fDetUZ;

	// the V-edge of a detector pixel
	double fDetVX, fDetVY, fDetVZ;
};

void computeBP_UV_Coeffs(const SPar3DProjection& proj, double &fUX, double &fUY, double &fUZ, double &fUC,
                                                       double &fVX, double &fVY, double &fVZ, double &fVC);

void computeBP_UV_Coeffs(const SConeProjection& proj, double &fUX, double &fUY, double &fUZ, double &fUC,
                                                      double &fVX, double &fVY, double &fVZ, double &fVC,
                                                      double &fDX, double &fDY, double &fDZ, double &fDC);

}




namespace astraCUDA3d {

using astra::SConeProjection;
using astra::SPar3DProjection;

struct SDimensions3D {
	unsigned int iVolX;
	unsigned int iVolY;
	unsigned int iVolZ;
	unsigned int iProjAngles;
	unsigned int iProjU; // number of detectors in the U direction
	unsigned int iProjV; // number of detectors in the V direction
	unsigned int iRaysPerDetDim;
	unsigned int iRaysPerVoxelDim;
};

}

#endif

