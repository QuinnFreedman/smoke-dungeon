/* Generated by Nim Compiler v0.18.0 */
/*   (c) 2018 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Windows, amd64, gcc */
/* Command for C compiler:
   gcc.exe -c  -w -mno-ms-bitfields -DWIN32_LEAN_AND_MEAN  -I"C:\Program Files\nim\nim-0.18.0\lib" -o "C:\Users\Quinn Freedman\workspace\nim\smoke\src\nimcache\smoke_matrix.o" "C:\Users\Quinn Freedman\workspace\nim\smoke\src\nimcache\smoke_matrix.c" */
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
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct tySequence_shxop0zPIs5Ec3k71aCLuQ tySequence_shxop0zPIs5Ec3k71aCLuQ;
typedef struct TGenericSeq TGenericSeq;
typedef struct tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw;
typedef struct tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g;
typedef struct tyObject_IndexError_b0IIwghFQBADkB2c86kXQA tyObject_IndexError_b0IIwghFQBADkB2c86kXQA;
typedef struct Exception Exception;
typedef struct RootObj RootObj;
typedef struct NimStringDesc NimStringDesc;
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
typedef struct tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg;
typedef struct tySequence_6MHxSSkCYafnfGYzxyCqtA tySequence_6MHxSSkCYafnfGYzxyCqtA;
typedef struct tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ;
typedef struct tyObject_StackTraceEntry_oLyohQ7O2XOvGnflOss8EA tyObject_StackTraceEntry_oLyohQ7O2XOvGnflOss8EA;
typedef struct tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w;
typedef struct tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ;
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
struct TGenericSeq {
NI len;
NI reserved;
};
struct tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g {
NI x;
NI y;
};
struct tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw {
NI width;
NI height;
tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g offset;
tySequence_shxop0zPIs5Ec3k71aCLuQ* data;
};
struct RootObj {
TNimType* m_type;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct Exception {
  RootObj Sup;
Exception* parent;
NCSTRING name;
NimStringDesc* message;
tySequence_uB9b75OUPRENsBAu4AnoePA* trace;
Exception* up;
};
struct tyObject_IndexError_b0IIwghFQBADkB2c86kXQA {
  Exception Sup;
};
typedef NimStringDesc* tyArray_Re75IspeoxXy2oCZHwcRrA[2];
typedef NimStringDesc* tyArray_24KAM9afIUgUaqBaEBB6r9bg[3];
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
struct tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg {
NI width;
NI height;
tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g offset;
tySequence_6MHxSSkCYafnfGYzxyCqtA* data;
};
struct tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ {
int Field0;
int Field1;
int Field2;
int Field3;
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
struct tySequence_shxop0zPIs5Ec3k71aCLuQ {
  TGenericSeq Sup;
  NIM_BOOL data[SEQ_DECL_SIZE];
};
struct tySequence_6MHxSSkCYafnfGYzxyCqtA {
  TGenericSeq Sup;
  tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ data[SEQ_DECL_SIZE];
};
struct tySequence_uB9b75OUPRENsBAu4AnoePA {
  TGenericSeq Sup;
  tyObject_StackTraceEntry_oLyohQ7O2XOvGnflOss8EA data[SEQ_DECL_SIZE];
};
static N_NIMCALL(void, Marker_tySequence_shxop0zPIs5Ec3k71aCLuQ)(void* p, NI op);
static N_INLINE(NI, addInt)(NI a, NI b);
N_NOINLINE(void, raiseOverflow)(void);
N_NIMCALL(void*, newObj)(TNimType* typ, NI size);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, nsuFormatVarargs)(NimStringDesc* formatstr, NimStringDesc** a, NI aLen_0);
N_NIMCALL(NimStringDesc*, nimIntToStr)(NI x);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, dollar__BNdGsTV6ZFhDHZTIzaJY5Q)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, dollar__QlLPjMfIso9bq08SGs3fS7g)(tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g x);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, stackOverflow_II46IjNZztN9bmbxUD8dt8g)(void);
static N_INLINE(void, popFrame)(void);
static N_INLINE(void, asgnRefNoCycle)(void** dest, void* src);
static N_INLINE(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*, usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem)(void* usr);
static N_INLINE(void, rtlAddZCT_MV4BBk6J1qu70IbBxwEn4w_2system)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
N_LIB_PRIVATE N_NOINLINE(void, addZCT_fCDI7oO1NNVXXURtxSzsRw)(tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w* s, tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
static N_INLINE(void, asgnRef)(void** dest, void* src);
static N_INLINE(void, incRef_9cAA5YuQAAC3MVbnGeV86swsystem)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
static N_INLINE(void, decRef_MV4BBk6J1qu70IbBxwEn4wsystem)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
N_NIMCALL(void, raiseException)(Exception* e, NCSTRING ename);
N_NIMCALL(NI, mulInt)(NI a, NI b);
N_NOINLINE(void, raiseIndexError)(void);
static N_NIMCALL(void, Marker_tySequence_6MHxSSkCYafnfGYzxyCqtA)(void* p, NI op);
N_NOINLINE(void, chckNil)(void* p);
N_NIMCALL(void, genericReset)(void* dest, TNimType* mt);
N_LIB_PRIVATE N_NIMCALL(tySequence_6MHxSSkCYafnfGYzxyCqtA*, newSeq_Vwp4M09ciGpSzWSD1pqtZ6w)(NI len);
static N_INLINE(NI, chckRange)(NI i, NI a, NI b);
N_NOINLINE(void, raiseRangeError)(NI64 val);
N_NIMCALL(void, unsureAsgnRef)(void** dest, void* src);
N_LIB_PRIVATE N_NIMCALL(tySequence_shxop0zPIs5Ec3k71aCLuQ*, newSeq_Ltn5D7x7AgJUEN0OQVkiEw)(NI len);
N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, dollar__hvNTR4uxZJu8fvePwaextw)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* self);
extern TNimType NTI_VaVACK0bpYmqIQ0mKcHfQQ_;
TNimType NTI_shxop0zPIs5Ec3k71aCLuQ_;
extern TNimType NTI_z58cIdR0vOibqJ0QwYvB3Q_;
extern TNimType NTI_b0IIwghFQBADkB2c86kXQA_;
extern TFrame* framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
extern tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ gch_IcYaEuuWivYAS86vFMTS3Q;
TNimType NTI_5jfXleRjKMzj7p29cba2i9bg_;
extern TNimType NTI_rR5Bzr1D5krxoo1NcNyeMA_;
extern TNimType NTI_7SQP9azfryP3zjoOAafzI6g_;
extern TNimType NTI_Ye8PLO8qqXk1tek2VP9c0UQ_;
TNimType NTI_6MHxSSkCYafnfGYzxyCqtA_;
TNimType NTI_Uogfi9b3606EsxiEmiGDiAw_;
STRING_LITERAL(TM_tQrSTGoNVJJYsChrKn6xOw_4, "x index: $1 out of bounds for matrix: $2", 40);
STRING_LITERAL(TM_tQrSTGoNVJJYsChrKn6xOw_5, "Matrix( width:$1, height:$2, offset:$3 )", 40);
STRING_LITERAL(TM_tQrSTGoNVJJYsChrKn6xOw_6, "y index: $1 out of bounds for matrix: $2", 40);
static N_NIMCALL(void, Marker_tySequence_shxop0zPIs5Ec3k71aCLuQ)(void* p, NI op) {
	tySequence_shxop0zPIs5Ec3k71aCLuQ* a;
	NI T1_;
	a = (tySequence_shxop0zPIs5Ec3k71aCLuQ*)p;
	T1_ = (NI)0;
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

N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, dollar__BNdGsTV6ZFhDHZTIzaJY5Q)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self) {
	NimStringDesc* result;
	tyArray_24KAM9afIUgUaqBaEBB6r9bg T1_;
	nimfr_("$", "matrix.nim");
	result = (NimStringDesc*)0;
	nimln_(73, "matrix.nim");
	memset((void*)T1_, 0, sizeof(T1_));
	nimln_(74, "matrix.nim");
	T1_[0] = nimIntToStr((*self).width);
	T1_[1] = nimIntToStr((*self).height);
	T1_[2] = dollar__QlLPjMfIso9bq08SGs3fS7g((*self).offset);
	result = nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_5), T1_, 3);
	popFrame();
	return result;
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

