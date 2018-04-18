/* Generated by Nim Compiler v0.18.0 */
/*   (c) 2018 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Windows, amd64, gcc */
/* Command for C compiler:
   gcc.exe -c  -w -mno-ms-bitfields -DWIN32_LEAN_AND_MEAN  -I"C:\Program Files\nim\nim-0.18.0\lib" -o "C:\Users\Quinn Freedman\workspace\nim\smoke\src\nimcache\smoke_render.o" "C:\Users\Quinn Freedman\workspace\nim\smoke\src\nimcache\smoke_render.c" */
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
typedef struct tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw;
typedef struct tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ;
typedef struct tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g;
typedef struct tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg;
typedef struct tyTuple_rTI1z5tLuTbP9b133u2ve6A tyTuple_rTI1z5tLuTbP9b133u2ve6A;
typedef struct tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg;
typedef struct tySequence_6MHxSSkCYafnfGYzxyCqtA tySequence_6MHxSSkCYafnfGYzxyCqtA;
typedef struct tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg;
typedef struct tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA;
typedef struct tyObject_ItemSet_q6qi9bPVWXyspg9bTRkyuyXw tyObject_ItemSet_q6qi9bPVWXyspg9bTRkyuyXw;
typedef struct tyObject_ClothingHead_h3YfKnLVYVYocWj5dIBPGw tyObject_ClothingHead_h3YfKnLVYVYocWj5dIBPGw;
typedef struct tyObject_ClothingStats_zxet1nto49a9ae8pLlAU14cg tyObject_ClothingStats_zxet1nto49a9ae8pLlAU14cg;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct tyObject_ClothingBody_jYCMVvD4caXGho8aDSyHJQ tyObject_ClothingBody_jYCMVvD4caXGho8aDSyHJQ;
typedef struct tyObject_ClothingFeet_UGmkgjwjxmZBaRBpyJpGvw tyObject_ClothingFeet_UGmkgjwjxmZBaRBpyJpGvw;
typedef struct tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw;
typedef struct tySequence_shxop0zPIs5Ec3k71aCLuQ tySequence_shxop0zPIs5Ec3k71aCLuQ;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct tyObject_GamecolonObjectType__CtGi8Xr9b12gKxEZURFqedA tyObject_GamecolonObjectType__CtGi8Xr9b12gKxEZURFqedA;
typedef struct tyObject_GameState_np3Rx8N215Y1kfBowS8mPQ tyObject_GameState_np3Rx8N215Y1kfBowS8mPQ;
struct tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ {
int Field0;
int Field1;
int Field2;
int Field3;
};
struct tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g {
NI x;
NI y;
};
typedef NI32 tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw;
typedef N_CDECL_PTR(tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw, tyProc_uEPg0xGcL9ao0XgF3q7VnpA) (tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* texture, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ* srcrect, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ* dstrect, double angle, tyTuple_rTI1z5tLuTbP9b133u2ve6A* center, int flip);
struct tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg {
NI width;
NI height;
tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g offset;
tySequence_6MHxSSkCYafnfGYzxyCqtA* data;
};
typedef NU8 tyEnum_TextureAlias_6sotYNRMaoTgzBzqkJyyLQ;
typedef tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* tyArray_3edo6skDm9cM0PXLYCHqS4g[3];
struct tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA {
NF x;
NF y;
};
typedef NU8 tyEnum_Direction_p7h0usAc9c3d7sTkU0MWLNg;
typedef NU8 tyEnum_Race_wN6IdQU5M5xJLM35A76jlQ;
typedef NU8 tyEnum_Sex_fZXzEuE89cG49aK9cXfwfCxeQ;
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct tyObject_ClothingStats_zxet1nto49a9ae8pLlAU14cg {
NimStringDesc* name;
};
struct tyObject_ClothingHead_h3YfKnLVYVYocWj5dIBPGw {
tyObject_ClothingStats_zxet1nto49a9ae8pLlAU14cg stats;
};
struct tyObject_ClothingBody_jYCMVvD4caXGho8aDSyHJQ {
tyObject_ClothingStats_zxet1nto49a9ae8pLlAU14cg stats;
};
struct tyObject_ClothingFeet_UGmkgjwjxmZBaRBpyJpGvw {
tyObject_ClothingStats_zxet1nto49a9ae8pLlAU14cg stats;
};
struct tyObject_ItemSet_q6qi9bPVWXyspg9bTRkyuyXw {
tyObject_ClothingHead_h3YfKnLVYVYocWj5dIBPGw head;
tyObject_ClothingBody_jYCMVvD4caXGho8aDSyHJQ body;
tyObject_ClothingFeet_UGmkgjwjxmZBaRBpyJpGvw legs;
};
struct tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg {
tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g currentTile;
tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g nextTile;
tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA actualPos;
tyEnum_Direction_p7h0usAc9c3d7sTkU0MWLNg facing;
NF speed;
tyEnum_Race_wN6IdQU5M5xJLM35A76jlQ race;
tyEnum_Sex_fZXzEuE89cG49aK9cXfwfCxeQ sex;
tyObject_ItemSet_q6qi9bPVWXyspg9bTRkyuyXw items;
tyEnum_TextureAlias_6sotYNRMaoTgzBzqkJyyLQ spritesheet;
};
typedef N_CDECL_PTR(tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw, tyProc_nw9b4mUZeJkIsYfd3uLr2RQ) (tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ* rect);
typedef NI32 tyEnum_BlendMode_X3sFAtbwbaZunLKLlbwvMA;
typedef N_CDECL_PTR(tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw, tyProc_Jne9alGie1SjPbBbTo8unnw) (tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyEnum_BlendMode_X3sFAtbwbaZunLKLlbwvMA blendMode);
struct tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw {
NI width;
NI height;
tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g offset;
tySequence_shxop0zPIs5Ec3k71aCLuQ* data;
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
typedef N_CDECL_PTR(tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw, tyProc_BzAZji9bzvN1k9ae25rIlb8A) (tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, NU8 r, NU8 g, NU8 b, NU8 a);
typedef NIM_BOOL tyArray_k64wcrcoLEGgK5bVTvG2WA[6];
struct tyObject_GameState_np3Rx8N215Y1kfBowS8mPQ {
tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg mapTextures;
tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw walls;
tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg playerCharacter;
};
struct tyObject_GamecolonObjectType__CtGi8Xr9b12gKxEZURFqedA {
tyArray_k64wcrcoLEGgK5bVTvG2WA inputs;
tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer;
tyObject_GameState_np3Rx8N215Y1kfBowS8mPQ gameState;
};
struct tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw {
char dummy;
};
struct tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg {
char dummy;
};
struct tyTuple_rTI1z5tLuTbP9b133u2ve6A {
int Field0;
int Field1;
};
struct tySequence_6MHxSSkCYafnfGYzxyCqtA {
  TGenericSeq Sup;
  tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ data[SEQ_DECL_SIZE];
};
struct tySequence_shxop0zPIs5Ec3k71aCLuQ {
  TGenericSeq Sup;
  NIM_BOOL data[SEQ_DECL_SIZE];
};
static N_INLINE(void, renderTile_6CJ7JYxCFonnknfbJUWsNwrender)(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* texture, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ srcRect, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g pos, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform);
static N_INLINE(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, newSdlSquare_mKM48VTwEP7kEujb4tDg9aAutils)(NI x, NI y, NI w);
static N_INLINE(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, newSdlRect_pa4EWXFGguTRJoHOGgvabQutils)(NI x, NI y, NI w, NI h);
N_LIB_PRIVATE N_CDECL(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, rect_GH33Rh9bTnVBRLuu9bU7xoyA)(int x, int y, int w, int h);
static N_INLINE(NI, chckRange)(NI i, NI a, NI b);
N_NOINLINE(void, raiseRangeError)(NI64 val);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, stackOverflow_II46IjNZztN9bmbxUD8dt8g)(void);
static N_INLINE(void, popFrame)(void);
static N_INLINE(NI, addInt)(NI a, NI b);
N_NOINLINE(void, raiseOverflow)(void);
static N_INLINE(void, drawImage_xBsnA2Kafuz5HqH3exgc1Arender)(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* texture, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ* srcRect, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ* destRect, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform);
N_LIB_PRIVATE N_NIMCALL(void, renderMap_mSDA0S0vPkgYsFIROCc3Mw)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* map, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transfrom);
N_NIMCALL(NI, mulInt)(NI a, NI b);
static N_INLINE(NI, modInt)(NI a, NI b);
N_NOINLINE(void, raiseDivByZero)(void);
static N_INLINE(NI, divInt)(NI a, NI b);
N_LIB_PRIVATE N_NIMCALL(tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g, v_g7Ok4O0iyLEmW9bny8ZknmA)(NI x, NI y);
static N_INLINE(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, X5BX5D__RO9bqf9bXJArfKnntsZlNbFQrender)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* self, NI x, NI y);
N_LIB_PRIVATE N_NIMCALL(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, get_uvL9bK1KOZ240Zsp9cvalHnw)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* self, NI x, NI y);
static N_INLINE(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*, getTexture_QAjyN0lMUqn9aw9bErnIVY4Qtextures)(tyEnum_TextureAlias_6sotYNRMaoTgzBzqkJyyLQ texture);
N_LIB_PRIVATE N_NIMCALL(void, renderCharacter_QOudD6LaUYNNzGHjMYt89bQ)(tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg* character, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transfrom);
N_LIB_PRIVATE N_NIMCALL(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, getSrcRect_iww7nM41PPhFhiPsRXNe5A)(tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg* self);
N_LIB_PRIVATE N_NIMCALL(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, getDestRect_iww7nM41PPhFhiPsRXNe5A_2)(tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg* self);
N_LIB_PRIVATE N_NIMCALL(void, renderRect_IEx4BJHpm1uUVu3Tpf54SQ)(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ drect, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform);
N_LIB_PRIVATE N_NIMCALL(void, renderMask_xDLIDToAXDIkhBEasogfJw)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* mask1, tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* mask2, NF blend, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform);
static N_INLINE(NIM_BOOL, X5BX5D__rpbTKDBRNykrnccDBCN3Mgrender)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self, NI x, NI y);
N_NIMCALL(void, genericSeqAssign)(void* dest, void* src, TNimType* mt);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, get_fj0Ppa0kNA1RuTZA6XWnMQ)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self, NI x, NI y);
N_LIB_PRIVATE N_NIMCALL(void, renderGameFrame_DNr2pOUK8Aw01XldiYBEiA)(tyObject_GamecolonObjectType__CtGi8Xr9b12gKxEZURFqedA** game);
N_NOINLINE(void, chckNil)(void* p);
N_LIB_PRIVATE N_NIMCALL(void, newMatrix_WRyqL4rA9c9b9ckAdQys1qMYA)(NI width, NI height, tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* Result);
static N_INLINE(NI, width_cE3QeksBQN69bfryHVtCsvQrender)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self);
static N_INLINE(NI, height_cE3QeksBQN69bfryHVtCsvQ_2render)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self);
N_LIB_PRIVATE N_NIMCALL(void, shadowCast_3oBR9b4zVFsPhw2mvqbsMnw)(tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g heroPos, tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* mask, tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* walls);
static N_INLINE(NF, animationTimer_p4f2Wbmj53U17sklrjoDkgcharacter)(tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg* self);
N_LIB_PRIVATE N_NIMCALL(tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA, vecFloat_wLBMIso0HfVHu8Xdofrefw)(tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g v);
N_LIB_PRIVATE N_NIMCALL(tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g, minus__tYFBZAVkxpPzZkVM8ktKlQ_2)(tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g self, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g other);
N_LIB_PRIVATE N_NIMCALL(tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA, minus__HfcuY0Uh67I09aLMQeXgCMQ_2)(tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA self, tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA other);
extern TFrame* framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
extern tyProc_uEPg0xGcL9ao0XgF3q7VnpA Dl_146995_;
extern tyArray_3edo6skDm9cM0PXLYCHqS4g texturStore_OAeI2tGiDQMmseHBRU5W9cA;
extern tyProc_nw9b4mUZeJkIsYfd3uLr2RQ Dl_146972_;
extern tyProc_Jne9alGie1SjPbBbTo8unnw Dl_146636_;
extern TNimType NTI_shxop0zPIs5Ec3k71aCLuQ_;
extern tyProc_BzAZji9bzvN1k9ae25rIlb8A Dl_146617_;

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

