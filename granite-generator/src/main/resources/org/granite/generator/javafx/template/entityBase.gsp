<%--
  GRANITE DATA SERVICES
  Copyright (C) 2011 GRANITE DATA SERVICES S.A.S.

  This file is part of Granite Data Services.

  Granite Data Services is free software; you can redistribute it and/or modify
  it under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version.

  Granite Data Services is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, see <http://www.gnu.org/licenses/>.

  @author Franck WOLFF
--%><%

    import org.granite.generator.as3.reflect.JavaProperty;
    import org.granite.generator.as3.reflect.JavaFieldProperty;
    import org.granite.generator.as3.reflect.JavaAbstractType;
    
    import java.lang.reflect.Field;
    import java.lang.reflect.Modifier;
    
    import javax.persistence.Version;
    import javax.persistence.EmbeddedId;
    import javax.persistence.Transient;


    // Check if we have at least an id or a uid in jClass hierarchy.    
    JavaAbstractType jc = jClass;
    boolean hasUid = jClass.hasUid();
    while (!hasUid && jc.hasSuperclass()) {
        jc = jc.getSuperclass();
        hasUid = jc.hasUid();
    }
    
    jc = jClass;
    boolean hasId = jClass.hasIdentifiers();
    while (!hasId && jc.hasSuperclass()) {
        jc = jc.getSuperclass();
        hasId = jc.hasIdentifiers();
    }
    
    if (!hasUid && !hasId)
        throw new RuntimeException("Explicit uid field is required for: " + jClass.qualifiedName);


    JavaProperty versionField = jClass.getVersion();
    JavaProperty uidField = jClass.getUid();
    

    Set javaImports = new TreeSet();

	javaImports.add("org.granite.client.persistence.Entity");
	javaImports.add("org.granite.messaging.annotations.Serialized");

    if (!jClass.hasSuperclass()) {
    	javaImports.add("java.io.Serializable");
    	
    	javaImports.add("org.granite.client.persistence.Id");
    	javaImports.add("org.granite.client.persistence.Uid");
    	javaImports.add("org.granite.client.persistence.Version");
    }
    
    for (jProperty in jClass.properties) {
    	if (jClass.isLazy(jProperty))
    		javaImports.add("org.granite.client.persistence.Lazy");
    	
        if (jClass.metaClass.hasProperty(jClass, 'constraints') && jClass.constraints[jProperty] != null) {
        	for (cons in jClass.constraints[jProperty])
        		javaImports.add(cons.packageName + "." + cons.name);
        }
    }

    for (jImport in jClass.imports) {
        if (jImport.hasImportPackage() && jImport.importPackageName != "java.lang" && jImport.importPackageName != jClass.clientType.packageName)
            javaImports.add(jImport.importQualifiedName);
    }

%>/**
 * Generated by Gas3 v${gVersion} (Granite Data Services).
* *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (${jClass.as3Type.name}.as).
 */

package ${jClass.as3Type.packageName};
<%

///////////////////////////////////////////////////////////////////////////////
// Write Import Statements.

    for (javaImport in javaImports) {%>
import ${javaImport};<%
    }

///////////////////////////////////////////////////////////////////////////////
// Write Class Declaration.%>

