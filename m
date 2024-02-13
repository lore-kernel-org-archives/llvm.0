Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89D6281C
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 21:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861403; cv=none; b=nyHXLYeuxJwicmu8f6bvXe1Gz3DPUmWoMutAR9d78u06X8OkKK4fb4Q2ubWhsvU9eOvQA7fedmjZtqx6gkRX9AcRGtyYXFiLc/G0HPGEk4DeNhTLAK99DapJWfruDArFYmja0YaD7WfJEyMhflKU/tRRL3AByWmYAlmIRZofN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861403; c=relaxed/simple;
	bh=2Vo/M41mSoxCv/vXGt9inqLpxuey+J59t2FDpAqKgxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qAPB4rTFINrlLL78Y4gO+kOyyeptS/Ysbu29s201nmd1HyCqTVpFgEf/+BJTq7/NwcrpwM5UEaXoik/3hk2UqTQKq2ThjdfX9Q3belW1bhxu4fovEhsXSWqrtMrSrjBveK7dO4rIdZwIlcwMOQS0NDGQVzw3nrJiaDVXuhIB6ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxtVJ4qK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxtVJ4qK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A279C433C7;
	Tue, 13 Feb 2024 21:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707861402;
	bh=2Vo/M41mSoxCv/vXGt9inqLpxuey+J59t2FDpAqKgxE=;
	h=Date:From:To:Cc:Subject:From;
	b=uxtVJ4qKYV8zola/DyUiTFYh2CzpL6HC5jHiBqFxOjEbh1ss7hr2mgrnyAo4R6yqW
	 OMJ3ahxStE5qwccFow0kHDFdw0iDfdwBh5hoiR8U15YNY0CpaT82UQtBS0nMxgGbvV
	 Rgc2nFFDfvVgZ1PbjBlfDZ/Cw2PiZADK7u15sbbEMbJ9N/SNfgytFFse6AcpnNluQI
	 YSZGwTW9Pbn05z56AdeD7VazTTtIxi8+1m0092CIVEGF9R+wMcJF2wIwDjXj6WZ9Ye
	 jG7geSf2C5Wt9lod1hy2OBcaJVHisDv1lDwlnJ9V3RZxfQY5dt/BELkHkN8rkdfm5G
	 Jn4V33E/vpRZQ==
Date: Tue, 13 Feb 2024 14:56:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	David Laight <David.Laight@aculab.com>
Subject: static assertion failed in fs/bcachefs/journal_io.c
Message-ID: <20240213215640.GA80329@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I am not really sure where to go with this, so I figured I would loop
some people in and see if we can figure out what is going on here.