static N_INLINE(void, renderTile_6CJ7JYxCFonnknfbJUWsNwrender)(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* texture, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ srcRect, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g pos, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ drect;
	NI TM_UZPstdIgyxE9bQJbAjDif6g_2;
	NI TM_UZPstdIgyxE9bQJbAjDif6g_3;
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ srect;
	tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw _;
	nimfr_("renderTile", "render.nim");
	nimln_(21, "render.nim");
	nimln_(22, "render.nim");
	TM_UZPstdIgyxE9bQJbAjDif6g_2 = addInt(pos.x, transform.x);
	TM_UZPstdIgyxE9bQJbAjDif6g_3 = addInt(pos.y, transform.y);
	drect = newSdlSquare_mKM48VTwEP7kEujb4tDg9aAutils((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_2), (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_3), ((NI) 32));
	nimln_(24, "render.nim");
	srect = srcRect;
	nimln_(25, "render.nim");
	_ = Dl_146995_(renderer, texture, (&srect), (&drect), 0.0, NIM_NIL, ((int) 0));
	popFrame();
}

static N_INLINE(void, drawImage_xBsnA2Kafuz5HqH3exgc1Arender)(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* texture, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ* srcRect, tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ* destRect, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ drect;
	NI TM_UZPstdIgyxE9bQJbAjDif6g_4;
	NI TM_UZPstdIgyxE9bQJbAjDif6g_5;
	tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw _;
	nimfr_("drawImage", "render.nim");
	nimln_(29, "render.nim");
	nimln_(30, "render.nim");
	TM_UZPstdIgyxE9bQJbAjDif6g_4 = addInt(((NI) ((*destRect).Field0)), transform.x);
	nimln_(31, "render.nim");
	TM_UZPstdIgyxE9bQJbAjDif6g_5 = addInt(((NI) ((*destRect).Field1)), transform.y);
	drect = rect_GH33Rh9bTnVBRLuu9bU7xoyA(((int)chckRange((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_4), ((int) (-2147483647 -1)), ((int) 2147483647))), ((int)chckRange((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_5), ((int) (-2147483647 -1)), ((int) 2147483647))), (*destRect).Field2, (*destRect).Field3);
	nimln_(35, "render.nim");
	_ = Dl_146995_(renderer, texture, srcRect, (&drect), 0.0, NIM_NIL, ((int) 0));
	popFrame();
}

