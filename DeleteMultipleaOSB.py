import sys
import wlstModule

FileName 	= sys.argv[1]
UserName 	= sys.argv[2]
UserPassword 	= sys.argv[3]
WLSURL 		= sys.argv[4]

from java.util import Collections
from com.bea.wli.sb.management.configuration import SessionManagementMBean
from com.bea.wli.sb.management.configuration import ALSBConfigurationMBean
from com.bea.wli.sb.management.configuration import ProxyServiceConfigurationMBean
from com.bea.wli.config import Ref
from com.bea.wli.sb.util import Refs
connect(UserName, UserPassword, WLSURL)
domainRuntime()
f = open(FileName)
for line in f:		
		print '==============================================================='
		projectName =  String(line).trim()
		print ("Length of the string: ", projectName)
		sessionName =  String("weblogic"+Long(System.currentTimeMillis()).toString())
		#sessionName =  String("weblogic")
		print ('Trying to remove', projectName)
		projectRef = Ref(Ref.PROJECT_REF,Ref.DOMAIN,projectName)
		SessionMBean = findService("SessionManagement","com.bea.wli.sb.management.configuration.SessionManagementMBean")
		print "SessionMBean Started Session"
		SessionMBean.createSession(sessionName)
		print ('Created Session.......',sessionName)
		ALSBConfigurationMBean = findService("ALSBConfiguration."+sessionName.toString(),"com.bea.wli.sb.management.configuration.ALSBConfigurationMBean")
		if ALSBConfigurationMBean.exists(projectRef):
			ALSBConfigurationMBean.delete(Collections.singleton(projectRef))
			print "Deleted"
			SessionMBean.activateSession(sessionName,"Complete project removal with customization using wlst")
		else:
			print ('Project does not exist',projectName)
			print "Session discarded"
			SessionMBean.discardSession(sessionName)
		
f.close()