After commit 67a8e7de7ef0 ("bcachefs: Clamp replicas_required to
replicas") in linux-next, I see a massive error occur when building for
ARCH=3Darm64 with both CONFIG_BCACHEFS_FS and CONFIG_LTO enabled, which is
important because arm64 defines its own __READ_ONCE() with LTO enabled.
The error appears to be related to the minmax.h changes that went into
6.7; I think it is specifically around commit d03eba99f5bf ("minmax:
allow min()/max()/clamp() if the arguments have the same signedness.").

As far as I can tell, replicas_want and the metadata_replicas_required
member in struct bch_opts should have the same signedness, unless the
__READ_ONCE() macro is messing something up, which is kind of hard to
tell at this point...

I'll keep poking at this tomorrow unless someone else beats me to it.

Cheers,
Nathan

$ echo 'CONFIG_BCACHEFS_FS=3Dy
CONFIG_LTO_NONE=3Dn
CONFIG_LTO_CLANG_THIN=3Dy' >kernel/configs/repro.config

$ make -skj"$(nproc)" ARCH=3Darm64 LLVM=3D1 clean defconfig repro.config fs=
/bcachefs/journal_io.o
fs/bcachefs/journal_io.c:1509:27: error: static assertion failed due to req=
uirement '__builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void *)=
((long)((((unsigned int)(-1)) < (unsigned int)1)) * 0L)) : (int *)8))), (((=
unsigned int)(-1)) < (unsigned int)1), 0) =3D=3D __builtin_choose_expr((siz=
eof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((int)(-1)) < (int)1)) * 0L=
)) : (int *)8))), (((int)(-1)) < (int)1), 0) || __builtin_choose_expr((size=
of(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((unsigned int)(-1)) < (unsi=
gned int)1)) * 0L)) : (int *)8))), (((unsigned int)(-1)) < (unsigned int)1)=
, 0) =3D=3D __builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void =
*)((long)((((int)(-1)) < (int)1)) * 0L)) : (int *)8))), (((int)(-1)) < (int=
)1), 0) || (__builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void =
*)((long)(replicas_want) * 0L)) : (int *)8))) && __builtin_choose_expr((siz=
eof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((unsigned int)(-1)) < (uns=
igned int)1)) * 0L)) : (int *)8))), (((unsigned int)(-1)) < (unsigned int)1=
), 0), replicas_want, -1) >=3D 0) || (__builtin_choose_expr((sizeof(int) =
=3D=3D sizeof (*(8 ? ((void *)((long)(({
    do {
        extern void __compiletime_assert_578(void);
        if (!((sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(ch=
ar) || sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(short) || =
sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(int) || sizeof (c=
->opts.metadata_replicas_required) =3D=3D sizeof(long)) || sizeof (c->opts.=
metadata_replicas_required) =3D=3D sizeof(long long)))
            __compiletime_assert_578();
    } while (0);
    ({
        unsigned char *__x =3D &(c->opts.metadata_replicas_required);
        int atomic =3D 1;
        union {
            unsigned char __val;
            char __c[1];
        } __u;
        switch (sizeof (c->opts.metadata_replicas_required)) {
          case 1:
            asm volatile (".if 1 =3D=3D 1\n661:\n\tldarb\t%w0, %1\n662:\n.p=
ushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hwor=
d 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\=
n\t.arch_extension rcpc\nldaprb\t%w0, %1\n664:\n\t.org\t. - (664b-663b) + (=
662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" :=
 "=3Dr" (*(unsigned char *)__u.__c) : "Q" (*__x) : "memory");
            break;
          case 2:
            asm volatile (".if 1 =3D=3D 1\n661:\n\tldarh\t%w0, %1\n662:\n.p=
ushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hwor=
d 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\=
n\t.arch_extension rcpc\nldaprh\t%w0, %1\n664:\n\t.org\t. - (664b-663b) + (=
662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" :=
 "=3Dr" (*(unsigned short *)__u.__c) : "Q" (*__x) : "memory");
            break;
          case 4:
            asm volatile (".if 1 =3D=3D 1\n661:\n\tldar\t%w0, %1\n662:\n.pu=
shsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hword=
 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\n=
\t.arch_extension rcpc\nldapr\t%w0, %1\n664:\n\t.org\t. - (664b-663b) + (66=
2b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" : "=
=3Dr" (*(unsigned int *)__u.__c) : "Q" (*__x) : "memory");
            break;
          case 8:
            asm volatile (".if 1 =3D=3D 1\n661:\n\tldar\t%0, %1\n662:\n.pus=
hsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hword =
34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\n\=
t.arch_extension rcpc\nldapr\t%0, %1\n664:\n\t.org\t. - (664b-663b) + (662b=
-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" : "=
=3Dr" (*(unsigned long long *)__u.__c) : "Q" (*__x) : "memory");
            break;
          default:
            atomic =3D 0;
        }
        atomic ? (unsigned char)__u.__val : (*(unsigned char *volatile)__x);
    });
})) * 0L)) : (int *)8))) && __builtin_choose_expr((sizeof(int) =3D=3D sizeo=
f (*(8 ? ((void *)((long)((((int)(-1)) < (int)1)) * 0L)) : (int *)8))), (((=
int)(-1)) < (int)1), 0), ({
    do {
        extern void __compiletime_assert_578(void);
        if (!((sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(ch=
ar) || sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(short) || =
sizeof (c->opts.metadata_replicas_required) =3D=3D sizeof(int) || sizeof (c=
->opts.metadata_replicas_required) =3D=3D sizeof(long)) || sizeof (c->opts.=
metadata_replicas_required) =3D=3D sizeof(long long)))
            __compiletime_assert_578();
    } while (0);
    ({
        unsigned char *__x =3D &(c->opts.metadata_replicas_required);
        int atomic =3D 1;
        union {
            unsigned char __val;
            char __c[1];
        } __u;
        switch (sizeof (c->opts.metadata_replicas_required)) {
          case 1:
            asm volatile (".if 1 =3D=3D 1\n661:\n\tldarb\t%w0, %1\n662:\n.p=
ushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hwor=
d 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\=
n\t.arch_extension rcpc\nldaprb\t%w0, %1\n664:\n\t.org\t. - (664b-663b) + (=
662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" :=
 "=3Dr" (*(unsigned char *)__u.__c) : "Q" (*__x) : "memory");
            break;
          case 2:
            asm volatile (".if 1 =3D=3D 1\n661:\n\tldarh\t%w0, %1\n662:\n.p=
ushsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hwor=
d 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\=
n\t.arch_extension rcpc\nldaprh\t%w0, %1\n664:\n\t.org\t. - (664b-663b) + (=
662b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" :=
 "=3Dr" (*(unsigned short *)__u.__c) : "Q" (*__x) : "memory");
            break;
          case 4:
            asm volatile (".if 1 =3D=3D 1\n661:\n\tldar\t%w0, %1\n662:\n.pu=
shsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hword=
 34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\n=
\t.arch_extension rcpc\nldapr\t%w0, %1\n664:\n\t.org\t. - (664b-663b) + (66=
2b-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" : "=
=3Dr" (*(unsigned int *)__u.__c) : "Q" (*__x) : "memory");
            break;
          case 8:
            asm volatile (".if 1 =3D=3D 1\n661:\n\tldar\t%0, %1\n662:\n.pus=
hsection .altinstructions,\"a\"\n .word 661b - .\n .word 663f - .\n .hword =
34\n .byte 662b-661b\n .byte 664f-663f\n.popsection\n.subsection 1\n663:\n\=
t.arch_extension rcpc\nldapr\t%0, %1\n664:\n\t.org\t. - (664b-663b) + (662b=
-661b)\n\t.org\t. - (662b-661b) + (664b-663b)\n\t.previous\n.endif\n" : "=
=3Dr" (*(unsigned long long *)__u.__c) : "Q" (*__x) : "memory");
            break;
          default:
            atomic =3D 0;
        }
        atomic ? (unsigned char)__u.__val : (*(unsigned char *volatile)__x);
    });
}), -1) >=3D 0)': min(replicas_want, ({ do { __attribute__((__noreturn__)) =
extern void __compiletime_assert_578(void) __attribute__((__error__("Unsupp=
orted access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(c->opts.metad=
ata_replicas_required) =3D=3D sizeof(char) || sizeof(c->opts.metadata_repli=
cas_required) =3D=3D sizeof(short) || sizeof(c->opts.metadata_replicas_requ=
ired) =3D=3D sizeof(int) || sizeof(c->opts.metadata_replicas_required) =3D=
=3D sizeof(long)) || sizeof(c->opts.metadata_replicas_required) =3D=3D size=
of(long long))) __compiletime_assert_578(); } while (0); ({ typeof(&(c->opt=
s.metadata_replicas_required)) __x =3D &(c->opts.metadata_replicas_required=
); int atomic =3D 1; union { typeof( _Generic((*__x), char: (char)0, unsign=
ed char: (unsigned char)0, signed char: (signed char)0, unsigned short: (un=
signed short)0, signed short: (signed short)0, unsigned int: (unsigned int)=
0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long:=
 (signed long)0, unsigned long long: (unsigned long long)0, signed long lon=
g: (signed long long)0, default: (*__x))) __val; char __c[1]; } __u; switch=
 (sizeof(c->opts.metadata_replicas_required)) { case 1: asm volatile(".if "=
"1"" =3D=3D 1\n" "661:\n\t" "ldar" "b" "\t" "%w0, %1" "\n" "662:\n" ".pushs=
ection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " =
=2Ehword " "34" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection=
\n" ".subsection 1\n" "663:\n\t" ".arch_extension rcpc\n" "ldapr" "b" "\t" =
"%w0, %1" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. =
- (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=3Dr" (*(__u8 =
*)__u.__c) : "Q" (*__x) : "memory"); break; case 2: asm volatile(".if ""1""=
 =3D=3D 1\n" "661:\n\t" "ldar" "h" "\t" "%w0, %1" "\n" "662:\n" ".pushsecti=
on .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hwo=
rd " "34" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".=
subsection 1\n" "663:\n\t" ".arch_extension rcpc\n" "ldapr" "h" "\t" "%w0, =
%1" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662=
b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=3Dr" (*(__u16 *)__u=
=2E__c) : "Q" (*__x) : "memory"); break; case 4: asm volatile(".if ""1"" =
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
 1509 |         unsigned replicas_need =3D min(replicas_want,
      |                                  ^~~~~~~~~~~~~~~~~~
 1510 |                                      READ_ONCE(c->opts.metadata_rep=
licas_required));
      |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
include/linux/minmax.h:85:19: note: expanded from macro 'min'
   85 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/minmax.h:58:3: note: expanded from macro '__careful_cmp'
   58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(=
__y)))
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
include/linux/minmax.h:51:16: note: expanded from macro '__cmp_once'
   51 |         static_assert(__types_ok(x, y),                 \
      |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   52 |                 #op "(" #x ", " #y ") signedness error, fix types o=
r consider u" #op "() before " #op "_t()"); \
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
include/linux/minmax.h:31:2: note: expanded from macro '__is_signed'
   31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(=
x))),        \
      |         ^
include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS_=
_, #expr)
      |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~=
~~~~~~~~~
include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
1 error generated.