static N_INLINE(NI, modInt)(NI a, NI b) {
	NI result;
{	result = (NI)0;
	{
		if (!(b == ((NI) 0))) goto LA3_;
		raiseDivByZero();
	}
	LA3_: ;
	result = (NI)(a % b);
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}

static N_INLINE(NI, divInt)(NI a, NI b) {
	NI result;
{	result = (NI)0;
	{
		if (!(b == ((NI) 0))) goto LA3_;
		raiseDivByZero();
	}
	LA3_: ;
	{
		NIM_BOOL T7_;
		T7_ = (NIM_BOOL)0;
		T7_ = (a == ((NI) (IL64(-9223372036854775807) - IL64(1))));
		if (!(T7_)) goto LA8_;
		T7_ = (b == ((NI) -1));
		LA8_: ;
		if (!T7_) goto LA9_;
		raiseOverflow();
	}
	LA9_: ;
	result = (NI)(a / b);
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}

static N_INLINE(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ, X5BX5D__RO9bqf9bXJArfKnntsZlNbFQrender)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* self, NI x, NI y) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ result;
	nimfr_("[]", "matrix.nim");
	memset((void*)(&result), 0, sizeof(result));
	nimln_(48, "matrix.nim");
	result = get_uvL9bK1KOZ240Zsp9cvalHnw(self, x, y);
	popFrame();
	return result;
}

