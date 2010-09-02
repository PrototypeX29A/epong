/*
 * Copyright (C) 2007 Fabien Chereau
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#include "StelProjector.hpp"
#include "StelPainter.hpp"
#include "StelApp.hpp"
#include "StelCore.hpp"
#include "StelLocaleMgr.hpp"
#include "StelModuleMgr.hpp"
#include "EPongStelModule.hpp"

#include <QDebug>
#define BALLS 100 // better divisble by 4

Vec3f ballPos[BALLS];
Vec3f ballNormal[BALLS];
char ballEvent[BALLS];
double eventTime[BALLS];

static double lastTime; 
enum {
	BALL_CREATE,
	BALL_BOUNCE,
	BALL_PADDLE
};
#define PI 3.14
#define HTT 5 
// Time in seconds a ball needs to make a halfturn

/*************************************************************************
 This method is the one called automatically by the StelModuleMgr just 
 after loading the dynamic library
*************************************************************************/
StelModule* EPongStelModuleStelPluginInterface::getStelModule() const
{
	return new EPongStelModule();
}

StelPluginInfo EPongStelModuleStelPluginInterface::getPluginInfo() const
{
	StelPluginInfo info;
	info.id = "EPongStelModule";
	info.displayedName = "EPong World test plugin";
	info.authors = "Stellarium team";
	info.contact = "www.stellarium.org";
	info.description = "An minimal plugin example.";
	return info;
}

Q_EXPORT_PLUGIN2(EPongStelModule, EPongStelModuleStelPluginInterface)


/*************************************************************************
 Constructor
*************************************************************************/
EPongStelModule::EPongStelModule()
{
	setObjectName("EPongStelModule");
	font.setPixelSize(25);
}

/*************************************************************************
 Destructor
*************************************************************************/
EPongStelModule::~EPongStelModule()
{
}

/*************************************************************************
 Reimplementation of the getCallOrder method
*************************************************************************/
double EPongStelModule::getCallOrder(StelModuleActionName actionName) const
{
	if (actionName==StelModule::ActionDraw)
		return StelApp::getInstance().getModuleMgr().getModule("NebulaMgr")->getCallOrder(actionName)+10.;
	return 0;
}


/*************************************************************************
 Init our module
*************************************************************************/
void EPongStelModule::init()
{
	qDebug() << "init called for EPongStelModule";
	//time = 0;
	int i;
	for(i = 0; i < BALLS; i++)
	{
		ballEvent[0] = BALL_CREATE;	
		ballPos[i].set(0.0f, 0.0f, 1.0f);
		ballNormal[i].set(sin(2.0f * PI * i/BALLS), 
			cos(2.0f * PI * i / BALLS), 0.0f);
	}
}

inline void rotate(Vec3f &pos, Vec3f &normal, float alpha)
{
	float x,y,z;
	float s,c,t;
	s = sin(alpha);
	c = cos(alpha);
	printf("s = %f, c = %f\n", s,c);	
	t = 1.0f - c;
	x = pos[0] * (t * normal[0] * normal[0] + c) +
		pos[1] * (t * normal[0] * normal[1] - s * normal[2]) +
		pos[2] * (t * normal[0] * normal[2] + s * normal[1]);
	y = pos[0] * (t * normal[0] * normal[2] + s * normal[2]) +
		pos[1] * (t * normal[1] * normal[1] + c) +
		pos[2] * (t * normal[1] * normal[2] - s * normal[0]);
	z = pos[0] * (t * normal[0] * normal[2] - s * normal[1]) +
		pos[1] * (t * normal[1] * normal[2] + s * normal[0]) +
		pos[2] * (t * normal[2] * normal[2] + c);
	pos.set(x,y,z);
	printf("x = %f, y = %f, z = %f\n",pos[0], pos[1], pos[2]); 
}

/*************************************************************************
 Draw our module. This should print "EPong world!" in the main window
*************************************************************************/
void EPongStelModule::draw(StelCore* core)
{
	Vec3f xy;
	StelProjectorP prj = core->getProjection(StelCore::FrameAltAz);
	StelPainter painter(prj);
	painter.setColor(1,1,1,1);
	painter.setFont(font);
	int i;
	for (i = 0; i<BALLS; i++) {
		if (ballEvent[i] != BALL_CREATE) rotate(ballPos[i], ballNormal[i], 0.05f);	
		prj->project(ballPos[i], xy);
		painter.drawCircle(xy[0], xy[1], 10); //qDebug() << "end of drawing epong";
	}
}

