/* Generated by Nim Compiler v0.18.0 */
/*   (c) 2018 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Windows, amd64, gcc */
/* Command for C compiler:
   gcc.exe -c  -w -mno-ms-bitfields -DWIN32_LEAN_AND_MEAN  -I"C:\Program Files\nim\nim-0.18.0\lib" -o "C:\Users\Quinn Freedman\workspace\nim\smoke\src\nimcache\smoke_texturemanager.o" "C:\Users\Quinn Freedman\workspace\nim\smoke\src\nimcache\smoke_texturemanager.c" */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 64

#include "nimbase.h"
#include <string.h>
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef powerpc
#undef unix
typedef struct tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg;
typedef struct tySequence_F1f60FUefl9cnjVB6oVPaAg tySequence_F1f60FUefl9cnjVB6oVPaAg;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw;
typedef struct tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg;
typedef struct Exception Exception;
typedef struct RootObj RootObj;
typedef struct tySequence_uB9b75OUPRENsBAu4AnoePA tySequence_uB9b75OUPRENsBAu4AnoePA;
typedef struct tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g;
typedef struct tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w;
typedef struct tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ;
typedef struct tyObject_GcStack_7fytPA5bBsob6See21YMRA tyObject_GcStack_7fytPA5bBsob6See21YMRA;
typedef struct tyObject_MemRegion_x81NhDv59b8ercDZ9bi85jyg tyObject_MemRegion_x81NhDv59b8ercDZ9bi85jyg;
typedef struct tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ;
typedef struct tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg;
typedef struct tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw;
typedef struct tyObject_IntSet_EZObFrE3NC9bIb3YMkY9crZA tyObject_IntSet_EZObFrE3NC9bIb3YMkY9crZA;
typedef struct tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw;
typedef struct tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw;
typedef struct tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg;
typedef struct tyTuple_ujsjpB2O9cjj3uDHsXbnSzg tyTuple_ujsjpB2O9cjj3uDHsXbnSzg;
typedef struct tyObject_GcStat_0RwLoVBHZPfUAcLczmfQAg tyObject_GcStat_0RwLoVBHZPfUAcLczmfQAg;
typedef struct tyObject_CellSet_jG87P0AI9aZtss9ccTYBIISQ tyObject_CellSet_jG87P0AI9aZtss9ccTYBIISQ;
typedef struct tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg;
typedef struct tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ;
typedef struct tyTuple_13AuY8NQqaHb0AkVj2JmLg tyTuple_13AuY8NQqaHb0AkVj2JmLg;
typedef struct tyObject_StackTraceEntry_oLyohQ7O2XOvGnflOss8EA tyObject_StackTraceEntry_oLyohQ7O2XOvGnflOss8EA;
typedef struct tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w;
typedef struct tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ;
struct tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg {
tySequence_F1f60FUefl9cnjVB6oVPaAg* data;
NI counter;
};
typedef NU8 tyEnum_TNimKind_jIBKr1ejBgsfM33Kxw4j7A;
typedef NU8 tySet_tyEnum_TNimTypeFlag_v8QUszD1sWlSIWZz7mC4bQ;
typedef N_NIMCALL_PTR(void, tyProc_ojoeKfW4VYIm36I9cpDTQIg) (void* p, NI op);
typedef N_NIMCALL_PTR(void*, tyProc_WSm2xU5ARYv9aAR4l0z9c9auQ) (void* p);
struct TNimType {
NI size;
tyEnum_TNimKind_jIBKr1ejBgsfM33Kxw4j7A kind;
tySet_tyEnum_TNimTypeFlag_v8QUszD1sWlSIWZz7mC4bQ flags;
TNimType* base;
TNimNode* node;
void* finalizer;
tyProc_ojoeKfW4VYIm36I9cpDTQIg marker;
tyProc_WSm2xU5ARYv9aAR4l0z9c9auQ deepcopy;
};
typedef NU8 tyEnum_TNimNodeKind_unfNsxrcATrufDZmpBq4HQ;
struct TNimNode {
tyEnum_TNimNodeKind_unfNsxrcATrufDZmpBq4HQ kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
typedef N_NIMCALL_PTR(void, tyProc_T4eqaYlFJYZUv9aG9b1TV0bQ) (void);
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef N_CDECL_PTR(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*, tyProc_0icUM9coigCdz0HL3vd9bFCw) (tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, NCSTRING file);
struct RootObj {
TNimType* m_type;
};
struct Exception {
  RootObj Sup;
Exception* parent;
NCSTRING name;
NimStringDesc* message;
tySequence_uB9b75OUPRENsBAu4AnoePA* trace;
Exception* up;
};
struct tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg {
  Exception Sup;
};
struct tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g {
NI refcount;
TNimType* typ;
};
struct tyObject_GcStack_7fytPA5bBsob6See21YMRA {
void* bottom;
};
struct tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w {
NI len;
NI cap;
tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g** d;
};
typedef tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ* tyArray_SiRwrEKZdLgxqz9a9aoVBglg[512];
typedef NU32 tyArray_BHbOSqU1t9b3Gt7K2c6fQig[24];
typedef tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg* tyArray_N1u1nqOgmuJN9cSZrnMHgOQ[32];
typedef tyArray_N1u1nqOgmuJN9cSZrnMHgOQ tyArray_B6durA4ZCi1xjJvRtyYxMg[24];
typedef tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw* tyArray_lh2A89ahMmYg9bCmpVaplLbA[256];
struct tyObject_IntSet_EZObFrE3NC9bIb3YMkY9crZA {
tyArray_lh2A89ahMmYg9bCmpVaplLbA data;
};
typedef tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* tyArray_0aOLqZchNi8nWtMTi8ND8w[2];
struct tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw {
tyArray_0aOLqZchNi8nWtMTi8ND8w link;
NI key;
NI upperBound;
NI level;
};
struct tyTuple_ujsjpB2O9cjj3uDHsXbnSzg {
tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg* Field0;
NI Field1;
};
typedef tyTuple_ujsjpB2O9cjj3uDHsXbnSzg tyArray_LzOv2eCDGiceMKQstCLmhw[30];
struct tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg {
NI len;
tyArray_LzOv2eCDGiceMKQstCLmhw chunks;
tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg* next;
};
struct tyObject_MemRegion_x81NhDv59b8ercDZ9bi85jyg {
NI minLargeObj;
NI maxLargeObj;
tyArray_SiRwrEKZdLgxqz9a9aoVBglg freeSmallChunks;
NU32 flBitmap;
tyArray_BHbOSqU1t9b3Gt7K2c6fQig slBitmap;
tyArray_B6durA4ZCi1xjJvRtyYxMg matrix;
tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw* llmem;
NI currMem;
NI maxMem;
NI freeMem;
NI occ;
NI lastSize;
tyObject_IntSet_EZObFrE3NC9bIb3YMkY9crZA chunkStarts;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* root;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* deleted;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* last;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* freeAvlNodes;
NIM_BOOL locked;
NIM_BOOL blockChunkSizeIncrease;
NI nextChunkSize;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw bottomData;
tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg heapLinks;
};
struct tyObject_GcStat_0RwLoVBHZPfUAcLczmfQAg {
NI stackScans;
NI cycleCollections;
NI maxThreshold;
NI maxStackSize;
NI maxStackCells;
NI cycleTableSize;
NI64 maxPause;
};
struct tyObject_CellSet_jG87P0AI9aZtss9ccTYBIISQ {
NI counter;
NI max;
tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg* head;
tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg** data;
};
struct tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ {
tyObject_GcStack_7fytPA5bBsob6See21YMRA stack;
NI cycleThreshold;
tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w zct;
tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w decStack;
tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w tempStack;
NI recGcLock;
tyObject_MemRegion_x81NhDv59b8ercDZ9bi85jyg region;
tyObject_GcStat_0RwLoVBHZPfUAcLczmfQAg stat;
tyObject_CellSet_jG87P0AI9aZtss9ccTYBIISQ marked;
tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w additionalRoots;
NI gcThreadId;
};
struct tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ {
int Field0;
int Field1;
int Field2;
int Field3;
};
typedef tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* tyArray_hKWUHwTk1v9czArAhXNDwGQ[3];
typedef NU8 tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg;
struct tyTuple_13AuY8NQqaHb0AkVj2JmLg {
NI Field0;
NimStringDesc* Field1;
tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* Field2;
};
struct tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw {
char dummy;
};
struct tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg {
char dummy;
};
struct tyObject_StackTraceEntry_oLyohQ7O2XOvGnflOss8EA {
NCSTRING procname;
NI line;
NCSTRING filename;
};
struct tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w {
NI prevSize;
NI size;
};
struct tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ {
  tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w Sup;
tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ* next;
tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ* prev;
tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ* freeList;
NI free;
NI acc;
NF data;
};
struct tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg {
  tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w Sup;
tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg* next;
tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg* prev;
NF data;
};
struct tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw {
NI size;
NI acc;
tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw* next;
};
typedef NI tyArray_9a8QARi5WsUggNU9bom7kzTQ[8];
struct tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw {
tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw* next;
NI key;
tyArray_9a8QARi5WsUggNU9bom7kzTQ bits;
};
struct tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg {
tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg* next;
NI key;
tyArray_9a8QARi5WsUggNU9bom7kzTQ bits;
};
struct tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ {
tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ* next;
NI zeroField;
};
struct tySequence_F1f60FUefl9cnjVB6oVPaAg {
  TGenericSeq Sup;
  tyTuple_13AuY8NQqaHb0AkVj2JmLg data[SEQ_DECL_SIZE];
};
struct tySequence_uB9b75OUPRENsBAu4AnoePA {
  TGenericSeq Sup;
  tyObject_StackTraceEntry_oLyohQ7O2XOvGnflOss8EA data[SEQ_DECL_SIZE];
};
N_NIMCALL(void, nimGCvisit)(void* d, NI op);
static N_NIMCALL(void, TM_eqrzk6G2oN7lSmd5IYMJGQ_2)(void);
N_NIMCALL(void, nimRegisterGlobalMarker)(tyProc_T4eqaYlFJYZUv9aG9b1TV0bQ markerProc);
N_LIB_PRIVATE N_NIMCALL(void, initTable_tnu817NNWmFrDPZKQ8NzQw)(NI initialSize, tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg* Result);
N_LIB_PRIVATE N_NIMCALL(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*, cachedLoadTexture_ONNEmCqFdSCfwZQZaTkQkw)(tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, NimStringDesc* path);
N_LIB_PRIVATE N_NIMCALL(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*, getOrDefault_LZc3gFzysk8TK31rUBi44A)(tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg t, NimStringDesc* key);
static N_NIMCALL(void, Marker_tyRef_9b5AhMUqhPjXKDNyH59cC0Bw)(void* p, NI op);
N_NIMCALL(void*, newObj)(TNimType* typ, NI size);
static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src);
static N_INLINE(void, copyMem_E1xtACub5WcDa3vbrIXbwgsystem)(void* dest, void* source, NI size);
N_NIMCALL(NimStringDesc*, rawNewString)(NI space);
static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src);
static N_INLINE(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*, usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem)(void* usr);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, stackOverflow_II46IjNZztN9bmbxUD8dt8g)(void);
static N_INLINE(void, popFrame)(void);
static N_INLINE(void, rtlAddZCT_MV4BBk6J1qu70IbBxwEn4w_2system)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
N_LIB_PRIVATE N_NOINLINE(void, addZCT_fCDI7oO1NNVXXURtxSzsRw)(tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w* s, tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
static N_INLINE(void, asgnRef)(void** dest, void* src);
static N_INLINE(void, incRef_9cAA5YuQAAC3MVbnGeV86swsystem)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
static N_INLINE(void, decRef_MV4BBk6J1qu70IbBxwEn4wsystem)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
N_NIMCALL(void, raiseException)(Exception* e, NCSTRING ename);
N_LIB_PRIVATE N_NIMCALL(void, X5BX5Deq__xeFqSPTflRS9csAEcZP5mig)(tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg* t, NimStringDesc* key, tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* val);
N_LIB_PRIVATE N_NIMCALL(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, tile_Fl5v9anz9cS9cURC79cYkYezMQ)(NI x, NI y);
static N_INLINE(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, newSdlSquare_mKM48VTwEP7kEujb4tDg9aAutils)(NI x, NI y, NI w);
static N_INLINE(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, newSdlRect_pa4EWXFGguTRJoHOGgvabQutils)(NI x, NI y, NI w, NI h);
N_LIB_PRIVATE N_CDECL(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, rect_GH33Rh9bTnVBRLuu9bU7xoyA)(int x, int y, int w, int h);
static N_INLINE(NI, chckRange)(NI i, NI a, NI b);
N_NOINLINE(void, raiseRangeError)(NI64 val);
N_NIMCALL(NI, mulInt)(NI a, NI b);
N_LIB_PRIVATE N_NIMCALL(void, initTextures_xjuQgNudGUsJtj4WFwNtZg)(tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer);
N_NIMCALL(NimStringDesc*, reprEnum)(NI e, TNimType* typ);
static N_INLINE(NI, addInt)(NI a, NI b);
N_NOINLINE(void, raiseOverflow)(void);
static N_INLINE(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*, getTexture_J5l0aFM6bQoaFrDM6KOZSwtexturemanager)(tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg texture);
static N_INLINE(NI, rawGet_gUAyJNRzLADJ2gGOUlXl5Atables)(tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg t, NimStringDesc* key, NI* hc);
N_LIB_PRIVATE N_NIMCALL(NI, hash_uBstFm5SYVQeOL3j9c9bc58A)(NimStringDesc* x);
static N_INLINE(NIM_BOOL, isFilled_IxXD1UAPoEehVDW9cv9cRaew_2tables)(NI hcode);
N_NOINLINE(void, raiseIndexError)(void);
static N_INLINE(NIM_BOOL, eqStrings)(NimStringDesc* a, NimStringDesc* b);
static N_INLINE(NIM_BOOL, equalMem_fmeFeLBvgmAHG9bC8ETS9bYQsystem)(void* a, void* b, NI size);
static N_INLINE(NI, nextTry_OLPhxSyW9bte5CwHzzQVhfAtables)(NI h, NI maxHash);
static N_INLINE(NI, subInt)(NI a, NI b);
N_LIB_PRIVATE N_NIMCALL(void, enlarge_PyQ4CtSJ9cSVmIDNUFpohmw)(tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg* t);
N_LIB_PRIVATE N_NIMCALL(void, rawInsert_2kK544j0BcFXDrwZV9bx9cEA)(tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg* t, tySequence_F1f60FUefl9cnjVB6oVPaAg** data, NimStringDesc* key, tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* val, NI hc, NI h);
static N_INLINE(NI, rawGetKnownHC_gmPfh0xvkm9aFDOwc0Vfypwtables)(tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg t, NimStringDesc* key, NI hc);
tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg TEXTURE_LOADER_CACHE_j9cNIdzy66wIt5sCHotygUw;
extern TNimType NTI_9b9bp4HUMBbrqlMbChWLcmDg_;
extern tyProc_0icUM9coigCdz0HL3vd9bFCw Dl_149621_;
extern TNimType NTI_bAvOj2UcojKN87yAQLs0aw_;
TNimType NTI_tPG18ppKthHWRNviKh8vXg_;
TNimType NTI_9b5AhMUqhPjXKDNyH59cC0Bw_;
extern TFrame* framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
extern tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ gch_IcYaEuuWivYAS86vFMTS3Q;
tyArray_hKWUHwTk1v9czArAhXNDwGQ texturStore_mFEFu2Ou8gDx9cjhucporVg;
TNimType NTI_UJxzDYlgEwaOU2Pq1XABRg_;
STRING_LITERAL(TM_eqrzk6G2oN7lSmd5IYMJGQ_3, "File not found: ", 16);
NIM_CONST tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ DIRT1_Z00DKAF9akgekLkJNsP3zUw = {((int) 0),
((int) 0),
((int) 32),
((int) 32)}
;
NIM_CONST tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ DIRT2_6k4RmsYW9acnMkHqXaZBwSw = {((int) 32),
((int) 0),
((int) 32),
((int) 32)}
;
NIM_CONST tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ DIRT3_cxXRUPS5z8HAB0bPV8O0SQ = {((int) 64),
((int) 0),
((int) 32),
((int) 32)}
;
NIM_CONST tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ DIRT4_tankLBdxpCOKSV9anFMzAXg = {((int) 96),
((int) 0),
((int) 32),
((int) 32)}
;
NIM_CONST tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ DIRT5_Sp7IqVzjl2lIdSfzAl1TMg = {((int) 128),
((int) 0),
((int) 32),
((int) 32)}
;
NIM_CONST tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ DIRT6_v6Yok1Etu89bTEnzx1M0sSA = {((int) 160),
((int) 0),
((int) 32),
((int) 32)}
;
NIM_CONST tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ GRASS1_8S7Vu3fYt5q9cBu4S4Ewttw = {((int) 0),
((int) 32),
((int) 32),
((int) 32)}
;
static N_NIMCALL(void, TM_eqrzk6G2oN7lSmd5IYMJGQ_2)(void) {
	nimGCvisit((void*)TEXTURE_LOADER_CACHE_j9cNIdzy66wIt5sCHotygUw.data, 0);
}
static N_NIMCALL(void, Marker_tyRef_9b5AhMUqhPjXKDNyH59cC0Bw)(void* p, NI op) {
	tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg* a;
	a = (tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg*)p;
	nimGCvisit((void*)(*a).Sup.parent, op);
	nimGCvisit((void*)(*a).Sup.message, op);
	nimGCvisit((void*)(*a).Sup.trace, op);
	nimGCvisit((void*)(*a).Sup.up, op);
}

static N_INLINE(void, copyMem_E1xtACub5WcDa3vbrIXbwgsystem)(void* dest, void* source, NI size) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memcpy(dest, source, ((size_t) (size)));
}