static N_INLINE(tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*, getTexture_QAjyN0lMUqn9aw9bErnIVY4Qtextures)(tyEnum_TextureAlias_6sotYNRMaoTgzBzqkJyyLQ texture) {
	tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* result;
	nimfr_("getTexture", "textures.nim");
	result = (tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*)0;
	nimln_(62, "textures.nim");
	result = texturStore_OAeI2tGiDQMmseHBRU5W9cA[(texture)- 0];
	popFrame();
	return result;
}

N_LIB_PRIVATE N_NIMCALL(void, renderMap_mSDA0S0vPkgYsFIROCc3Mw)(tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg* map, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transfrom) {
	nimfr_("renderMap", "render.nim");
	{
		NI x;
		NI y;
		tyObject_Matrix_5jfXleRjKMzj7p29cba2i9bg colontmp_;
		NI width;
		NI height;
		x = (NI)0;
		y = (NI)0;
		memset((void*)(&colontmp_), 0, sizeof(colontmp_));
		nimln_(41, "render.nim");
		colontmp_.width = (*map).width;
		colontmp_.height = (*map).height;
		colontmp_.offset = (*map).offset;
		colontmp_.data = (*map).data;
		nimln_(78, "matrix.nim");
		width = colontmp_.width;
		nimln_(79, "matrix.nim");
		height = colontmp_.height;
		{
			NI i;
			NI colontmp__2;
			NI TM_UZPstdIgyxE9bQJbAjDif6g_6;
			NI i_2;
			i = (NI)0;
			colontmp__2 = (NI)0;
			nimln_(80, "matrix.nim");
			TM_UZPstdIgyxE9bQJbAjDif6g_6 = mulInt(width, height);
			colontmp__2 = (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_6);
			nimln_(3519, "system.nim");
			i_2 = ((NI) 0);
			{
				nimln_(3520, "system.nim");
				while (1) {
					NI x_2;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_7;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_8;
					NI y_2;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_9;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_10;
					tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g pos;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_11;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_12;
					tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ srect;
					tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* T5_;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_13;
					if (!(i_2 < colontmp__2)) goto LA4;
					nimln_(3521, "system.nim");
					i = i_2;
					nimln_(81, "matrix.nim");
					TM_UZPstdIgyxE9bQJbAjDif6g_7 = modInt(i, width);
					TM_UZPstdIgyxE9bQJbAjDif6g_8 = addInt((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_7), colontmp_.offset.x);
					x_2 = (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_8);
					nimln_(82, "matrix.nim");
					TM_UZPstdIgyxE9bQJbAjDif6g_9 = divInt(i, width);
					TM_UZPstdIgyxE9bQJbAjDif6g_10 = addInt((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_9), colontmp_.offset.y);
					y_2 = (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_10);
					nimln_(83, "matrix.nim");
					x = x_2;
					y = y_2;
					nimln_(42, "render.nim");
					TM_UZPstdIgyxE9bQJbAjDif6g_11 = mulInt(x, ((NI) 32));
					TM_UZPstdIgyxE9bQJbAjDif6g_12 = mulInt(y, ((NI) 32));
					pos = v_g7Ok4O0iyLEmW9bny8ZknmA((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_11), (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_12));
					nimln_(43, "render.nim");
					srect = X5BX5D__RO9bqf9bXJArfKnntsZlNbFQrender(map, x, y);
					nimln_(44, "render.nim");
					T5_ = (tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*)0;
					T5_ = getTexture_QAjyN0lMUqn9aw9bErnIVY4Qtextures(((tyEnum_TextureAlias_6sotYNRMaoTgzBzqkJyyLQ) 0));
					renderTile_6CJ7JYxCFonnknfbJUWsNwrender(T5_, srect, pos, renderer, transfrom);
					nimln_(3522, "system.nim");
					TM_UZPstdIgyxE9bQJbAjDif6g_13 = addInt(i_2, ((NI) 1));
					i_2 = (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_13);
				} LA4: ;
			}
		}
	}
	popFrame();
}

