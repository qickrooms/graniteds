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
package org.granite.client.javafx.persistence.collection;

import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.SortedMap;

import org.granite.client.persistence.Loader;
import org.granite.client.persistence.collection.PersistentCollection;
import org.granite.client.persistence.collection.PersistentSortedMap;
import org.granite.client.persistence.collection.UnsafePersistentCollection;

import com.sun.javafx.collections.ObservableMapWrapper;

/**
 * @author Franck WOLFF
 */
public class ObservablePersistentSortedMap<K, V> extends ObservableMapWrapper<K, V> implements UnsafePersistentCollection<SortedMap<K, V>> {
	
    private static final long serialVersionUID = 1L;
	
	private final PersistentSortedMap<K, V> persistentSortedMap;

	public ObservablePersistentSortedMap(PersistentSortedMap<K, V> persistentSortedMap) {
		super(persistentSortedMap);
		
		this.persistentSortedMap = persistentSortedMap;
	}

	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		persistentSortedMap.writeExternal(out);
	}
	
	@Override
	public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
		persistentSortedMap.readExternal(in);
	}

	@Override
	public boolean wasInitialized() {
		return persistentSortedMap.wasInitialized();
	}

	@Override
	public void uninitialize() {
		persistentSortedMap.uninitialize();
	}

	@Override
	public void initialize(SortedMap<K, V> map, Initializer<SortedMap<K, V>> initializer) {
		persistentSortedMap.initialize(map, initializer != null ? initializer : new Initializer<SortedMap<K, V>>() {
			public void initialize(SortedMap<K, V> map) {
				putAll(map);
			}
		});
	}
	
	@Override
	public void initializing() {
		persistentSortedMap.initializing();
	}

	@Override
	public PersistentCollection<SortedMap<K, V>> clone(boolean uninitialize) {
		return persistentSortedMap.clone(uninitialize);
	}

	@Override
	public Loader<SortedMap<K, V>> getLoader() {
		return persistentSortedMap.getLoader();
	}

	@Override
	public void setLoader(Loader<SortedMap<K, V>> loader) {
		persistentSortedMap.setLoader(loader);
	}

	@Override
	public boolean isDirty() {
		return persistentSortedMap.isDirty();
	}

	@Override
	public void dirty() {
		persistentSortedMap.dirty();
	}

	@Override
	public void clearDirty() {
		persistentSortedMap.clearDirty();
	}

    @Override
    public void addListener(ChangeListener<SortedMap<K, V>> listener) {
        persistentSortedMap.addListener(listener);
    }

    @Override
    public void removeListener(ChangeListener<SortedMap<K, V>> listener) {
        persistentSortedMap.removeListener(listener);
    }

    @Override
    public void addListener(InitializationListener<SortedMap<K, V>> listener) {
        persistentSortedMap.addListener(listener);
    }

    @Override
    public void removeListener(InitializationListener<SortedMap<K, V>> listener) {
        persistentSortedMap.removeListener(listener);
    }

	@Override
	public void withInitialized(InitializationCallback<SortedMap<K, V>> callback) {
		persistentSortedMap.withInitialized(callback);
	}
	
	@Override
	public PersistentSortedMap<K, V> internalPersistentCollection() {
		return persistentSortedMap;
	}
	
	@Override
	public String toString() {
		return persistentSortedMap.toString();
	}
	
	@Override
	public int hashCode() {
		return System.identityHashCode(persistentSortedMap);
	}
	
	@Override
	public boolean equals(Object object) {
		return object instanceof UnsafePersistentCollection 
				&& ((UnsafePersistentCollection<?>)object).internalPersistentCollection() == persistentSortedMap;
	}
}