static N_INLINE(void, appendString)(NimStringDesc* dest, NimStringDesc* src) {
	copyMem_E1xtACub5WcDa3vbrIXbwgsystem(((void*) ((&(*dest).data[((*dest).Sup.len)- 0]))), ((void*) ((*src).data)), ((NI) ((NI)((*src).Sup.len + ((NI) 1)))));
	(*dest).Sup.len += (*src).Sup.len;
}

static N_INLINE(void, nimFrame)(TFrame* s) {
	NI T1_;
	T1_ = (NI)0;
	{
		if (!(framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw == NIM_NIL)) goto LA4_;
		T1_ = ((NI) 0);
	}
	goto LA2_;
	LA4_: ;
	{
		T1_ = ((NI) ((NI16)((*framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw).calldepth + ((NI16) 1))));
	}
	LA2_: ;
	(*s).calldepth = ((NI16) (T1_));
	(*s).prev = framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
	framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw = s;
	{
		if (!((*s).calldepth == ((NI16) 2000))) goto LA9_;
		stackOverflow_II46IjNZztN9bmbxUD8dt8g();
	}
	LA9_: ;
}

static N_INLINE(void, popFrame)(void) {
	framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw = (*framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw).prev;
}

static N_INLINE(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*, usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem)(void* usr) {
	tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* result;
	nimfr_("usrToCell", "gc.nim");
	result = (tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*)0;
	nimln_(132, "gc.nim");
	result = ((tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*) ((NI)((NU64)(((NI) (ptrdiff_t) (usr))) - (NU64)(((NI)sizeof(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g))))));
	popFrame();
	return result;
}