@Entity
@Serialized(propertiesOrder={ <% if (jClass.hasIdentifiers()) { %>"__initialized__", "__detachedState__", <% };
	jClass.properties.eachWithIndex { jProperty, idx -> if (idx > 0) { %>, <% } %>"${jProperty.name}"<% }
%> })
public class ${jClass.as3Type.name}Base<%

        boolean implementsWritten = false;
        if (jClass.hasSuperclass()) {
            %> extends ${jClass.superclass.as3Type.name}<%
        } else {
            %> implements Serializable<%

            implementsWritten = true;
        }

        for (jInterface in jClass.interfaces) {
            if (!implementsWritten) {
                %> implements ${jInterface.as3Type.name}<%

                implementsWritten = true;
            } else {
                %>, ${jInterface.as3Type.name}<%
            }
        }

    %> {

    private static final long serialVersionUID = 1L;
<%

    ///////////////////////////////////////////////////////////////////////////
    // Write Private Fields.

    if (jClass.hasIdentifiers()) {%>
    @SuppressWarnings("unused")
    private boolean __initialized__ = true;
    @SuppressWarnings("unused")
	private String __detachedState__ = null;
    
<%
    }
	
	for (jProperty in jClass.properties) {
    	if (jProperty == jClass.firstIdentifier) {%>
    @Id<%
        } else if (jProperty == uidField) {%>
    @Uid<%
        } else if (jProperty == versionField) {%>
    @Version<%
        } else if (jClass.isLazy(jProperty)) {%>
    @Lazy<%
        }
    	if (!jProperty.readable && !jProperty.writable) {%>
    @SuppressWarnings("unused")<%
    	}
	    if (jProperty instanceof org.granite.generator.as3.reflect.JavaProperty && jProperty.clientType.readOnly) {%>
	${jProperty.access} ${jProperty.clientType.simplePropertyImplTypeName} ${jProperty.name} = ${jProperty.clientType.propertyFactoryName}(this, "${jProperty.name}");<%
	    }
	    else if (jProperty instanceof org.granite.generator.as3.reflect.JavaProperty && jProperty.clientType.propertyTypeName != null) {%>
	${jProperty.access} ${jProperty.clientType.simplePropertyTypeName} ${jProperty.name} = new ${jProperty.clientType.simplePropertyImplTypeName}(this, "${jProperty.name}");<%
	    }
	    else if (jProperty.clientType.propertyTypeName != null) {%>
	private ${jProperty.clientType.simplePropertyTypeName} ${jProperty.name} = new ${jProperty.clientType.simplePropertyImplTypeName}(this, "${jProperty.name}");<%
	    }
	}%>
	<%

    ///////////////////////////////////////////////////////////////////////////
    // Write Public Getter/Setter.

    for (jProperty in jClass.properties) {
        if (jProperty.readable || jProperty.writable) {
        	if (jProperty.clientType.propertyTypeName != null) {%>
	public ${jProperty.clientType.simplePropertyTypeName} ${jProperty.name}Property() {
		return ${jProperty.name}<% if (jProperty.clientType.readOnly) {%>.getReadOnlyProperty()<% } %>;
	}<%
        	}
            if (jProperty.writable && !jProperty.clientType.readOnly) {
            	if (jProperty.writeOverride) {%>
    @Override<% } %>
    public void set${jProperty.capitalizedName}(${jProperty.clientType.name} value) {<%
    			if (jProperty.clientType.propertyTypeName != null) {%>
        ${jProperty.name}.set(value);<%
    			}
    			else {%>
    	this.${jProperty.name} = value;<%			
    			}%>
    }<%
	        }
            if (jProperty.readable) {
                if (jClass.metaClass.hasProperty(jClass, 'constraints') && jClass.constraints[jProperty] != null) {
                	for (cons in jClass.constraints[jProperty]) {%>
    @${cons.name}<%
    					if (!cons.properties.empty) {%>(<%}
    					cons.properties.eachWithIndex{ p, i -> if (i > 0) {%>, <%}; if (p[2] == "java.lang.String") {%>${p[0]}="${p[1]}"<% } else { %>${p[0]}=${p[1]}<% } }
    					if (!cons.properties.empty) {%>)<%}
    				}
                }
            	if (jProperty.readOverride) {%>
    @Override<% 
            	}%>
    public ${jProperty.clientType.name} get${jProperty.capitalizedName}() {<%
				if (jProperty.clientType.propertyTypeName != null) {%>
        return ${jProperty.name}.get();<%
    			}
				else {%>
		return this.${jProperty.name};<%
				}%>
    }
    <%
            }
        }
    }


    ///////////////////////////////////////////////////////////////////////////
    // Write Public Getters/Setters for Implemented Interfaces.

    if (jClass.hasInterfaces()) {
        for (jProperty in jClass.interfacesProperties) {
            if (jProperty.readable || jProperty.writable) {%>
<%
                if (jProperty.writable) {%>
    public function set${jProperty.capitalizedName}(${jProperty.clientType.name} value) {
    }<%
                }
                if (jProperty.readable) {%>
    public ${jProperty.clientType.name} get${jProperty.capitalizedName}() {
        return ${jProperty.clientType.nullValue};
    }<%
                }
            }
        }
    }%>
}