N_LIB_PRIVATE N_NIMCALL(void, renderCharacter_QOudD6LaUYNNzGHjMYt89bQ)(tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg* character, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transfrom) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ srect;
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ drect;
	tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw* T1_;
	nimfr_("renderCharacter", "render.nim");
	nimln_(50, "render.nim");
	srect = getSrcRect_iww7nM41PPhFhiPsRXNe5A((&(*character)));
	nimln_(51, "render.nim");
	drect = getDestRect_iww7nM41PPhFhiPsRXNe5A_2((&(*character)));
	nimln_(52, "render.nim");
	T1_ = (tyObject_TexturePtrcolonObjectType__6n0oqQPDsaMFNhtiJ29bOXw*)0;
	T1_ = getTexture_QAjyN0lMUqn9aw9bErnIVY4Qtextures((*character).spritesheet);
	drawImage_xBsnA2Kafuz5HqH3exgc1Arender(T1_, (&srect), (&drect), renderer, transfrom);
	popFrame();
}

N_LIB_PRIVATE N_NIMCALL(void, renderRect_IEx4BJHpm1uUVu3Tpf54SQ)(tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ drect, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform) {
	tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ newRect;
	NI TM_UZPstdIgyxE9bQJbAjDif6g_14;
	NI TM_UZPstdIgyxE9bQJbAjDif6g_15;
	tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw T1_;
	nimfr_("renderRect", "render.nim");
	nimln_(56, "render.nim");
	nimln_(57, "render.nim");
	TM_UZPstdIgyxE9bQJbAjDif6g_14 = addInt(drect.Field0, ((int)chckRange(transform.x, ((int) (-2147483647 -1)), ((int) 2147483647))));
	if (TM_UZPstdIgyxE9bQJbAjDif6g_14 < (-2147483647 -1) || TM_UZPstdIgyxE9bQJbAjDif6g_14 > 2147483647) raiseOverflow();
	nimln_(58, "render.nim");
	TM_UZPstdIgyxE9bQJbAjDif6g_15 = addInt(drect.Field1, ((int)chckRange(transform.y, ((int) (-2147483647 -1)), ((int) 2147483647))));
	if (TM_UZPstdIgyxE9bQJbAjDif6g_15 < (-2147483647 -1) || TM_UZPstdIgyxE9bQJbAjDif6g_15 > 2147483647) raiseOverflow();
	newRect = rect_GH33Rh9bTnVBRLuu9bU7xoyA((NI32)(TM_UZPstdIgyxE9bQJbAjDif6g_14), (NI32)(TM_UZPstdIgyxE9bQJbAjDif6g_15), drect.Field2, drect.Field3);
	nimln_(62, "render.nim");
	T1_ = (tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw)0;
	T1_ = Dl_146972_(renderer, (&newRect));
	popFrame();
}