static N_INLINE(void, rtlAddZCT_MV4BBk6J1qu70IbBxwEn4w_2system)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c) {
	nimfr_("rtlAddZCT", "gc.nim");
	nimln_(211, "gc.nim");
	addZCT_fCDI7oO1NNVXXURtxSzsRw((&gch_IcYaEuuWivYAS86vFMTS3Q.zct), c);
	popFrame();
}

static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src) {
	nimfr_("asgnRefNoCycle", "gc.nim");
	nimln_(271, "gc.nim");
	{
		tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c;
		nimln_(398, "system.nim");
		nimln_(271, "gc.nim");
		if (!!((src == NIM_NIL))) goto LA3_;
		nimln_(272, "gc.nim");
		c = usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem(src);
		nimln_(273, "gc.nim");
		(*c).refcount += ((NI) 8);
	}
	LA3_: ;
	nimln_(274, "gc.nim");
	{
		tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c_2;
		nimln_(398, "system.nim");
		nimln_(274, "gc.nim");
		if (!!(((*dest) == NIM_NIL))) goto LA7_;
		nimln_(275, "gc.nim");
		c_2 = usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem((*dest));
		nimln_(276, "gc.nim");
		{
			(*c_2).refcount -= ((NI) 8);
			if (!((NU64)((*c_2).refcount) < (NU64)(((NI) 8)))) goto LA11_;
			nimln_(277, "gc.nim");
			rtlAddZCT_MV4BBk6J1qu70IbBxwEn4w_2system(c_2);
		}
		LA11_: ;
	}
	LA7_: ;
	nimln_(278, "gc.nim");
	(*dest) = src;
	popFrame();
}