N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, get_fj0Ppa0kNA1RuTZA6XWnMQ)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self, NI x, NI y) {
	NIM_BOOL result;
	NI x2;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_2;
	NI y2;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_3;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_7;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_8;
	nimfr_("get", "matrix.nim");
{	result = (NIM_BOOL)0;
	nimln_(26, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_2 = addInt(x, (*self).offset.x);
	x2 = (NI)(TM_tQrSTGoNVJJYsChrKn6xOw_2);
	nimln_(27, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_3 = addInt(y, (*self).offset.y);
	y2 = (NI)(TM_tQrSTGoNVJJYsChrKn6xOw_3);
	nimln_(28, "matrix.nim");
	{
		NIM_BOOL T3_;
		tyObject_IndexError_b0IIwghFQBADkB2c86kXQA* e;
		tyArray_Re75IspeoxXy2oCZHwcRrA T7_;
		T3_ = (NIM_BOOL)0;
		T3_ = (x2 < ((NI) 0));
		if (T3_) goto LA4_;
		T3_ = ((*self).width <= x2);
		LA4_: ;
		if (!T3_) goto LA5_;
		e = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*)0;
		nimln_(2811, "system.nim");
		e = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*) newObj((&NTI_z58cIdR0vOibqJ0QwYvB3Q_), sizeof(tyObject_IndexError_b0IIwghFQBADkB2c86kXQA));
		(*e).Sup.Sup.m_type = (&NTI_b0IIwghFQBADkB2c86kXQA_);
		nimln_(30, "matrix.nim");
		memset((void*)T7_, 0, sizeof(T7_));
		T7_[0] = nimIntToStr(x2);
		T7_[1] = dollar__BNdGsTV6ZFhDHZTIzaJY5Q((&(*self)));
		asgnRefNoCycle((void**) (&(*e).Sup.message), nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_4), T7_, 2));
		nimln_(2806, "system.nim");
		asgnRef((void**) (&(*e).Sup.parent), NIM_NIL);
		nimln_(29, "matrix.nim");
		raiseException((Exception*)e, "IndexError");
	}
	LA5_: ;
	nimln_(31, "matrix.nim");
	{
		NIM_BOOL T10_;
		tyObject_IndexError_b0IIwghFQBADkB2c86kXQA* e_2;
		tyArray_Re75IspeoxXy2oCZHwcRrA T14_;
		T10_ = (NIM_BOOL)0;
		T10_ = (y2 < ((NI) 0));
		if (T10_) goto LA11_;
		T10_ = ((*self).height <= y2);
		LA11_: ;
		if (!T10_) goto LA12_;
		e_2 = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*)0;
		nimln_(2811, "system.nim");
		e_2 = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*) newObj((&NTI_z58cIdR0vOibqJ0QwYvB3Q_), sizeof(tyObject_IndexError_b0IIwghFQBADkB2c86kXQA));
		(*e_2).Sup.Sup.m_type = (&NTI_b0IIwghFQBADkB2c86kXQA_);
		nimln_(33, "matrix.nim");
		memset((void*)T14_, 0, sizeof(T14_));
		T14_[0] = nimIntToStr(y2);
		T14_[1] = dollar__BNdGsTV6ZFhDHZTIzaJY5Q((&(*self)));
		asgnRefNoCycle((void**) (&(*e_2).Sup.message), nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_6), T14_, 2));
		nimln_(2806, "system.nim");
		asgnRef((void**) (&(*e_2).Sup.parent), NIM_NIL);
		nimln_(32, "matrix.nim");
		raiseException((Exception*)e_2, "IndexError");
	}
	LA12_: ;
	nimln_(34, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_7 = mulInt(y, (*self).width);
	TM_tQrSTGoNVJJYsChrKn6xOw_8 = addInt((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_7), x);
	if ((NU)((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_8)) >= (NU)((*self).data->Sup.len)) raiseIndexError();
	result = (*self).data->data[(NI)(TM_tQrSTGoNVJJYsChrKn6xOw_8)];
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
static N_NIMCALL(void, Marker_tySequence_6MHxSSkCYafnfGYzxyCqtA)(void* p, NI op) {
	tySequence_6MHxSSkCYafnfGYzxyCqtA* a;
	NI T1_;
	a = (tySequence_6MHxSSkCYafnfGYzxyCqtA*)p;
	T1_ = (NI)0;
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

N_LIB_PRIVATE N_NIMCALL(void, newMatrix_M0SbTQ7CK3cgtJ3Pxb1eRg)(NI width, NI height, tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* Result) {
	NI TM_tQrSTGoNVJJYsChrKn6xOw_11;
	nimfr_("newMatrix", "matrix.nim");
	chckNil((void*)Result);
	genericReset((void*)Result, (&NTI_5jfXleRjKMzj7p29cba2i9bg_));
	nimln_(17, "matrix.nim");
	(*Result).width = width;
	nimln_(18, "matrix.nim");
	(*Result).height = height;
	nimln_(19, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_11 = mulInt(width, height);
	unsureAsgnRef((void**) (&(*Result).data), newSeq_Vwp4M09ciGpSzWSD1pqtZ6w(((NI)chckRange((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_11), ((NI) 0), ((NI) IL64(9223372036854775807))))));
	popFrame();
}

N_LIB_PRIVATE N_NIMCALL(void, newMatrix_WRyqL4rA9c9b9ckAdQys1qMYA)(NI width, NI height, tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* Result) {
	NI TM_tQrSTGoNVJJYsChrKn6xOw_12;
	nimfr_("newMatrix", "matrix.nim");
	chckNil((void*)Result);
	genericReset((void*)Result, (&NTI_Uogfi9b3606EsxiEmiGDiAw_));
	nimln_(17, "matrix.nim");
	(*Result).width = width;
	nimln_(18, "matrix.nim");
	(*Result).height = height;
	nimln_(19, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_12 = mulInt(width, height);
	unsureAsgnRef((void**) (&(*Result).data), newSeq_Ltn5D7x7AgJUEN0OQVkiEw(((NI)chckRange((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_12), ((NI) 0), ((NI) IL64(9223372036854775807))))));
	popFrame();
}

N_LIB_PRIVATE N_NIMCALL(void, set_dwKTQMqun8vrCrUIi6jcSg)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self, NI x, NI y, NIM_BOOL value) {
	NI x2;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_13;
	NI y2;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_14;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_15;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_16;
	nimfr_("set", "matrix.nim");
	nimln_(37, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_13 = addInt(x, (*self).offset.x);
	x2 = (NI)(TM_tQrSTGoNVJJYsChrKn6xOw_13);
	nimln_(38, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_14 = addInt(y, (*self).offset.y);
	y2 = (NI)(TM_tQrSTGoNVJJYsChrKn6xOw_14);
	nimln_(39, "matrix.nim");
	{
		NIM_BOOL T3_;
		tyObject_IndexError_b0IIwghFQBADkB2c86kXQA* e;
		tyArray_Re75IspeoxXy2oCZHwcRrA T7_;
		T3_ = (NIM_BOOL)0;
		T3_ = (x2 < ((NI) 0));
		if (T3_) goto LA4_;
		T3_ = ((*self).width <= x2);
		LA4_: ;
		if (!T3_) goto LA5_;
		e = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*)0;
		nimln_(2811, "system.nim");
		e = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*) newObj((&NTI_z58cIdR0vOibqJ0QwYvB3Q_), sizeof(tyObject_IndexError_b0IIwghFQBADkB2c86kXQA));
		(*e).Sup.Sup.m_type = (&NTI_b0IIwghFQBADkB2c86kXQA_);
		nimln_(41, "matrix.nim");
		memset((void*)T7_, 0, sizeof(T7_));
		T7_[0] = nimIntToStr(x2);
		T7_[1] = dollar__BNdGsTV6ZFhDHZTIzaJY5Q((&(*self)));
		asgnRefNoCycle((void**) (&(*e).Sup.message), nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_4), T7_, 2));
		nimln_(2806, "system.nim");
		asgnRef((void**) (&(*e).Sup.parent), NIM_NIL);
		nimln_(40, "matrix.nim");
		raiseException((Exception*)e, "IndexError");
	}
	LA5_: ;
	nimln_(42, "matrix.nim");
	{
		NIM_BOOL T10_;
		tyObject_IndexError_b0IIwghFQBADkB2c86kXQA* e_2;
		tyArray_Re75IspeoxXy2oCZHwcRrA T14_;
		T10_ = (NIM_BOOL)0;
		T10_ = (y2 < ((NI) 0));
		if (T10_) goto LA11_;
		T10_ = ((*self).height <= y2);
		LA11_: ;
		if (!T10_) goto LA12_;
		e_2 = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*)0;
		nimln_(2811, "system.nim");
		e_2 = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*) newObj((&NTI_z58cIdR0vOibqJ0QwYvB3Q_), sizeof(tyObject_IndexError_b0IIwghFQBADkB2c86kXQA));
		(*e_2).Sup.Sup.m_type = (&NTI_b0IIwghFQBADkB2c86kXQA_);
		nimln_(44, "matrix.nim");
		memset((void*)T14_, 0, sizeof(T14_));
		T14_[0] = nimIntToStr(y2);
		T14_[1] = dollar__BNdGsTV6ZFhDHZTIzaJY5Q((&(*self)));
		asgnRefNoCycle((void**) (&(*e_2).Sup.message), nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_6), T14_, 2));
		nimln_(2806, "system.nim");
		asgnRef((void**) (&(*e_2).Sup.parent), NIM_NIL);
		nimln_(43, "matrix.nim");
		raiseException((Exception*)e_2, "IndexError");
	}
	LA12_: ;
	nimln_(45, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_15 = mulInt(y, (*self).width);
	TM_tQrSTGoNVJJYsChrKn6xOw_16 = addInt((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_15), x);
	if ((NU)((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_16)) >= (NU)((*self).data->Sup.len)) raiseIndexError();
	(*self).data->data[(NI)(TM_tQrSTGoNVJJYsChrKn6xOw_16)] = value;
	popFrame();
}

