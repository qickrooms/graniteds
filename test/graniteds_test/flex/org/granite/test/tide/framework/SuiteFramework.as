package org.granite.test.tide.framework
{
	import org.granite.test.tide.framework.MyComponent3;
	import org.granite.test.tide.framework.MyComponentConversation3;
	import org.granite.test.tide.framework.TestAnnotatedComponent;
	import org.granite.test.tide.framework.TestComponentConversations;
	import org.granite.test.tide.framework.TestComponentConversations2;
	import org.granite.test.tide.framework.TestComponentEventScope;
	import org.granite.test.tide.framework.TestComponentInOut;
	import org.granite.test.tide.framework.TestComponentInjection;
	import org.granite.test.tide.framework.TestComponentInjection2;
	import org.granite.test.tide.framework.TestComponentInjection3;
	import org.granite.test.tide.framework.TestComponentInjectionForum4314;
	import org.granite.test.tide.framework.TestComponentInjectionForum7129;
	import org.granite.test.tide.framework.TestComponentInjectionGDS471;
	import org.granite.test.tide.framework.TestComponentInjectionGDS477;
	import org.granite.test.tide.framework.TestComponentInjectionGDS480;
	import org.granite.test.tide.framework.TestComponentInjectionGDS482;
	import org.granite.test.tide.framework.TestComponentInjectionGDS676;
	import org.granite.test.tide.framework.TestComponentInjectionGDS844;
	import org.granite.test.tide.framework.TestComponentModules;
	import org.granite.test.tide.framework.TestComponentModules2;
	import org.granite.test.tide.framework.TestComponentNestedConversations;
	import org.granite.test.tide.framework.TestComponentNestedConversations2;
	import org.granite.test.tide.framework.TestComponentNoName;
	import org.granite.test.tide.framework.TestComponentNoName2;
	import org.granite.test.tide.framework.TestComponentObservers;
	import org.granite.test.tide.framework.TestComponentObservers2;
	import org.granite.test.tide.framework.TestComponentObservers3;
	import org.granite.test.tide.framework.TestComponentObservers4;
	import org.granite.test.tide.framework.TestComponentObservers5;
	import org.granite.test.tide.framework.TestComponentObserversGDS549;
	import org.granite.test.tide.framework.TestComponentOutjection;
	import org.granite.test.tide.framework.TestComponentOutjectionForum3853;
	import org.granite.test.tide.framework.TestComponentOutjectionGDS427;
	import org.granite.test.tide.framework.TestComponentOutjectionGDS449;
	import org.granite.test.tide.framework.TestComponentOutjectionGDS481;
	import org.granite.test.tide.framework.TestComponentOutjectionGDS745;
	import org.granite.test.tide.framework.TestComponentProduces;
	import org.granite.test.tide.framework.TestComponentProduces2;
	import org.granite.test.tide.framework.TestComponentScan;
	import org.granite.test.tide.framework.TestComponentSubcontexts;
	import org.granite.test.tide.framework.TestComponentSubcontexts2;
	import org.granite.test.tide.framework.TestComponentSubcontexts3;
	import org.granite.test.tide.framework.TestComponentSubcontexts4;
	import org.granite.test.tide.framework.TestComponentSubcontextsGDS555;
	import org.granite.test.tide.framework.TestComponentSubcontextsGDS627;
	import org.granite.test.tide.framework.TestComponentTideModules;
	import org.granite.test.tide.framework.TestComponentTideModules2;
	import org.granite.test.tide.framework.TestSimpleComponent;
	import org.granite.test.tide.framework.TestTypedInjection;
	import org.granite.test.tide.framework.TestTypedInjection2;
	import org.granite.test.tide.framework.TestTypedInjection3;
	import org.granite.test.tide.framework.TestTypedLookup;
	import org.granite.test.tide.framework.TestTypedRemoteInjection;
	import org.granite.test.tide.framework.TestUIComponent;
	import org.granite.test.tide.framework.TestUIComponentGDS781;
	import org.granite.test.tide.framework.TestUIComponentGDS781b;
	import org.granite.test.tide.framework.TestUIComponentModules;
	import org.granite.test.tide.framework.TestEventInterceptor;
    import org.granite.test.tide.framework.TestComponentFlexModules;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SuiteFramework
	{
		public var test1:org.granite.test.tide.framework.MyComponent3;
		public var test2:org.granite.test.tide.framework.MyComponentConversation3;
		public var test3:org.granite.test.tide.framework.TestAnnotatedComponent;
		public var test4:org.granite.test.tide.framework.TestComponentConversations;
		public var test5:org.granite.test.tide.framework.TestComponentConversations2;
		public var test6:org.granite.test.tide.framework.TestComponentEventScope;
		public var test7:org.granite.test.tide.framework.TestComponentInjection;
		public var test8:org.granite.test.tide.framework.TestComponentInjection2;
		public var test9:org.granite.test.tide.framework.TestComponentInjection3;
		public var test10:org.granite.test.tide.framework.TestComponentInjectionForum4314;
		public var test11:org.granite.test.tide.framework.TestComponentInjectionForum7129;
		public var test12:org.granite.test.tide.framework.TestComponentInjectionGDS471;
		public var test13:org.granite.test.tide.framework.TestComponentInjectionGDS477;
		public var test14:org.granite.test.tide.framework.TestComponentInjectionGDS480;
		public var test15:org.granite.test.tide.framework.TestComponentInjectionGDS482;
		public var test16:org.granite.test.tide.framework.TestComponentInjectionGDS676;
		public var test16b:org.granite.test.tide.framework.TestComponentInjectionGDS844;
		public var test17:org.granite.test.tide.framework.TestComponentInOut;
		public var test18:org.granite.test.tide.framework.TestComponentModules;
		public var test19:org.granite.test.tide.framework.TestComponentModules2;
		public var test20:org.granite.test.tide.framework.TestComponentNestedConversations;
		public var test21:org.granite.test.tide.framework.TestComponentNestedConversations2;
		public var test22:org.granite.test.tide.framework.TestComponentNoName;
		public var test23:org.granite.test.tide.framework.TestComponentNoName2;
		public var test24:org.granite.test.tide.framework.TestComponentObservers;
		public var test25:org.granite.test.tide.framework.TestComponentObservers2;
		public var test26:org.granite.test.tide.framework.TestComponentObservers3;
		public var test27:org.granite.test.tide.framework.TestComponentObservers4;
		public var test27b:org.granite.test.tide.framework.TestComponentObservers5;
		public var test28:org.granite.test.tide.framework.TestComponentObserversGDS549;
		public var test29:org.granite.test.tide.framework.TestComponentOutjection;
		public var test30:org.granite.test.tide.framework.TestComponentOutjectionForum3853;
		public var test31:org.granite.test.tide.framework.TestComponentOutjectionGDS427;
		public var test32:org.granite.test.tide.framework.TestComponentOutjectionGDS449;
		public var test33:org.granite.test.tide.framework.TestComponentOutjectionGDS481;
		public var test34:org.granite.test.tide.framework.TestComponentOutjectionGDS745;
		public var test35:org.granite.test.tide.framework.TestComponentProduces;
		public var test36:org.granite.test.tide.framework.TestComponentProduces2;
		public var test37:org.granite.test.tide.framework.TestComponentScan;
		public var test38:org.granite.test.tide.framework.TestComponentSubcontexts;
		public var test39:org.granite.test.tide.framework.TestComponentSubcontexts2;
		public var test40:org.granite.test.tide.framework.TestComponentSubcontexts3;
		public var test41:org.granite.test.tide.framework.TestComponentSubcontexts4;
		public var test42:org.granite.test.tide.framework.TestComponentSubcontextsGDS555;
		public var test43:org.granite.test.tide.framework.TestComponentSubcontextsGDS627;
		public var test44:org.granite.test.tide.framework.TestComponentTideModules;
		public var test45:org.granite.test.tide.framework.TestComponentTideModules2;
		public var test46:org.granite.test.tide.framework.TestSimpleComponent;
		public var test47:org.granite.test.tide.framework.TestTypedInjection;
		public var test48:org.granite.test.tide.framework.TestTypedInjection2;
		public var test49:org.granite.test.tide.framework.TestTypedInjection3;
		public var test50:org.granite.test.tide.framework.TestTypedLookup;
		public var test51:org.granite.test.tide.framework.TestTypedRemoteInjection;
		public var test52:org.granite.test.tide.framework.TestUIComponent;
		public var test53:org.granite.test.tide.framework.TestUIComponentGDS781;
		public var test54:org.granite.test.tide.framework.TestUIComponentGDS781b;
		public var test55:org.granite.test.tide.framework.TestUIComponentModules;
		public var test56:org.granite.test.tide.framework.TestEventInterceptor;
		public var test57:org.granite.test.tide.framework.TestComponentFlexModules;
	}
}