static N_INLINE(void, incRef_9cAA5YuQAAC3MVbnGeV86swsystem)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c) {
	nimfr_("incRef", "gc.nim");
	nimln_(191, "gc.nim");
	(*c).refcount = (NI)((NU64)((*c).refcount) + (NU64)(((NI) 8)));
	popFrame();
}

static N_INLINE(void, decRef_MV4BBk6J1qu70IbBxwEn4wsystem)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c) {
	nimfr_("decRef", "gc.nim");
	nimln_(218, "gc.nim");
	{
		(*c).refcount -= ((NI) 8);
		if (!((NU64)((*c).refcount) < (NU64)(((NI) 8)))) goto LA3_;
		nimln_(219, "gc.nim");
		rtlAddZCT_MV4BBk6J1qu70IbBxwEn4w_2system(c);
	}
	LA3_: ;
	popFrame();
}

static N_INLINE(void, asgnRef)(void** dest, void* src) {
	nimfr_("asgnRef", "gc.nim");
	nimln_(264, "gc.nim");
	{
		tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* T5_;
		nimln_(398, "system.nim");
		nimln_(264, "gc.nim");
		if (!!((src == NIM_NIL))) goto LA3_;
		T5_ = (tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*)0;
		T5_ = usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem(src);
		incRef_9cAA5YuQAAC3MVbnGeV86swsystem(T5_);
	}
	LA3_: ;
	nimln_(265, "gc.nim");
	{
		tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* T10_;
		nimln_(398, "system.nim");
		nimln_(265, "gc.nim");
		if (!!(((*dest) == NIM_NIL))) goto LA8_;
		T10_ = (tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*)0;
		T10_ = usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem((*dest));
		decRef_MV4BBk6J1qu70IbBxwEn4wsystem(T10_);
	}
	LA8_: ;
	nimln_(266, "gc.nim");
	(*dest) = src;
	popFrame();
}