static N_INLINE(NIM_BOOL, X5BX5D__rpbTKDBRNykrnccDBCN3Mgrender)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self, NI x, NI y) {
	NIM_BOOL result;
	tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw mutSelf;
	nimfr_("[]", "matrix.nim");
	result = (NIM_BOOL)0;
	nimln_(54, "matrix.nim");
	memset((void*)(&mutSelf), 0, sizeof(mutSelf));
	mutSelf.width = (*self).width;
	mutSelf.height = (*self).height;
	mutSelf.offset = (*self).offset;
	genericSeqAssign((&mutSelf.data), (*self).data, (&NTI_shxop0zPIs5Ec3k71aCLuQ_));
	nimln_(55, "matrix.nim");
	result = get_fj0Ppa0kNA1RuTZA6XWnMQ((&mutSelf), x, y);
	popFrame();
	return result;
}

N_LIB_PRIVATE N_NIMCALL(void, renderMask_xDLIDToAXDIkhBEasogfJw)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* mask1, tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* mask2, NF blend, tyObject_RendererPtrcolonObjectType__RZ5I89cPVLRdJchBQYVCSfg* renderer, tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform) {
	tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw T1_;
	nimfr_("renderMask", "render.nim");
	nimln_(67, "render.nim");
	T1_ = (tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw)0;
	T1_ = Dl_146636_(renderer, ((tyEnum_BlendMode_X3sFAtbwbaZunLKLlbwvMA) 1));
	{
		NI x;
		NI y;
		NI width;
		NI height;
		x = (NI)0;
		y = (NI)0;
		nimln_(78, "matrix.nim");
		width = (*mask1).width;
		nimln_(79, "matrix.nim");
		height = (*mask1).height;
		{
			NI i;
			NI colontmp_;
			NI TM_UZPstdIgyxE9bQJbAjDif6g_16;
			NI i_2;
			i = (NI)0;
			colontmp_ = (NI)0;
			nimln_(80, "matrix.nim");
			TM_UZPstdIgyxE9bQJbAjDif6g_16 = mulInt(width, height);
			colontmp_ = (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_16);
			nimln_(3519, "system.nim");
			i_2 = ((NI) 0);
			{
				nimln_(3520, "system.nim");
				while (1) {
					NI x_2;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_17;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_18;
					NI y_2;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_19;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_20;
					tyTuple_Ye8PLO8qqXk1tek2VP9c0UQ r;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_21;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_22;
					NF alpha;
					tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw T24_;
					NI TM_UZPstdIgyxE9bQJbAjDif6g_23;
					if (!(i_2 < colontmp_)) goto LA5;
					nimln_(3521, "system.nim");
					i = i_2;
					nimln_(81, "matrix.nim");
					TM_UZPstdIgyxE9bQJbAjDif6g_17 = modInt(i, width);
					TM_UZPstdIgyxE9bQJbAjDif6g_18 = addInt((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_17), (*mask1).offset.x);
					x_2 = (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_18);
					nimln_(82, "matrix.nim");
					TM_UZPstdIgyxE9bQJbAjDif6g_19 = divInt(i, width);
					TM_UZPstdIgyxE9bQJbAjDif6g_20 = addInt((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_19), (*mask1).offset.y);
					y_2 = (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_20);
					nimln_(83, "matrix.nim");
					x = x_2;
					y = y_2;
					nimln_(69, "render.nim");
					TM_UZPstdIgyxE9bQJbAjDif6g_21 = mulInt(x, ((NI) 32));
					TM_UZPstdIgyxE9bQJbAjDif6g_22 = mulInt(y, ((NI) 32));
					r = newSdlSquare_mKM48VTwEP7kEujb4tDg9aAutils((NI)(TM_UZPstdIgyxE9bQJbAjDif6g_21), (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_22), ((NI) 32));
					nimln_(70, "render.nim");
					nimln_(71, "render.nim");
					{
						NIM_BOOL T8_;
						T8_ = (NIM_BOOL)0;
						T8_ = X5BX5D__rpbTKDBRNykrnccDBCN3Mgrender(mask1, x, y);
						if (!T8_) goto LA9_;
						nimln_(72, "render.nim");
						{
							NIM_BOOL T13_;
							T13_ = (NIM_BOOL)0;
							T13_ = X5BX5D__rpbTKDBRNykrnccDBCN3Mgrender(mask2, x, y);
							if (!T13_) goto LA14_;
							alpha = 1.0000000000000000e+000;
						}
						goto LA11_;
						LA14_: ;
						{
							alpha = blend;
						}
						LA11_: ;
					}
					goto LA6_;
					LA9_: ;
					{
						nimln_(75, "render.nim");
						{
							NIM_BOOL T20_;
							T20_ = (NIM_BOOL)0;
							T20_ = X5BX5D__rpbTKDBRNykrnccDBCN3Mgrender(mask2, x, y);
							if (!T20_) goto LA21_;
							alpha = ((NF)(1.0000000000000000e+000) - (NF)(blend));
						}
						goto LA18_;
						LA21_: ;
						{
							alpha = 0.0;
						}
						LA18_: ;
					}
					LA6_: ;
					nimln_(77, "render.nim");
					T24_ = (tyEnum_SDL_Return_8wc8or7UFANAtbisKJq7lw)0;
					T24_ = Dl_146617_(renderer, ((NU8) 0), ((NU8) 0), ((NU8) 0), ((NU8) (((NF)(alpha) * (NF)(1.5000000000000000e+002)))));
					nimln_(78, "render.nim");
					renderRect_IEx4BJHpm1uUVu3Tpf54SQ(r, renderer, transform);
					nimln_(3522, "system.nim");
					TM_UZPstdIgyxE9bQJbAjDif6g_23 = addInt(i_2, ((NI) 1));
					i_2 = (NI)(TM_UZPstdIgyxE9bQJbAjDif6g_23);
				} LA5: ;
			}
		}
	}
	popFrame();
}