N_LIB_PRIVATE N_NIMCALL(NimStringDesc*, dollar__hvNTR4uxZJu8fvePwaextw)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* self) {
	NimStringDesc* result;
	tyArray_24KAM9afIUgUaqBaEBB6r9bg T1_;
	nimfr_("$", "matrix.nim");
	result = (NimStringDesc*)0;
	nimln_(73, "matrix.nim");
	memset((void*)T1_, 0, sizeof(T1_));
	nimln_(74, "matrix.nim");
	T1_[0] = nimIntToStr((*self).width);
	T1_[1] = nimIntToStr((*self).height);
	T1_[2] = dollar__QlLPjMfIso9bq08SGs3fS7g((*self).offset);
	result = nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_5), T1_, 3);
	popFrame();
	return result;
}

N_LIB_PRIVATE N_NIMCALL(void, set_8NMCqEAEsAGwEgYC813byQ)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* self, NI x, NI y, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ value) {
	NI x2;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_17;
	NI y2;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_18;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_19;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_20;
	nimfr_("set", "matrix.nim");
	nimln_(37, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_17 = addInt(x, (*self).offset.x);
	x2 = (NI)(TM_tQrSTGoNVJJYsChrKn6xOw_17);
	nimln_(38, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_18 = addInt(y, (*self).offset.y);
	y2 = (NI)(TM_tQrSTGoNVJJYsChrKn6xOw_18);
	nimln_(39, "matrix.nim");
	{
		NIM_BOOL T3_;
		tyObject_IndexError_b0IIwghFQBADkB2c86kXQA* e;
		tyArray_Re75IspeoxXy2oCZHwcRrA T7_;
		T3_ = (NIM_BOOL)0;
		T3_ = (x2 < ((NI) 0));
		if (T3_) goto LA4_;
		T3_ = ((*self).width <= x2);
		LA4_: ;
		if (!T3_) goto LA5_;
		e = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*)0;
		nimln_(2811, "system.nim");
		e = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*) newObj((&NTI_z58cIdR0vOibqJ0QwYvB3Q_), sizeof(tyObject_IndexError_b0IIwghFQBADkB2c86kXQA));
		(*e).Sup.Sup.m_type = (&NTI_b0IIwghFQBADkB2c86kXQA_);
		nimln_(41, "matrix.nim");
		memset((void*)T7_, 0, sizeof(T7_));
		T7_[0] = nimIntToStr(x2);
		T7_[1] = dollar__hvNTR4uxZJu8fvePwaextw((&(*self)));
		asgnRefNoCycle((void**) (&(*e).Sup.message), nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_4), T7_, 2));
		nimln_(2806, "system.nim");
		asgnRef((void**) (&(*e).Sup.parent), NIM_NIL);
		nimln_(40, "matrix.nim");
		raiseException((Exception*)e, "IndexError");
	}
	LA5_: ;
	nimln_(42, "matrix.nim");
	{
		NIM_BOOL T10_;
		tyObject_IndexError_b0IIwghFQBADkB2c86kXQA* e_2;
		tyArray_Re75IspeoxXy2oCZHwcRrA T14_;
		T10_ = (NIM_BOOL)0;
		T10_ = (y2 < ((NI) 0));
		if (T10_) goto LA11_;
		T10_ = ((*self).height <= y2);
		LA11_: ;
		if (!T10_) goto LA12_;
		e_2 = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*)0;
		nimln_(2811, "system.nim");
		e_2 = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*) newObj((&NTI_z58cIdR0vOibqJ0QwYvB3Q_), sizeof(tyObject_IndexError_b0IIwghFQBADkB2c86kXQA));
		(*e_2).Sup.Sup.m_type = (&NTI_b0IIwghFQBADkB2c86kXQA_);
		nimln_(44, "matrix.nim");
		memset((void*)T14_, 0, sizeof(T14_));
		T14_[0] = nimIntToStr(y2);
		T14_[1] = dollar__hvNTR4uxZJu8fvePwaextw((&(*self)));
		asgnRefNoCycle((void**) (&(*e_2).Sup.message), nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_6), T14_, 2));
		nimln_(2806, "system.nim");
		asgnRef((void**) (&(*e_2).Sup.parent), NIM_NIL);
		nimln_(43, "matrix.nim");
		raiseException((Exception*)e_2, "IndexError");
	}
	LA12_: ;
	nimln_(45, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_19 = mulInt(y, (*self).width);
	TM_tQrSTGoNVJJYsChrKn6xOw_20 = addInt((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_19), x);
	if ((NU)((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_20)) >= (NU)((*self).data->Sup.len)) raiseIndexError();
	(*self).data->data[(NI)(TM_tQrSTGoNVJJYsChrKn6xOw_20)] = value;
	popFrame();
}