N_LIB_PRIVATE N_NIMCALL(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*, cachedLoadTexture_ONNEmCqFdSCfwZQZaTkQkw)(tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, NimStringDesc* path) {
	tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* result;
	nimfr_("cachedLoadTexture", "texturemanager.nim");
	result = (tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*)0;
	nimln_(16, "texturemanager.nim");
	result = getOrDefault_LZc3gFzysk8TK31rUBi44A(TEXTURE_LOADER_CACHE_j9cNIdzy66wIt5sCHotygUw, path);
	nimln_(17, "texturemanager.nim");
	{
		if (!(result == 0)) goto LA3_;
		nimln_(18, "texturemanager.nim");
		result = Dl_149621_(renderer, path->data);
		nimln_(19, "texturemanager.nim");
		{
			tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg* e;
			NimStringDesc* T9_;
			if (!(result == 0)) goto LA7_;
			e = (tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg*)0;
			nimln_(2811, "system.nim");
			e = (tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg*) newObj((&NTI_9b5AhMUqhPjXKDNyH59cC0Bw_), sizeof(tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg));
			(*e).Sup.Sup.m_type = (&NTI_tPG18ppKthHWRNviKh8vXg_);
			nimln_(20, "texturemanager.nim");
			T9_ = (NimStringDesc*)0;
			T9_ = rawNewString(path->Sup.len + 16);
appendString(T9_, ((NimStringDesc*) &TM_eqrzk6G2oN7lSmd5IYMJGQ_3));
appendString(T9_, path);
			asgnRefNoCycle((void**) (&(*e).Sup.message), T9_);
			nimln_(2806, "system.nim");
			asgnRef((void**) (&(*e).Sup.parent), NIM_NIL);
			nimln_(20, "texturemanager.nim");
			raiseException((Exception*)e, "FileNotFoundError");
		}
		LA7_: ;
		nimln_(21, "texturemanager.nim");
		X5BX5Deq__xeFqSPTflRS9csAEcZP5mig((&TEXTURE_LOADER_CACHE_j9cNIdzy66wIt5sCHotygUw), path, result);
	}
	LA3_: ;
	popFrame();
	return result;
}

static N_INLINE(NI, chckRange)(NI i, NI a, NI b) {
	NI result;
{	result = (NI)0;
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (a <= i);
		if (!(T3_)) goto LA4_;
		T3_ = (i <= b);
		LA4_: ;
		if (!T3_) goto LA5_;
		result = i;
		goto BeforeRet_;
	}
	goto LA1_;
	LA5_: ;
	{
		raiseRangeError(((NI64) (i)));
	}
	LA1_: ;
	}BeforeRet_: ;
	return result;
}

static N_INLINE(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, newSdlRect_pa4EWXFGguTRJoHOGgvabQutils)(NI x, NI y, NI w, NI h) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ result;
	nimfr_("newSdlRect", "utils.nim");
	memset((void*)(&result), 0, sizeof(result));
	nimln_(4, "utils.nim");
	result = rect_GH33Rh9bTnVBRLuu9bU7xoyA(((int)chckRange(x, ((int) (-2147483647 -1)), ((int) 2147483647))), ((int)chckRange(y, ((int) (-2147483647 -1)), ((int) 2147483647))), ((int)chckRange(w, ((int) (-2147483647 -1)), ((int) 2147483647))), ((int)chckRange(h, ((int) (-2147483647 -1)), ((int) 2147483647))));
	popFrame();
	return result;
}

static N_INLINE(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, newSdlSquare_mKM48VTwEP7kEujb4tDg9aAutils)(NI x, NI y, NI w) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ result;
	nimfr_("newSdlSquare", "utils.nim");
	memset((void*)(&result), 0, sizeof(result));
	nimln_(7, "utils.nim");
	result = newSdlRect_pa4EWXFGguTRJoHOGgvabQutils(x, y, w, w);
	popFrame();
	return result;
}

