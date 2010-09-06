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
#include "StelNavigator.hpp"
#include "StelPainter.hpp"
#include "StelApp.hpp"
#include "StelCore.hpp"
#include "StelLocaleMgr.hpp"
#include "StelModuleMgr.hpp"
#include "EPongStelModule.hpp"

#include <QDebug>
#define BALLS 100 
// better divisble by 4

//Vec3f ballPos[BALLS];
//Vec3f ballNormal[BALLS];
//char ballEvent[BALLS];
//double eventTime[BALLS];

PongBall *ball[BALLS];
PongEvent *pevent[BALLS];

static double lastTime; 
enum {
	BALL_CREATE,
	BALL_COLLIDE,
	BALL_BOUNCE
};
#define PI 3.14
#define HTT 4.0 
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
	lastTime = StelApp::getTotalRunTime(); 
	int i;
	for(i = 0; i < BALLS; i++)
	{
		ball[i] = new PongBall();
		ball[i]->pos.set(0.0f, 0.0f, 1.0f);
		ball[i]->normal.set(sin(2.0f * PI * i/BALLS), 
			cos(2.0f * PI * i / BALLS), 0.0f);
		ball[i]->alive = 0;	
		pevent[i] = new PongEvent();
		pevent[i]->type = BALL_CREATE;
		pevent[i]->time = lastTime + HTT * (i % (BALLS / 4)) /
					(BALLS / 4);
		printf("HTT: %f,  i:%d\n", HTT, i); 
		printf("Ball creation of Ball %i at %f\n", i, pevent[i]->time);
	}
}

inline void PongBall::move(double alpha)
{
	double x,y,z;
	double s,c,t;
	s = sin(alpha);
	c = cos(alpha);
	//printf("s = %f, c = %f\n", s,c);	
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
	//printf("x = %f, y = %f, z = %f\n",pos[0], pos[1], pos[2]); 
}

double get_bounce_time(PongBall *ball)
{
	printf("px: %f, py: %f, pz: %f, nx: %f, ny: %f, nz: %f/n",
		ball->pos[0], 
		ball->pos[1], 
		ball->pos[2], 
		ball->normal[0], 
		ball->normal[1], 
		ball->normal[2]); 
	return HTT * acos(ball->normal[1] * ball->pos[0] - 
		ball->normal[0] * ball->pos[1]) / PI;
}

void get_next_event(PongEvent *event, PongBall *ball, double now)
{
	event->type = BALL_BOUNCE;
	double delta = get_bounce_time(ball);
	event->time = now + delta;
	printf("Setting bounce time to %f\n",delta);
}
void handle_events(double time)
{
	//printf("enter handle\n");
	int first;
	double first_time;
	do {
		first = BALLS;
		int i;
		for (i = 0; i < BALLS; i++) {
			if (pevent[i]->time < time) {
				if ((first == BALLS) || 
					((pevent[i]->time) < first_time)) {
					first = i;
					first_time = pevent[i]->time;
				}
			}
		}
		if (first < BALLS) {
			printf("Time: %f\n", first_time);
			switch (pevent[first]->type) {
			case BALL_CREATE:
				printf("\tCreate ball\n");
				ball[first]->alive = 1;
				ball[first]->moved = first_time;
				break;
			case BALL_BOUNCE:
				printf("\tBounce ball\n");
				ball[first]->normal[0] = 
					- ball[first]->normal[0];
				ball[first]->normal[1] = 
					- ball[first]->normal[1];
				ball[first]->moved = first_time;
				break;
			default:
				break;
			}
			get_next_event(pevent[first], ball[first], first_time);
		}
	} while (first != BALLS);
	//printf("leave handle\n");
}

/*************************************************************************
*************************************************************************/
void EPongStelModule::draw(StelCore* core)
{
	double currentTime = StelApp::getTotalRunTime();
	handle_events(currentTime);
	Vec3f xy;
	StelProjectorP prj = core->getProjection(StelCore::FrameAltAz);
	StelPainter painter(prj);
	painter.setColor(1,1,1,1);
	painter.setFont(font);
	int i;
	for (i = 0; i<BALLS; i++) {
		if (ball[i]->alive == 1) {
			ball[i]->move((currentTime - ball[i]->moved)/HTT * PI);	
			ball[i]->moved = currentTime;
		}
		prj->project(ball[i]->pos, xy);
		painter.drawCircle(xy[0], xy[1], 10); //qDebug() << "end of drawing epong";
		ball[i]->pos.normalize();
		ball[i]->normal.normalize();
	}
	lastTime = currentTime;
}

