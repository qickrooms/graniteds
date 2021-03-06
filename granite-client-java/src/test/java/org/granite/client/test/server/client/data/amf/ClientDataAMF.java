/**
 *   GRANITE DATA SERVICES
 *   Copyright (C) 2006-2015 GRANITE DATA SERVICES S.A.S.
 *
 *   This file is part of the Granite Data Services Platform.
 *
 *   Granite Data Services is free software; you can redistribute it and/or
 *   modify it under the terms of the GNU Lesser General Public
 *   License as published by the Free Software Foundation; either
 *   version 2.1 of the License, or (at your option) any later version.
 *
 *   Granite Data Services is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
 *   General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public
 *   License along with this library; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
 *   USA, or see <http://www.gnu.org/licenses/>.
 */
package org.granite.client.test.server.client.data.amf;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import org.granite.client.messaging.RemoteAlias;
import org.granite.client.persistence.Entity;
import org.granite.client.persistence.Id;
import org.granite.client.test.server.client.data.ClientData;

/**
 * Created by william on 30/09/13.
 */
@RemoteAlias("org.granite.client.test.server.data.Data")
@Entity
public class ClientDataAMF implements ClientData, Externalizable {

    private static final long serialVersionUID = 1L;

    private boolean __initialized__ = true;
	private String __detachedState__ = null;
    
    @Id
    private Long id;

    private String value;

    public ClientDataAMF() {
    }

    public ClientDataAMF(String value) {
        this.value = value;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		out.writeObject(__initialized__);
		out.writeObject(__detachedState__);
		if (!__initialized__) {
			out.writeObject(id);
			return;
		}
		out.writeObject(id);
		out.writeObject(value);
	}

	@Override
	public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
		__initialized__ = (Boolean)in.readObject();
		__detachedState__ = (String)in.readObject();
		if (__initialized__) {
			Number nid = ((Number)in.readObject());
			id = nid != null ? nid.longValue() : null;
			value = (String)in.readObject();
		}
		else {
			Number nid = ((Number)in.readObject());
			id = nid != null ? nid.longValue() : null;
		}
	}
}