N_LIB_PRIVATE N_NIMCALL(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, tile_Fl5v9anz9cS9cURC79cYkYezMQ)(NI x, NI y) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ result;
	NI TM_eqrzk6G2oN7lSmd5IYMJGQ_4;
	NI TM_eqrzk6G2oN7lSmd5IYMJGQ_5;
	nimfr_("tile", "texturemanager.nim");
	memset((void*)(&result), 0, sizeof(result));
	nimln_(34, "texturemanager.nim");
	TM_eqrzk6G2oN7lSmd5IYMJGQ_4 = mulInt(x, ((NI) 32));
	TM_eqrzk6G2oN7lSmd5IYMJGQ_5 = mulInt(y, ((NI) 32));
	result = newSdlSquare_mKM48VTwEP7kEujb4tDg9aAutils((NI)(TM_eqrzk6G2oN7lSmd5IYMJGQ_4), (NI)(TM_eqrzk6G2oN7lSmd5IYMJGQ_5), ((NI) 32));
	popFrame();
	return result;
}

static N_INLINE(NI, addInt)(NI a, NI b) {
	NI result;
{	result = (NI)0;
	result = (NI)((NU64)(a) + (NU64)(b));
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (((NI) 0) <= (NI)(result ^ a));
		if (T3_) goto LA4_;
		T3_ = (((NI) 0) <= (NI)(result ^ b));
		LA4_: ;
		if (!T3_) goto LA5_;
		goto BeforeRet_;
	}
	LA5_: ;
	raiseOverflow();
	}BeforeRet_: ;
	return result;
}

N_LIB_PRIVATE N_NIMCALL(void, initTextures_xjuQgNudGUsJtj4WFwNtZg)(tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer) {
	nimfr_("initTextures", "texturemanager.nim");
	{
		tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg t;
		t = (tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg)0;
		{
			tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg v;
			NI res;
			v = (tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg)0;
			nimln_(2045, "system.nim");
			res = ((NI) 0);
			{
				nimln_(2046, "system.nim");
				while (1) {
					NI TM_eqrzk6G2oN7lSmd5IYMJGQ_9;
					if (!(res <= ((NI) 2))) goto LA4;
					nimln_(2047, "system.nim");
					v = ((tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg)chckRange(res, ((tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg) 0), ((tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg) 2)));
					nimln_(2241, "system.nim");
					t = v;
					nimln_(51, "texturemanager.nim");
					texturStore_mFEFu2Ou8gDx9cjhucporVg[(t)- 0] = cachedLoadTexture_ONNEmCqFdSCfwZQZaTkQkw(renderer, reprEnum((NI)t, (&NTI_UJxzDYlgEwaOU2Pq1XABRg_)));
					nimln_(2048, "system.nim");
					TM_eqrzk6G2oN7lSmd5IYMJGQ_9 = addInt(res, ((NI) 1));
					res = (NI)(TM_eqrzk6G2oN7lSmd5IYMJGQ_9);
				} LA4: ;
			}
		}
	}
	popFrame();
}

static N_INLINE(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*, getTexture_J5l0aFM6bQoaFrDM6KOZSwtexturemanager)(tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg texture) {
	tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* result;
	nimfr_("getTexture", "texturemanager.nim");
	result = (tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*)0;
	nimln_(54, "texturemanager.nim");
	result = texturStore_mFEFu2Ou8gDx9cjhucporVg[(texture)- 0];
	popFrame();
	return result;
}

static N_INLINE(NIM_BOOL, isFilled_IxXD1UAPoEehVDW9cv9cRaew_2tables)(NI hcode) {
	NIM_BOOL result;
	nimfr_("isFilled", "tableimpl.nim");
	result = (NIM_BOOL)0;
	nimln_(18, "tableimpl.nim");
	nimln_(398, "system.nim");
	nimln_(18, "tableimpl.nim");
	result = !((hcode == ((NI) 0)));
	popFrame();
	return result;
}

static N_INLINE(NIM_BOOL, equalMem_fmeFeLBvgmAHG9bC8ETS9bYQsystem)(void* a, void* b, NI size) {
	NIM_BOOL result;
	int T1_;
	result = (NIM_BOOL)0;
	T1_ = (int)0;
	T1_ = memcmp(a, b, ((size_t) (size)));
	result = (T1_ == ((NI32) 0));
	return result;
}