static N_INLINE(NI, width_cE3QeksBQN69bfryHVtCsvQrender)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self) {
	NI result;
	nimfr_("width", "matrix.nim");
	result = (NI)0;
	nimln_(12, "matrix.nim");
	result = (*self).width;
	popFrame();
	return result;
}

static N_INLINE(NI, height_cE3QeksBQN69bfryHVtCsvQ_2render)(tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw* self) {
	NI result;
	nimfr_("height", "matrix.nim");
	result = (NI)0;
	nimln_(14, "matrix.nim");
	result = (*self).height;
	popFrame();
	return result;
}

static N_INLINE(NF, animationTimer_p4f2Wbmj53U17sklrjoDkgcharacter)(tyObject_Character_z7sEl7rGLIEtgyeCSL9aOwg* self) {
	NF result;
	tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA distanceToMove;
	tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g T1_;
	tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA distanceMoved;
	tyObject_Vec2f_St31Lu7mm4aIQTpxOCjvHA T2_;
	nimfr_("animationTimer", "character.nim");
	result = (NF)0;
	nimln_(102, "character.nim");
	T1_ = minus__tYFBZAVkxpPzZkVM8ktKlQ_2((*self).nextTile, (*self).currentTile);
	distanceToMove = vecFloat_wLBMIso0HfVHu8Xdofrefw(T1_);
	nimln_(103, "character.nim");
	T2_ = vecFloat_wLBMIso0HfVHu8Xdofrefw((*self).nextTile);
	distanceMoved = minus__HfcuY0Uh67I09aLMQeXgCMQ_2(T2_, (*self).actualPos);
	nimln_(105, "character.nim");
	{
		nimln_(398, "system.nim");
		nimln_(105, "character.nim");
		if (!!((distanceToMove.x == 0.0))) goto LA5_;
		nimln_(106, "character.nim");
		result = ((NF)(distanceMoved.x) / (NF)(distanceToMove.x));
	}
	goto LA3_;
	LA5_: ;
	{
		nimln_(398, "system.nim");
		nimln_(107, "character.nim");
		if (!!((distanceToMove.y == 0.0))) goto LA8_;
		nimln_(108, "character.nim");
		result = ((NF)(distanceMoved.y) / (NF)(distanceToMove.y));
	}
	goto LA3_;
	LA8_: ;
	{
		result = 0.0;
	}
	LA3_: ;
	popFrame();
	return result;
}

