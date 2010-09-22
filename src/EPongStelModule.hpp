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

#ifndef EPONGSTELMODULE_HPP_
#define EPONGSTELMODULE_HPP_

#include "StelModule.hpp"
#include <QFont>
#include "VecMath.hpp"

//! This is an example of a plug-in which can be dynamically loaded into stellarium
class EPongStelModule : public StelModule
{
public:
	EPongStelModule();
	virtual ~EPongStelModule();

	///////////////////////////////////////////////////////////////////////////
	// Methods defined in the StelModule class
	virtual void init();
	virtual void update(double) {;}
	virtual void draw(StelCore* core);
	virtual double getCallOrder(StelModuleActionName actionName) const;
private:
	// Font used for displaying our text
	QFont font;
		
};

#include "fixx11h.h"
#include <QObject>
#include "StelPluginInterface.hpp"

//! This class is used by Qt to manage a plug-in interface
class EPongStelModuleStelPluginInterface : public QObject, public StelPluginInterface
{
	Q_OBJECT
	Q_INTERFACES(StelPluginInterface)
public:
	virtual StelModule* getStelModule() const;
	virtual StelPluginInfo getPluginInfo() const;
};

class PongEvent
{
public:
	float time;
	char type;
};

class PongBall 
{
public:
	void move(double alpha);
	void create();
	Vec3f pos;
	Vec3f normal;
	char event;
	//double event_time;
	bool alive;
	double moved;
	void handle_event(PongEvent*, double);
private:
	void get_next_event(PongEvent*, double);
};

#endif /*EPONGSTELMODULE_HPP_*/