static N_INLINE(NIM_BOOL, eqStrings)(NimStringDesc* a, NimStringDesc* b) {
	NIM_BOOL result;
	NIM_BOOL T11_;
{	result = (NIM_BOOL)0;
	{
		if (!(a == b)) goto LA3_;
		result = NIM_TRUE;
		goto BeforeRet_;
	}
	LA3_: ;
	{
		NIM_BOOL T7_;
		T7_ = (NIM_BOOL)0;
		T7_ = (a == NIM_NIL);
		if (T7_) goto LA8_;
		T7_ = (b == NIM_NIL);
		LA8_: ;
		if (!T7_) goto LA9_;
		result = NIM_FALSE;
		goto BeforeRet_;
	}
	LA9_: ;
	T11_ = (NIM_BOOL)0;
	T11_ = ((*a).Sup.len == (*b).Sup.len);
	if (!(T11_)) goto LA12_;
	T11_ = equalMem_fmeFeLBvgmAHG9bC8ETS9bYQsystem(((void*) ((*a).data)), ((void*) ((*b).data)), ((NI) ((*a).Sup.len)));
	LA12_: ;
	result = T11_;
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}

static N_INLINE(NI, nextTry_OLPhxSyW9bte5CwHzzQVhfAtables)(NI h, NI maxHash) {
	NI result;
	NI TM_eqrzk6G2oN7lSmd5IYMJGQ_10;
	nimfr_("nextTry", "tableimpl.nim");
	result = (NI)0;
	nimln_(28, "tableimpl.nim");
	TM_eqrzk6G2oN7lSmd5IYMJGQ_10 = addInt(h, ((NI) 1));
	result = (NI)((NI)(TM_eqrzk6G2oN7lSmd5IYMJGQ_10) & maxHash);
	popFrame();
	return result;
}

static N_INLINE(NI, subInt)(NI a, NI b) {
	NI result;
{	result = (NI)0;
	result = (NI)((NU64)(a) - (NU64)(b));
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (((NI) 0) <= (NI)(result ^ a));
		if (T3_) goto LA4_;
		T3_ = (((NI) 0) <= (NI)(result ^ (NI)((NU64) ~(b))));
		LA4_: ;
		if (!T3_) goto LA5_;
		goto BeforeRet_;
	}
	LA5_: ;
	raiseOverflow();
	}BeforeRet_: ;
	return result;
}

static N_INLINE(NI, rawGet_gUAyJNRzLADJ2gGOUlXl5Atables)(tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg t, NimStringDesc* key, NI* hc) {
	NI result;
	NI h;
	NI T5_;
	NI TM_eqrzk6G2oN7lSmd5IYMJGQ_11;
	nimfr_("rawGet", "tableimpl.nim");
{	result = (NI)0;
	nimln_(53, "tableimpl.nim");
	(*hc) = hash_uBstFm5SYVQeOL3j9c9bc58A(key);
	{
		if (!((*hc) == ((NI) 0))) goto LA3_;
		nimln_(45, "tableimpl.nim");
		(*hc) = ((NI) 314159265);
	}
	LA3_: ;
	nimln_(31, "tableimpl.nim");
	nimln_(116, "tables.nim");
	T5_ = (t.data ? (t.data->Sup.len-1) : -1);
	h = (NI)((*hc) & T5_);
	{
		nimln_(32, "tableimpl.nim");
		while (1) {
			NIM_BOOL T8_;
			NI T15_;
			if ((NU)(h) >= (NU)(t.data->Sup.len)) raiseIndexError();
			T8_ = (NIM_BOOL)0;
			T8_ = isFilled_IxXD1UAPoEehVDW9cv9cRaew_2tables(t.data->data[h].Field0);
			if (!T8_) goto LA7;
			nimln_(37, "tableimpl.nim");
			{
				NIM_BOOL T11_;
				T11_ = (NIM_BOOL)0;
				if ((NU)(h) >= (NU)(t.data->Sup.len)) raiseIndexError();
				T11_ = (t.data->data[h].Field0 == (*hc));
				if (!(T11_)) goto LA12_;
				if ((NU)(h) >= (NU)(t.data->Sup.len)) raiseIndexError();
				T11_ = eqStrings(t.data->data[h].Field1, key);
				LA12_: ;
				if (!T11_) goto LA13_;
				nimln_(38, "tableimpl.nim");
				result = h;
				goto BeforeRet_;
			}
			LA13_: ;
			nimln_(39, "tableimpl.nim");
			nimln_(116, "tables.nim");
			T15_ = (t.data ? (t.data->Sup.len-1) : -1);
			h = nextTry_OLPhxSyW9bte5CwHzzQVhfAtables(h, T15_);
		} LA7: ;
	}
	nimln_(40, "tableimpl.nim");
	TM_eqrzk6G2oN7lSmd5IYMJGQ_11 = subInt(((NI) -1), h);
	result = (NI)(TM_eqrzk6G2oN7lSmd5IYMJGQ_11);
	}BeforeRet_: ;
	popFrame();
	return result;
}

static N_INLINE(NI, rawGetKnownHC_gmPfh0xvkm9aFDOwc0Vfypwtables)(tyObject_Table_9b9bp4HUMBbrqlMbChWLcmDg t, NimStringDesc* key, NI hc) {
	NI result;
	NI h;
	NI T1_;
	NI TM_eqrzk6G2oN7lSmd5IYMJGQ_12;
	nimfr_("rawGetKnownHC", "tableimpl.nim");
{	result = (NI)0;
	nimln_(31, "tableimpl.nim");
	nimln_(116, "tables.nim");
	T1_ = (t.data ? (t.data->Sup.len-1) : -1);
	h = (NI)(hc & T1_);
	{
		nimln_(32, "tableimpl.nim");
		while (1) {
			NIM_BOOL T4_;
			NI T11_;
			if ((NU)(h) >= (NU)(t.data->Sup.len)) raiseIndexError();
			T4_ = (NIM_BOOL)0;
			T4_ = isFilled_IxXD1UAPoEehVDW9cv9cRaew_2tables(t.data->data[h].Field0);
			if (!T4_) goto LA3;
			nimln_(37, "tableimpl.nim");
			{
				NIM_BOOL T7_;
				T7_ = (NIM_BOOL)0;
				if ((NU)(h) >= (NU)(t.data->Sup.len)) raiseIndexError();
				T7_ = (t.data->data[h].Field0 == hc);
				if (!(T7_)) goto LA8_;
				if ((NU)(h) >= (NU)(t.data->Sup.len)) raiseIndexError();
				T7_ = eqStrings(t.data->data[h].Field1, key);
				LA8_: ;
				if (!T7_) goto LA9_;
				nimln_(38, "tableimpl.nim");
				result = h;
				goto BeforeRet_;
			}
			LA9_: ;
			nimln_(39, "tableimpl.nim");
			nimln_(116, "tables.nim");
			T11_ = (t.data ? (t.data->Sup.len-1) : -1);
			h = nextTry_OLPhxSyW9bte5CwHzzQVhfAtables(h, T11_);
		} LA3: ;
	}
	nimln_(40, "tableimpl.nim");
	TM_eqrzk6G2oN7lSmd5IYMJGQ_12 = subInt(((NI) -1), h);
	result = (NI)(TM_eqrzk6G2oN7lSmd5IYMJGQ_12);
	}BeforeRet_: ;
	popFrame();
	return result;
}
NIM_EXTERNC N_NOINLINE(void, smoke_texturemanagerInit000)(void) {
	nimfr_("texturemanager", "texturemanager.nim");
nimRegisterGlobalMarker(TM_eqrzk6G2oN7lSmd5IYMJGQ_2);
	nimln_(12, "texturemanager.nim");
	initTable_tnu817NNWmFrDPZKQ8NzQw(((NI) 64), (&TEXTURE_LOADER_CACHE_j9cNIdzy66wIt5sCHotygUw));
	popFrame();
}