N_LIB_PRIVATE N_NIMCALL(void, renderGameFrame_DNr2pOUK8Aw01XldiYBEiA)(tyObject_GamecolonObjectType__CtGi8Xr9b12gKxEZURFqedA** game) {
	tyObject_Vec2_7SQP9azfryP3zjoOAafzI6g transform;
	tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw shadowMask1;
	NI T1_;
	NI T2_;
	tyObject_Matrix_Uogfi9b3606EsxiEmiGDiAw shadowMask2;
	NI T3_;
	NI T4_;
	NF T5_;
	nimfr_("renderGameFrame", "render.nim");
	nimln_(83, "render.nim");
	chckNil((void*)(&transform));
	memset((void*)(&transform), 0, sizeof(transform));
	transform.x = ((NI) 0);
	transform.y = ((NI) 0);
	nimln_(84, "render.nim");
	renderMap_mSDA0S0vPkgYsFIROCc3Mw((&(*(*game)).gameState.mapTextures), (*(*game)).renderer, transform);
	nimln_(85, "render.nim");
	renderCharacter_QOudD6LaUYNNzGHjMYt89bQ((&(*(*game)).gameState.playerCharacter), (*(*game)).renderer, transform);
	memset((void*)(&shadowMask1), 0, sizeof(shadowMask1));
	nimln_(87, "render.nim");
	T1_ = (NI)0;
	T1_ = width_cE3QeksBQN69bfryHVtCsvQrender((&(*(*game)).gameState.walls));
	T2_ = (NI)0;
	T2_ = height_cE3QeksBQN69bfryHVtCsvQ_2render((&(*(*game)).gameState.walls));
	newMatrix_WRyqL4rA9c9b9ckAdQys1qMYA(T1_, T2_, (&shadowMask1));
	memset((void*)(&shadowMask2), 0, sizeof(shadowMask2));
	nimln_(88, "render.nim");
	T3_ = (NI)0;
	T3_ = width_cE3QeksBQN69bfryHVtCsvQrender((&(*(*game)).gameState.walls));
	T4_ = (NI)0;
	T4_ = height_cE3QeksBQN69bfryHVtCsvQ_2render((&(*(*game)).gameState.walls));
	newMatrix_WRyqL4rA9c9b9ckAdQys1qMYA(T3_, T4_, (&shadowMask2));
	nimln_(89, "render.nim");
	shadowCast_3oBR9b4zVFsPhw2mvqbsMnw((*(*game)).gameState.playerCharacter.currentTile, (&shadowMask1), (&(*(*game)).gameState.walls));
	nimln_(91, "render.nim");
	shadowCast_3oBR9b4zVFsPhw2mvqbsMnw((*(*game)).gameState.playerCharacter.nextTile, (&shadowMask2), (&(*(*game)).gameState.walls));
	nimln_(93, "render.nim");
	nimln_(94, "render.nim");
	T5_ = (NF)0;
	T5_ = animationTimer_p4f2Wbmj53U17sklrjoDkgcharacter((&(*(*game)).gameState.playerCharacter));
	renderMask_xDLIDToAXDIkhBEasogfJw((&shadowMask1), (&shadowMask2), T5_, (*(*game)).renderer, transform);
	popFrame();
}
NIM_EXTERNC N_NOINLINE(void, smoke_renderInit000)(void) {
	nimfr_("render", "render.nim");
	popFrame();
}

NIM_EXTERNC N_NOINLINE(void, smoke_renderDatInit000)(void) {
}