N_LIB_PRIVATE N_NIMCALL(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, get_uvL9bK1KOZ240Zsp9cvalHnw)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* self, NI x, NI y) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ result;
	NI x2;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_21;
	NI y2;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_22;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_23;
	NI TM_tQrSTGoNVJJYsChrKn6xOw_24;
	nimfr_("get", "matrix.nim");
{	memset((void*)(&result), 0, sizeof(result));
	nimln_(26, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_21 = addInt(x, (*self).offset.x);
	x2 = (NI)(TM_tQrSTGoNVJJYsChrKn6xOw_21);
	nimln_(27, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_22 = addInt(y, (*self).offset.y);
	y2 = (NI)(TM_tQrSTGoNVJJYsChrKn6xOw_22);
	nimln_(28, "matrix.nim");
	{
		NIM_BOOL T3_;
		tyObject_IndexError_b0IIwghFQBADkB2c86kXQA* e;
		tyArray_Re75IspeoxXy2oCZHwcRrA T7_;
		T3_ = (NIM_BOOL)0;
		T3_ = (x2 < ((NI) 0));
		if (T3_) goto LA4_;
		T3_ = ((*self).width <= x2);
		LA4_: ;
		if (!T3_) goto LA5_;
		e = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*)0;
		nimln_(2811, "system.nim");
		e = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*) newObj((&NTI_z58cIdR0vOibqJ0QwYvB3Q_), sizeof(tyObject_IndexError_b0IIwghFQBADkB2c86kXQA));
		(*e).Sup.Sup.m_type = (&NTI_b0IIwghFQBADkB2c86kXQA_);
		nimln_(30, "matrix.nim");
		memset((void*)T7_, 0, sizeof(T7_));
		T7_[0] = nimIntToStr(x2);
		T7_[1] = dollar__hvNTR4uxZJu8fvePwaextw((&(*self)));
		asgnRefNoCycle((void**) (&(*e).Sup.message), nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_4), T7_, 2));
		nimln_(2806, "system.nim");
		asgnRef((void**) (&(*e).Sup.parent), NIM_NIL);
		nimln_(29, "matrix.nim");
		raiseException((Exception*)e, "IndexError");
	}
	LA5_: ;
	nimln_(31, "matrix.nim");
	{
		NIM_BOOL T10_;
		tyObject_IndexError_b0IIwghFQBADkB2c86kXQA* e_2;
		tyArray_Re75IspeoxXy2oCZHwcRrA T14_;
		T10_ = (NIM_BOOL)0;
		T10_ = (y2 < ((NI) 0));
		if (T10_) goto LA11_;
		T10_ = ((*self).height <= y2);
		LA11_: ;
		if (!T10_) goto LA12_;
		e_2 = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*)0;
		nimln_(2811, "system.nim");
		e_2 = (tyObject_IndexError_b0IIwghFQBADkB2c86kXQA*) newObj((&NTI_z58cIdR0vOibqJ0QwYvB3Q_), sizeof(tyObject_IndexError_b0IIwghFQBADkB2c86kXQA));
		(*e_2).Sup.Sup.m_type = (&NTI_b0IIwghFQBADkB2c86kXQA_);
		nimln_(33, "matrix.nim");
		memset((void*)T14_, 0, sizeof(T14_));
		T14_[0] = nimIntToStr(y2);
		T14_[1] = dollar__hvNTR4uxZJu8fvePwaextw((&(*self)));
		asgnRefNoCycle((void**) (&(*e_2).Sup.message), nsuFormatVarargs(((NimStringDesc*) &TM_tQrSTGoNVJJYsChrKn6xOw_6), T14_, 2));
		nimln_(2806, "system.nim");
		asgnRef((void**) (&(*e_2).Sup.parent), NIM_NIL);
		nimln_(32, "matrix.nim");
		raiseException((Exception*)e_2, "IndexError");
	}
	LA12_: ;
	nimln_(34, "matrix.nim");
	TM_tQrSTGoNVJJYsChrKn6xOw_23 = mulInt(y, (*self).width);
	TM_tQrSTGoNVJJYsChrKn6xOw_24 = addInt((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_23), x);
	if ((NU)((NI)(TM_tQrSTGoNVJJYsChrKn6xOw_24)) >= (NU)((*self).data->Sup.len)) raiseIndexError();
	result = (*self).data->data[(NI)(TM_tQrSTGoNVJJYsChrKn6xOw_24)];
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}
NIM_EXTERNC N_NOINLINE(void, smoke_matrixInit000)(void) {
	nimfr_("matrix", "matrix.nim");
	popFrame();
}

