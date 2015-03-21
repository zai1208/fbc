#pragma once

#include once "rpc.bi"
#include once "rpcndr.bi"
#include once "windows.bi"
#include once "ole2.bi"
#include once "oaidl.bi"
#include once "ocidl.bi"

extern "Windows"

#define __objectarray_h__
#define __IObjectArray_FWD_DEFINED__
#define __IObjectCollection_FWD_DEFINED__
#define __IObjectArray_INTERFACE_DEFINED__

extern IID_IObjectArray as const GUID

type IObjectArray as IObjectArray_

type IObjectArrayVtbl
	QueryInterface as function(byval This as IObjectArray ptr, byval riid as const IID const ptr, byval ppvObject as any ptr ptr) as HRESULT
	AddRef as function(byval This as IObjectArray ptr) as ULONG
	Release as function(byval This as IObjectArray ptr) as ULONG
	GetCount as function(byval This as IObjectArray ptr, byval pcObjects as UINT ptr) as HRESULT
	GetAt as function(byval This as IObjectArray ptr, byval uiIndex as UINT, byval riid as const IID const ptr, byval ppv as any ptr ptr) as HRESULT
end type

type IObjectArray_
	lpVtbl as IObjectArrayVtbl ptr
end type

declare function IObjectArray_GetCount_Proxy(byval This as IObjectArray ptr, byval pcObjects as UINT ptr) as HRESULT
declare sub IObjectArray_GetCount_Stub(byval This as IRpcStubBuffer ptr, byval pRpcChannelBuffer as IRpcChannelBuffer ptr, byval pRpcMessage as PRPC_MESSAGE, byval pdwStubPhase as DWORD ptr)
declare function IObjectArray_GetAt_Proxy(byval This as IObjectArray ptr, byval uiIndex as UINT, byval riid as const IID const ptr, byval ppv as any ptr ptr) as HRESULT
declare sub IObjectArray_GetAt_Stub(byval This as IRpcStubBuffer ptr, byval pRpcChannelBuffer as IRpcChannelBuffer ptr, byval pRpcMessage as PRPC_MESSAGE, byval pdwStubPhase as DWORD ptr)

#define __IObjectCollection_INTERFACE_DEFINED__

extern IID_IObjectCollection as const GUID

type IObjectCollection as IObjectCollection_

type IObjectCollectionVtbl
	QueryInterface as function(byval This as IObjectCollection ptr, byval riid as const IID const ptr, byval ppvObject as any ptr ptr) as HRESULT
	AddRef as function(byval This as IObjectCollection ptr) as ULONG
	Release as function(byval This as IObjectCollection ptr) as ULONG
	GetCount as function(byval This as IObjectCollection ptr, byval pcObjects as UINT ptr) as HRESULT
	GetAt as function(byval This as IObjectCollection ptr, byval uiIndex as UINT, byval riid as const IID const ptr, byval ppv as any ptr ptr) as HRESULT
	AddObject as function(byval This as IObjectCollection ptr, byval punk as IUnknown ptr) as HRESULT
	AddFromArray as function(byval This as IObjectCollection ptr, byval poaSource as IObjectArray ptr) as HRESULT
	RemoveObjectAt as function(byval This as IObjectCollection ptr, byval uiIndex as UINT) as HRESULT
	Clear as function(byval This as IObjectCollection ptr) as HRESULT
end type

type IObjectCollection_
	lpVtbl as IObjectCollectionVtbl ptr
end type

declare function IObjectCollection_AddObject_Proxy(byval This as IObjectCollection ptr, byval punk as IUnknown ptr) as HRESULT
declare sub IObjectCollection_AddObject_Stub(byval This as IRpcStubBuffer ptr, byval pRpcChannelBuffer as IRpcChannelBuffer ptr, byval pRpcMessage as PRPC_MESSAGE, byval pdwStubPhase as DWORD ptr)
declare function IObjectCollection_AddFromArray_Proxy(byval This as IObjectCollection ptr, byval poaSource as IObjectArray ptr) as HRESULT
declare sub IObjectCollection_AddFromArray_Stub(byval This as IRpcStubBuffer ptr, byval pRpcChannelBuffer as IRpcChannelBuffer ptr, byval pRpcMessage as PRPC_MESSAGE, byval pdwStubPhase as DWORD ptr)
declare function IObjectCollection_RemoveObjectAt_Proxy(byval This as IObjectCollection ptr, byval uiIndex as UINT) as HRESULT
declare sub IObjectCollection_RemoveObjectAt_Stub(byval This as IRpcStubBuffer ptr, byval pRpcChannelBuffer as IRpcChannelBuffer ptr, byval pRpcMessage as PRPC_MESSAGE, byval pdwStubPhase as DWORD ptr)
declare function IObjectCollection_Clear_Proxy(byval This as IObjectCollection ptr) as HRESULT
declare sub IObjectCollection_Clear_Stub(byval This as IRpcStubBuffer ptr, byval pRpcChannelBuffer as IRpcChannelBuffer ptr, byval pRpcMessage as PRPC_MESSAGE, byval pdwStubPhase as DWORD ptr)

end extern