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
}

/*************************************************************************
 Draw our module. This should print "EPong world!" in the main window
*************************************************************************/
void EPongStelModule::draw(StelCore* core)
{
	StelPainter painter(core->getProjection(StelCore::FrameAltAz));
	painter.setColor(1,1,1,1);
	painter.setFont(font);
	painter.drawText(00, 00, "EPong World!");
}

