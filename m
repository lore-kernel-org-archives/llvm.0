Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D8B625
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 01:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707873444; cv=none; b=BfJY4bS2JpPT1j4/tXxhkA82JwxSUhHKVPX7DXxHWosH/W5ChjH9ifKUhkUR6EHgiDnixXcEapKs+4Q+7ZWBCAnIs1K56pWCyZ4JeJBeiVz3pFfNFXI/0TsVw7lfEjbAmXka49MXLwfBzXgeYYlZkfe+li+/AQsAhyfr+iQl0n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707873444; c=relaxed/simple;
	bh=5X98FextZ0itUxUVY6o5Xkh2D+xiDNlyA2KuTbU03aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYl8HuRUX52zz5lXc5Tomx00TCfE8z8/2LnHhlJn2zLQmbpPXs6Wa9utfoHiuWOyaJbUrZBAid+gyKHXQp+JQnz6qGOITMONelFwZElOWFTxn7XOQ+6Xbv2wymeOdUtanzL3TNA6dO571lMm0zqai9x9yYSrmInwAYNNo/ZdN4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mTEtEtt4; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mTEtEtt4"
Date: Tue, 13 Feb 2024 20:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707873440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq24sXllIqJe/0ViQd9NQmetyjYAhlU9XfVwZnsq+xw=;
	b=mTEtEtt4DYcknimbfAR/ebbMWTFlE/nViEZYSOrjh4lrM4tFfd4reV0dyD6j3jfLogWWqu
	OvXr+zXNsFVjVzqIGfHrcdyCeJNhmMMOERRlGWgK/wznpMf9Kz2k4ZGNI/uMCT9u2b9V5U
	gN+BiQwKe/aonjMvWHuQpkXRygVYHGk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, David Laight <David.Laight@aculab.com>, 
	linux-bcachefs@vger.kernel.org
Subject: Re: static assertion failed in fs/bcachefs/journal_io.c
Message-ID: <wl7u2f7gvrw5yeyoa4rit4fy5kepn5tmqgzelrduhpajqvcuxy@4imci5mhzecr>
References: <20240213215640.GA80329@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240213215640.GA80329@dev-arch.thelio-3990X>
X-Migadu-Flow: FLOW_OUT

bcachefs bugs should go to the bcachefs mailing list; I assume this is
just a case where we need min_t instead of min, if so I'll fix it
shortly