NIM_EXTERNC N_NOINLINE(void, smoke_matrixDatInit000)(void) {
static TNimNode* TM_tQrSTGoNVJJYsChrKn6xOw_9[4];
static TNimNode* TM_tQrSTGoNVJJYsChrKn6xOw_10[4];
static TNimNode TM_tQrSTGoNVJJYsChrKn6xOw_0[10];
NTI_shxop0zPIs5Ec3k71aCLuQ_.size = sizeof(tySequence_shxop0zPIs5Ec3k71aCLuQ*);
NTI_shxop0zPIs5Ec3k71aCLuQ_.kind = 24;
NTI_shxop0zPIs5Ec3k71aCLuQ_.base = (&NTI_VaVACK0bpYmqIQ0mKcHfQQ_);
NTI_shxop0zPIs5Ec3k71aCLuQ_.flags = 2;
NTI_shxop0zPIs5Ec3k71aCLuQ_.marker = Marker_tySequence_shxop0zPIs5Ec3k71aCLuQ;
NTI_5jfXleRjKMzj7p29cba2i9bg_.size = sizeof(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg);
NTI_5jfXleRjKMzj7p29cba2i9bg_.kind = 18;
NTI_5jfXleRjKMzj7p29cba2i9bg_.base = 0;
NTI_5jfXleRjKMzj7p29cba2i9bg_.flags = 2;
TM_tQrSTGoNVJJYsChrKn6xOw_9[0] = &TM_tQrSTGoNVJJYsChrKn6xOw_0[1];
TM_tQrSTGoNVJJYsChrKn6xOw_0[1].kind = 1;
TM_tQrSTGoNVJJYsChrKn6xOw_0[1].offset = offsetof(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg, width);
TM_tQrSTGoNVJJYsChrKn6xOw_0[1].typ = (&NTI_rR5Bzr1D5krxoo1NcNyeMA_);
TM_tQrSTGoNVJJYsChrKn6xOw_0[1].name = "width";
TM_tQrSTGoNVJJYsChrKn6xOw_9[1] = &TM_tQrSTGoNVJJYsChrKn6xOw_0[2];
TM_tQrSTGoNVJJYsChrKn6xOw_0[2].kind = 1;
TM_tQrSTGoNVJJYsChrKn6xOw_0[2].offset = offsetof(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg, height);
TM_tQrSTGoNVJJYsChrKn6xOw_0[2].typ = (&NTI_rR5Bzr1D5krxoo1NcNyeMA_);
TM_tQrSTGoNVJJYsChrKn6xOw_0[2].name = "height";
TM_tQrSTGoNVJJYsChrKn6xOw_9[2] = &TM_tQrSTGoNVJJYsChrKn6xOw_0[3];
TM_tQrSTGoNVJJYsChrKn6xOw_0[3].kind = 1;
TM_tQrSTGoNVJJYsChrKn6xOw_0[3].offset = offsetof(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg, offset);
TM_tQrSTGoNVJJYsChrKn6xOw_0[3].typ = (&NTI_7SQP9azfryP3zjoOAafzI6g_);
TM_tQrSTGoNVJJYsChrKn6xOw_0[3].name = "offset";
TM_tQrSTGoNVJJYsChrKn6xOw_9[3] = &TM_tQrSTGoNVJJYsChrKn6xOw_0[4];
NTI_6MHxSSkCYafnfGYzxyCqtA_.size = sizeof(tySequence_6MHxSSkCYafnfGYzxyCqtA*);
NTI_6MHxSSkCYafnfGYzxyCqtA_.kind = 24;
NTI_6MHxSSkCYafnfGYzxyCqtA_.base = (&NTI_Ye8PLO8qqXk1tek2VP9c0UQ_);
NTI_6MHxSSkCYafnfGYzxyCqtA_.flags = 2;
NTI_6MHxSSkCYafnfGYzxyCqtA_.marker = Marker_tySequence_6MHxSSkCYafnfGYzxyCqtA;
TM_tQrSTGoNVJJYsChrKn6xOw_0[4].kind = 1;
TM_tQrSTGoNVJJYsChrKn6xOw_0[4].offset = offsetof(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg, data);
TM_tQrSTGoNVJJYsChrKn6xOw_0[4].typ = (&NTI_6MHxSSkCYafnfGYzxyCqtA_);
TM_tQrSTGoNVJJYsChrKn6xOw_0[4].name = "data";
TM_tQrSTGoNVJJYsChrKn6xOw_0[0].len = 4; TM_tQrSTGoNVJJYsChrKn6xOw_0[0].kind = 2; TM_tQrSTGoNVJJYsChrKn6xOw_0[0].sons = &TM_tQrSTGoNVJJYsChrKn6xOw_9[0];
NTI_5jfXleRjKMzj7p29cba2i9bg_.node = &TM_tQrSTGoNVJJYsChrKn6xOw_0[0];
NTI_Uogfi9b3606EsxiEmiGDiAw_.size = sizeof(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw);
NTI_Uogfi9b3606EsxiEmiGDiAw_.kind = 18;
NTI_Uogfi9b3606EsxiEmiGDiAw_.base = 0;
NTI_Uogfi9b3606EsxiEmiGDiAw_.flags = 2;
TM_tQrSTGoNVJJYsChrKn6xOw_10[0] = &TM_tQrSTGoNVJJYsChrKn6xOw_0[6];
TM_tQrSTGoNVJJYsChrKn6xOw_0[6].kind = 1;
TM_tQrSTGoNVJJYsChrKn6xOw_0[6].offset = offsetof(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw, width);
TM_tQrSTGoNVJJYsChrKn6xOw_0[6].typ = (&NTI_rR5Bzr1D5krxoo1NcNyeMA_);
TM_tQrSTGoNVJJYsChrKn6xOw_0[6].name = "width";
TM_tQrSTGoNVJJYsChrKn6xOw_10[1] = &TM_tQrSTGoNVJJYsChrKn6xOw_0[7];
TM_tQrSTGoNVJJYsChrKn6xOw_0[7].kind = 1;
TM_tQrSTGoNVJJYsChrKn6xOw_0[7].offset = offsetof(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw, height);
TM_tQrSTGoNVJJYsChrKn6xOw_0[7].typ = (&NTI_rR5Bzr1D5krxoo1NcNyeMA_);
TM_tQrSTGoNVJJYsChrKn6xOw_0[7].name = "height";
TM_tQrSTGoNVJJYsChrKn6xOw_10[2] = &TM_tQrSTGoNVJJYsChrKn6xOw_0[8];
TM_tQrSTGoNVJJYsChrKn6xOw_0[8].kind = 1;
TM_tQrSTGoNVJJYsChrKn6xOw_0[8].offset = offsetof(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw, offset);
TM_tQrSTGoNVJJYsChrKn6xOw_0[8].typ = (&NTI_7SQP9azfryP3zjoOAafzI6g_);
TM_tQrSTGoNVJJYsChrKn6xOw_0[8].name = "offset";
TM_tQrSTGoNVJJYsChrKn6xOw_10[3] = &TM_tQrSTGoNVJJYsChrKn6xOw_0[9];
TM_tQrSTGoNVJJYsChrKn6xOw_0[9].kind = 1;
TM_tQrSTGoNVJJYsChrKn6xOw_0[9].offset = offsetof(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw, data);
TM_tQrSTGoNVJJYsChrKn6xOw_0[9].typ = (&NTI_shxop0zPIs5Ec3k71aCLuQ_);
TM_tQrSTGoNVJJYsChrKn6xOw_0[9].name = "data";
TM_tQrSTGoNVJJYsChrKn6xOw_0[5].len = 4; TM_tQrSTGoNVJJYsChrKn6xOw_0[5].kind = 2; TM_tQrSTGoNVJJYsChrKn6xOw_0[5].sons = &TM_tQrSTGoNVJJYsChrKn6xOw_10[0];
NTI_Uogfi9b3606EsxiEmiGDiAw_.node = &TM_tQrSTGoNVJJYsChrKn6xOw_0[5];
}