NIM_EXTERNC N_NOINLINE(void, smoke_texturemanagerDatInit000)(void) {
static TNimNode* TM_eqrzk6G2oN7lSmd5IYMJGQ_6[3];
NI TM_eqrzk6G2oN7lSmd5IYMJGQ_8;
static char* NIM_CONST TM_eqrzk6G2oN7lSmd5IYMJGQ_7[3] = {
"assets/images/texturesheet.png", 
"assets/images/spritesheets/base_human_female.png", 
"assets/images/spritesheets/base_human_male.png"};
static TNimNode TM_eqrzk6G2oN7lSmd5IYMJGQ_0[5];
NTI_tPG18ppKthHWRNviKh8vXg_.size = sizeof(tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg);
NTI_tPG18ppKthHWRNviKh8vXg_.kind = 17;
NTI_tPG18ppKthHWRNviKh8vXg_.base = (&NTI_bAvOj2UcojKN87yAQLs0aw_);
TM_eqrzk6G2oN7lSmd5IYMJGQ_0[0].len = 0; TM_eqrzk6G2oN7lSmd5IYMJGQ_0[0].kind = 2;
NTI_tPG18ppKthHWRNviKh8vXg_.node = &TM_eqrzk6G2oN7lSmd5IYMJGQ_0[0];
NTI_9b5AhMUqhPjXKDNyH59cC0Bw_.size = sizeof(tyObject_FileNotFoundError_tPG18ppKthHWRNviKh8vXg*);
NTI_9b5AhMUqhPjXKDNyH59cC0Bw_.kind = 22;
NTI_9b5AhMUqhPjXKDNyH59cC0Bw_.base = (&NTI_tPG18ppKthHWRNviKh8vXg_);
NTI_9b5AhMUqhPjXKDNyH59cC0Bw_.marker = Marker_tyRef_9b5AhMUqhPjXKDNyH59cC0Bw;
NTI_UJxzDYlgEwaOU2Pq1XABRg_.size = sizeof(tyEnum_TextureAlias_UJxzDYlgEwaOU2Pq1XABRg);
NTI_UJxzDYlgEwaOU2Pq1XABRg_.kind = 14;
NTI_UJxzDYlgEwaOU2Pq1XABRg_.base = 0;
NTI_UJxzDYlgEwaOU2Pq1XABRg_.flags = 3;
for (TM_eqrzk6G2oN7lSmd5IYMJGQ_8 = 0; TM_eqrzk6G2oN7lSmd5IYMJGQ_8 < 3; TM_eqrzk6G2oN7lSmd5IYMJGQ_8++) {
TM_eqrzk6G2oN7lSmd5IYMJGQ_0[TM_eqrzk6G2oN7lSmd5IYMJGQ_8+1].kind = 1;
TM_eqrzk6G2oN7lSmd5IYMJGQ_0[TM_eqrzk6G2oN7lSmd5IYMJGQ_8+1].offset = TM_eqrzk6G2oN7lSmd5IYMJGQ_8;
TM_eqrzk6G2oN7lSmd5IYMJGQ_0[TM_eqrzk6G2oN7lSmd5IYMJGQ_8+1].name = TM_eqrzk6G2oN7lSmd5IYMJGQ_7[TM_eqrzk6G2oN7lSmd5IYMJGQ_8];
TM_eqrzk6G2oN7lSmd5IYMJGQ_6[TM_eqrzk6G2oN7lSmd5IYMJGQ_8] = &TM_eqrzk6G2oN7lSmd5IYMJGQ_0[TM_eqrzk6G2oN7lSmd5IYMJGQ_8+1];
}
TM_eqrzk6G2oN7lSmd5IYMJGQ_0[4].len = 3; TM_eqrzk6G2oN7lSmd5IYMJGQ_0[4].kind = 2; TM_eqrzk6G2oN7lSmd5IYMJGQ_0[4].sons = &TM_eqrzk6G2oN7lSmd5IYMJGQ_6[0];
NTI_UJxzDYlgEwaOU2Pq1XABRg_.node = &TM_eqrzk6G2oN7lSmd5IYMJGQ_0[4];
}