On Tue, Feb 13, 2024 at 02:56:40PM -0700, Nathan Chancellor wrote:
> Hi all,
>=20
> I am not really sure where to go with this, so I figured I would loop
> some people in and see if we can figure out what is going on here.
>=20
> After commit 67a8e7de7ef0 ("bcachefs: Clamp replicas_required to
> replicas") in linux-next, I see a massive error occur when building for
> ARCH=3Darm64 with both CONFIG_BCACHEFS_FS and CONFIG_LTO enabled, which is
> important because arm64 defines its own __READ_ONCE() with LTO enabled.
> The error appears to be related to the minmax.h changes that went into
> 6.7; I think it is specifically around commit d03eba99f5bf ("minmax:
> allow min()/max()/clamp() if the arguments have the same signedness.").
>=20
> As far as I can tell, replicas_want and the metadata_replicas_required
> member in struct bch_opts should have the same signedness, unless the
> __READ_ONCE() macro is messing something up, which is kind of hard to
> tell at this point...
>=20
> I'll keep poking at this tomorrow unless someone else beats me to it.
>=20
> Cheers,
> Nathan
>=20
> $ echo 'CONFIG_BCACHEFS_FS=3Dy
> CONFIG_LTO_NONE=3Dn
> CONFIG_LTO_CLANG_THIN=3Dy' >kernel/configs/repro.config
>=20
> $ make -skj"$(nproc)" ARCH=3Darm64 LLVM=3D1 clean defconfig repro.config =
fs/bcachefs/journal_io.o
> fs/bcachefs/journal_io.c:1509:27: error: static assertion failed due to r=
equirement '__builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void =
*)((long)((((unsigned int)(-1)) < (unsigned int)1)) * 0L)) : (int *)8))), (=
((unsigned int)(-1)) < (unsigned int)1), 0) =3D=3D __builtin_choose_expr((s=
izeof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((int)(-1)) < (int)1)) * =
0L)) : (int *)8))), (((int)(-1)) < (int)1), 0) || __builtin_choose_expr((si=
zeof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((unsigned int)(-1)) < (un=
signed int)1)) * 0L)) : (int *)8))), (((unsigned int)(-1)) < (unsigned int)=
1), 0) =3D=3D __builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((voi=
d *)((long)((((int)(-1)) < (int)1)) * 0L)) : (int *)8))), (((int)(-1)) < (i=
nt)1), 0) || (__builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((voi=
d *)((long)(replicas_want) * 0L)) : (int *)8))) && __builtin_choose_expr((s=
izeof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((unsigned int)(-1)) < (u=
nsigned int)1)) * 0L)) : (int *)8))), (((unsigned int)(-1)) < (unsigned int=
)1), 0), replicas_want, -1) >=3D 0) || (__builtin_choose_expr((sizeof(int) =
=3D=3D sizeof (*(8 ? ((void *)((long)(({
>     do {
>         extern void __compiletime_assert_578(void);
>         if (!((sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(=
char) || sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(short) |=
| sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(int) || sizeof =
(c->opts.metadata_replicas_required) =3D=3D sizeof(long)) || sizeof (c->opt=
s.metadata_replicas_required) =3D=3D sizeof(long long)))
>             __compiletime_assert_578();
>     } while (0);
>     ({
>         unsigned char *__x =3D &(c->opts.metadata_replicas_required);
>         int atomic =3D 1;
>         union {
>             unsigned char __val;
>             char __c[1];
>         } __u;
>         switch (sizeof (c->opts.metadata_replicas_required)) {
>           case 1:
>             asm volatile (".if 1 =3D=3D 1\n661:\n\tldarb\t%w0, %1\n662:\n=
=2Epushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .=
hword 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n6=
63:\n\t.arch_extension rcpc\nldaprb\t%w0, %1\n664:\n\t.org\t. - (664b-663b)=
 + (662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\=
n" : "=3Dr" (*(unsigned char *)__u.__c) : "Q" (*__x) : "memory");
>             break;
>           case 2:
>             asm volatile (".if 1 =3D=3D 1\n661:\n\tldarh\t%w0, %1\n662:\n=
=2Epushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .=
hword 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n6=
63:\n\t.arch_extension rcpc\nldaprh\t%w0, %1\n664:\n\t.org\t. - (664b-663b)=
 + (662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\=
n" : "=3Dr" (*(unsigned short *)__u.__c) : "Q" (*__x) : "memory");
>             break;
>           case 4:
>             asm volatile (".if 1 =3D=3D 1\n661:\n\tldar\t%w0, %1\n662:\n.=
pushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hwo=
rd 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:=
\n\t.arch_extension rcpc\nldapr\t%w0, %1\n664:\n\t.org\t. - (664b-663b) + (=
662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" :=
 "=3Dr" (*(unsigned int *)__u.__c) : "Q" (*__x) : "memory");
>             break;
>           case 8:
>             asm volatile (".if 1 =3D=3D 1\n661:\n\tldar\t%0, %1\n662:\n.p=
ushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hwor=
d 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\=
n\t.arch_extension rcpc\nldapr\t%0, %1\n664:\n\t.org\t. - (664b-663b) + (66=
2b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" : "=
=3Dr" (*(unsigned long long *)__u.__c) : "Q" (*__x) : "memory");
>             break;
>           default:
>             atomic =3D 0;
>         }
>         atomic ? (unsigned char)__u.__val : (*(unsigned char *volatile)__=
x);
>     });
> })) * 0L)) : (int *)8))) && __builtin_choose_expr((sizeof(int) =3D=3D siz=
eof (*(8 ? ((void *)((long)((((int)(-1)) < (int)1)) * 0L)) : (int *)8))), (=
((int)(-1)) < (int)1), 0), ({
>     do {
>         extern void __compiletime_assert_578(void);
>         if (!((sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(=
char) || sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(short) |=
| sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(int) || sizeof =
(c->opts.metadata_replicas_required) =3D=3D sizeof(long)) || sizeof (c->opt=
s.metadata_replicas_required) =3D=3D sizeof(long long)))
>             __compiletime_assert_578();
>     } while (0);
>     ({
>         unsigned char *__x =3D &(c->opts.metadata_replicas_required);
>         int atomic =3D 1;
>         union {
>             unsigned char __val;
>             char __c[1];
>         } __u;
>         switch (sizeof (c->opts.metadata_replicas_required)) {
>           case 1:
>             asm volatile (".if 1 =3D=3D 1\n661:\n\tldarb\t%w0, %1\n662:\n=
=2Epushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .=
hword 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n6=
63:\n\t.arch_extension rcpc\nldaprb\t%w0, %1\n664:\n\t.org\t. - (664b-663b)=
 + (662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\=
n" : "=3Dr" (*(unsigned char *)__u.__c) : "Q" (*__x) : "memory");
>             break;
>           case 2:
>             asm volatile (".if 1 =3D=3D 1\n661:\n\tldarh\t%w0, %1\n662:\n=
=2Epushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .=
hword 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n6=
63:\n\t.arch_extension rcpc\nldaprh\t%w0, %1\n664:\n\t.org\t. - (664b-663b)=
 + (662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\=
n" : "=3Dr" (*(unsigned short *)__u.__c) : "Q" (*__x) : "memory");
>             break;
>           case 4:
>             asm volatile (".if 1 =3D=3D 1\n661:\n\tldar\t%w0, %1\n662:\n.=
pushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hwo=
rd 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:=
\n\t.arch_extension rcpc\nldapr\t%w0, %1\n664:\n\t.org\t. - (664b-663b) + (=
662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" :=
 "=3Dr" (*(unsigned int *)__u.__c) : "Q" (*__x) : "memory");
>             break;
>           case 8:
>             asm volatile (".if 1 =3D=3D 1\n661:\n\tldar\t%0, %1\n662:\n.p=
ushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hwor=
d 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\=
n\t.arch_extension rcpc\nldapr\t%0, %1\n664:\n\t.org\t. - (664b-663b) + (66=
2b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" : "=
=3Dr" (*(unsigned long long *)__u.__c) : "Q" (*__x) : "memory");
>             break;
>           default:
>             atomic =3D 0;
>         }
>         atomic ? (unsigned char)__u.__val : (*(unsigned char *volatile)__=
x);
>     });
> }), -1) >=3D 0)': min(replicas_want, ({ do { __attribute__((__noreturn__)=
) extern void __compiletime_assert_578(void) __attribute__((__error__("Unsu=
pported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(c->opts.met=
adata_replicas_required) =3D=3D sizeof(char) || sizeof(c->opts.metadata_rep=
licas_required) =3D=3D sizeof(short) || sizeof(c->opts.metadata_replicas_re=
quired) =3D=3D sizeof(int) || sizeof(c->opts.metadata_replicas_required) =
=3D=3D sizeof(long)) || sizeof(c->opts.metadata_replicas_required) =3D=3D s=
izeof(long long))) __compiletime_assert_578(); } while (0); ({ typeof(&(c->=
opts.metadata_replicas_required)) __x =3D &(c->opts.metadata_replicas_requi=
red); int atomic =3D 1; union { typeof( _Generic((*__x), char: (char)0, uns=
igned char: (unsigned char)0, signed char: (signed char)0, unsigned short: =
(unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned i=
nt)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed lo=
ng: (signed long)0, unsigned long long: (unsigned long long)0, signed long =
long: (signed long long)0, default: (*__x))) __val; char __c[1]; } __u; swi=
tch (sizeof(c->opts.metadata_replicas_required)) { case 1: asm volatile(".i=
f ""1"" =3D=3D 1\n" "661:\n\t" "ldar" "b" "\t" "%w0, %1" "\n" "662:\n" ".pu=
shsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n"=
 " .hword " "34" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsectio=
n\n" ".subsection 1\n" "663:\n\t" ".arch_extension rcpc\n" "ldapr" "b" "\t"=
 "%w0, %1" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	.=
 - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=3Dr" (*(__u8=
 *)__u.__c) : "Q" (*__x) : "memory"); break; case 2: asm volatile(".if ""1"=
" =3D=3D 1\n" "661:\n\t" "ldar" "h" "\t" "%w0, %1" "\n" "662:\n" ".pushsect=
ion .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hw=
ord " "34" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" "=
=2Esubsection 1\n" "663:\n\t" ".arch_extension rcpc\n" "ldapr" "h" "\t" "%w=
0, %1" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (=
662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=3Dr" (*(__u16 *)=
__u.__c) : "Q" (*__x) : "memory"); break; case 4: asm volatile(".if ""1"" =
=3D=3D 1\n" "661:\n\t" "ldar" "" "\t" "%w0, %1" "\n" "662:\n" ".pushsection=
 .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword=
 " "34" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".su=
bsection 1\n" "663:\n\t" ".arch_extension rcpc\n" "ldapr" "" "\t" "%w0, %1"=
 "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-6=
61b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=3Dr" (*(__u32 *)__u.__=
c) : "Q" (*__x) : "memory"); break; case 8: asm volatile(".if ""1"" =3D=3D =
1\n" "661:\n\t" "ldar" "" "\t" "%0, %1" "\n" "662:\n" ".pushsection .altins=
tructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "34" =
"\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection=
 1\n" "663:\n\t" ".arch_extension rcpc\n" "ldapr" "" "\t" "%0, %1" "\n" "66=
4:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (6=
64b-663b)\n\t" ".previous\n" ".endif\n" : "=3Dr" (*(__u64 *)__u.__c) : "Q" =
(*__x) : "memory"); break; default: atomic =3D 0; } atomic ? (typeof(*__x))=
__u.__val : (*(volatile typeof(__x))__x);}); })) signedness error, fix type=
s or consider umin() before min_t()
>  1509 |         unsigned replicas_need =3D min(replicas_want,
>       |                                  ^~~~~~~~~~~~~~~~~~
>  1510 |                                      READ_ONCE(c->opts.metadata_r=
eplicas_required));
>       |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
> include/linux/minmax.h:85:19: note: expanded from macro 'min'
>    85 | #define min(x, y)       __careful_cmp(min, x, y)
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/minmax.h:58:3: note: expanded from macro '__careful_cmp'
>    58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_I=
D(__y)))
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> include/linux/minmax.h:51:16: note: expanded from macro '__cmp_once'
>    51 |         static_assert(__types_ok(x, y),                 \
>       |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    52 |                 #op "(" #x ", " #y ") signedness error, fix types=
 or consider u" #op "() before " #op "_t()"); \
>       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=3D=
0 to see all)
> include/linux/minmax.h:31:2: note: expanded from macro '__is_signed'
>    31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeo=
f(x))),        \
>       |         ^
> include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>    77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARG=
S__, #expr)
>       |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~=
~~~~~~~~~~~
> include/linux/build_bug.h:78:56: note: expanded from macro '__static_asse=
rt'
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                                        ^~~~
> 1 error generated.
