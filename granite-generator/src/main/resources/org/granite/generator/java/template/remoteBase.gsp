<%--
  GRANITE DATA SERVICES
  Copyright (C) 2006-2014 GRANITE DATA SERVICES S.A.S.
 
  This file is part of the Granite Data Services Platform.

  Granite Data Services is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  Granite Data Services is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
  General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
  USA, or see <http://www.gnu.org/licenses/>.

  @author Franck WOLFF
--%><%
	Set javaImports = new TreeSet();

	javaImports.add("org.granite.client.messaging.channel.Channel");
	javaImports.add("org.granite.client.messaging.ResponseListener");	
	javaImports.add("org.granite.client.messaging.channel.ResponseMessageFuture");
	
	if (!jClass.hasSuperclass()) {
		javaImports.add("org.granite.client.messaging.RemoteService");
	}
	
	for (jImport in jClass.imports) {
	    if (jImport.hasImportPackage() && jImport.importPackageName != "java.lang" && jImport.importPackageName != jClass.clientType.packageName)
	        javaImports.add(jImport.importQualifiedName);
	}

%>/**
 * Generated by Gja v${gVersion} (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (${jClass.as3Type.name}.as).
 */

package ${jClass.clientType.packageName};
<%
///////////////////////////////////////////////////////////////////////////////
// Write Import Statements.

	for (javaImport in javaImports) {%>
import ${javaImport};<%
	}%>

///////////////////////////////////////////////////////////////////////////////
// Write Class Declaration.%>

public class ${jClass.clientType.name}Base<%

    if (jClass.hasSuperclass()) {
        %> extends ${jClass.superclass.clientType.name} {<%
    } else {
        %> extends RemoteService {<%
    }%>
    
    public ${jClass.clientType.name}Base(Channel channel, String id) {
    	super(channel, id);
    }
    <%

///////////////////////////////////////////////////////////////////////////
// Write Methods.
         
    for (jMethod in jClass.methods) {%>    
    public ResponseMessageFuture ${jMethod.name}(<%
             String[] names = jMethod.getClientParameterNames();

             int count = 0;
             for (pType in jMethod.getClientParameterTypes()) {
                 if (count > 0) {
                     %>, <%
                 }
                 %>${pType.name} ${names[count]}<%
                 count++;
             }
             if (count > 0) {%>, <% } %>ResponseListener listener) {
 		return newInvocation("${jMethod.name}"<%

             count = 0; 
             for (pType in jMethod.getClientParameterTypes()) {
                 %>, ${names[count]}<%
                 count++;
             }%>).addListener(listener).invoke();
    }
    <%
    }%>
}
