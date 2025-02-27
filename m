Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B081AF0C9
	for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740689786; cv=none; b=RfEVxQDOkKRntxrbOLQuBPJPTDsyo5NyNSy27qpUse+HgoR5dw7dbglqbYB9y42PmAsRDIFS1j/Zk6NpuQSruNmYvjpqkJS3JXzRxXNI95mCtQ/Dayz2DRlh2ZDnioCxYW5jSQlJYzKdKROlA8Fe27kdTXGcuwDlO3rKUUJosaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740689786; c=relaxed/simple;
	bh=jBzl2J3X4B4GartkmlPP24UWJcRsK01w6K+luSD1Gj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbX95Uo0LKGuxdk6IGg09vi+j3LCs3306tJyG5lq02gtQ/0VXiGJ94K0ktuYQNsvNANrCBhbrK1M5Lf5THTxG216dX9xamTyt09jFvntOlQ4uYWE/ilPxMSAO8dY+Fww33nbJ0WNi2ITu29rQ7L6f+9Ra5K6vT7admeej/AXjeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ApTMA2gF; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ApTMA2gF"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaeec07b705so200911166b.2
        for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 12:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740689782; x=1741294582; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNfLsJ5M5Y46Pe7a1sd55cuuZyArFmPaDQMk3VExmOc=;
        b=ApTMA2gFOs2otCwTN4TsuvhpI5mXb0dcSh31zrAjHQUm3Ik53V19FfO2UfJ8hglUnF
         WLJzbhhfRzkdVQVma4C2xGv7F3Cs0xA/NtzFH61/IMxX/2b7Wz4LZdSNKRIe3h03P3Hq
         2h+8lfklfxeExIxIImJONnzFOs3AZzTi5oJaU5Jl836F4a74GqJGACn20SXuxPme0Fu4
         4dAbshHFWVtz8B/EBFQdA7l39J6n9af82IpFVUIP1hY42mJSvhRx6HXdxaKGOqkomPvd
         Wo0P18fiMvgR6Uv+YjLKwot1c2+CB5qU51jb5UXSpnK69A1Q4sXDaVqSbmDTy4S+6uni
         Y1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740689782; x=1741294582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNfLsJ5M5Y46Pe7a1sd55cuuZyArFmPaDQMk3VExmOc=;
        b=LJtbYRtUXSDhD5tF+7Gm5RLZn8q3U3UvFJ7ccuh2ftCGLzt8eG8kiJIsJzq9fi7KWc
         8iOjYfREroi6LEeKL8cOOt/UQRTTGVT0GCMDFxXEPcFQQHRKulLI2K0VE9z/BHgMfTl3
         GGndYCmlUUj2KoeBb83hDyL6CkI45VCSnFn5iNQWRbzNionrleXdQKCDc5EqgIncm9x4
         vbTExeiomA+Xp8Q8bTSH8jQEp+uupQEdXcAZjxMsIt06kmas0+rv+xhkj+KIsx+j9GTo
         vblcxvnMFm/IOcpJHvRrxOePF/WWhkZwvaC2vDEN+S9MRenYde87vBDL9C3aBhORnVZi
         vL5A==
X-Forwarded-Encrypted: i=1; AJvYcCULN7u2W63LUoX8SsRZabfl5tfavSIupmZbnQlzyIMhaZyqAuZpm4Vb2QiW/t+bKQsPmhRT@lists.linux.dev
X-Gm-Message-State: AOJu0YybnZp0OnD+4o7T96+4vXD5fP/VExY/cQCemW91eBnIkpDR9aHw
	o+RrEO4fEuROCTB+EWhB3ai/lrGhMGAaLrMRE4UJfjV8tatkS6ewCFpLvb4yhwF2HaJbzpj3QyP
	DJe9/XVLzLd918lKyJfsqoth/LXi5uocRbxM=
X-Gm-Gg: ASbGncspwNCsfUzdvEaEgreKqhLiahCSVw1t/EboF3fC2hm57YMYG4jOc1MXptuieU/
	2TcgSUB5zNa9ZLGBlbn3LFwwBNdgstBEtkHGpF98J2iBGoFWVKkj8bf+BlXSqlWlfrtWw2wfOe/
	9Y7LT4
X-Google-Smtp-Source: AGHT+IHk5c57x/1P/u8YmnoLziTvu7e5VlZk0I6I5E3FRkSAuORsqywFgx8cMDueTEhgLiA7uQm4XpQbmgxjR0DQ3f4=
X-Received: by 2002:a17:906:d542:b0:abb:e7b0:5442 with SMTP id
 a640c23a62f3a-abf2656040dmr96674466b.26.1740689781707; Thu, 27 Feb 2025
 12:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QVi27WRYVxmsk9+HLpJw9ZJrpfLjU8G4exuXm-vUA-KqQ@mail.gmail.com>
 <20250227062859.GA2506@sol.localdomain> <68F134A3-5371-4E74-9942-2BC66984C18A@zytor.com>
 <CAGG=3QX2WX5U-uNp3VWSbQCN9fPVAirOBn5KcaWn8m-87RhWfg@mail.gmail.com>
In-Reply-To: <CAGG=3QX2WX5U-uNp3VWSbQCN9fPVAirOBn5KcaWn8m-87RhWfg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 27 Feb 2025 12:56:05 -0800
X-Gm-Features: AQ5f1JoI25GyQvAEVKfSMmNTlt_ej9Rh4DM5IVbp89PFTHlpQT8k9zCeJA-W2l4
Message-ID: <CAGG=3QW4jo9RKtVxD2b3ZBjPhnAUYeUf_GPVh13e7gZkLFtuUQ@mail.gmail.com>
Subject: Re: [PATCH] x86/crc32: use builtins to improve code generation
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:17=E2=80=AFAM Bill Wendling <morbo@google.com> wr=
ote:
> On Thu, Feb 27, 2025 at 2:53=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wr=
ote:
> > On February 26, 2025 10:28:59 PM PST, Eric Biggers <ebiggers@kernel.org=
> wrote:
> > >On Wed, Feb 26, 2025 at 10:12:47PM -0800, Bill Wendling wrote:
> > >> For both gcc and clang, crc32 builtins generate better code than the
> > >> inline asm. GCC improves, removing unneeded "mov" instructions. Clan=
g
> > >> does the same and unrolls the loops. GCC has no changes on i386, but
> > >> Clang's code generation is vastly improved, due to Clang's "rm"
> > >> constraint issue.
> > >>
> > >> The number of cycles improved by ~0.1% for GCC and ~1% for Clang, wh=
ich
> > >> is expected because of the "rm" issue. However, Clang's performance =
is
> > >> better than GCC's by ~1.5%, most likely due to loop unrolling.
> > >>
> > >> Link: https://github.com/llvm/llvm-project/issues/20571#issuecomment=
-2649330009
> > >> Cc: Thomas Gleixner <tglx@linutronix.de>
> > >> Cc: Ingo Molnar <mingo@redhat.com>
> > >> Cc: Borislav Petkov <bp@alien8.de>
> > >> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > >> Cc: x86@kernel.org
> > >> Cc: "H. Peter Anvin" <hpa@zytor.com>
> > >> Cc: Eric Biggers <ebiggers@kernel.org>
> > >> Cc: Ard Biesheuvel <ardb@kernel.org>
> > >> Cc: Nathan Chancellor <nathan@kernel.org>
> > >> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> > >> Cc: Justin Stitt <justinstitt@google.com>
> > >> Cc: linux-kernel@vger.kernel.org
> > >> Cc: linux-crypto@vger.kernel.org
> > >> Cc: llvm@lists.linux.dev
> > >> Signed-off-by: Bill Wendling <morbo@google.com>
> > >> ---
> > >>  arch/x86/Makefile         | 3 +++
> > >>  arch/x86/lib/crc32-glue.c | 8 ++++----
> > >>  2 files changed, 7 insertions(+), 4 deletions(-)
> > >
> > >Thanks!  A couple concerns, though:
> > >
> > >> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > >> index 5b773b34768d..241436da1473 100644
> > >> --- a/arch/x86/Makefile
> > >> +++ b/arch/x86/Makefile
> > >> @@ -114,6 +114,9 @@ else
> > >>  KBUILD_CFLAGS +=3D $(call cc-option,-fcf-protection=3Dnone)
> > >>  endif
> > >>
> > >> +# Enables the use of CRC32 builtins.
> > >> +KBUILD_CFLAGS +=3D -mcrc32
> > >
> > >Doesn't this technically allow the compiler to insert CRC32 instructio=
ns
> > >anywhere in arch/x86/ without the needed runtime CPU feature check?  N=
ormally
> > >when using intrinsics it's necessary to limit the scope of the feature
> > >enablement to match the runtime CPU feature check that is done, e.g. b=
y using
> > >the target function attribute.
> > >
> > >> diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32-glue.c
> > >> index 2dd18a886ded..fdb94bff25f4 100644
> > >> --- a/arch/x86/lib/crc32-glue.c
> > >> +++ b/arch/x86/lib/crc32-glue.c
> > >> @@ -48,9 +48,9 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len=
)
> > >>  EXPORT_SYMBOL(crc32_le_arch);
> > >>
> > >>  #ifdef CONFIG_X86_64
> > >> -#define CRC32_INST "crc32q %1, %q0"
> > >> +#define CRC32_INST __builtin_ia32_crc32di
> > >>  #else
> > >> -#define CRC32_INST "crc32l %1, %0"
> > >> +#define CRC32_INST __builtin_ia32_crc32si
> > >>  #endif
> > >
> > >Do both gcc and clang consider these builtins to be a stable API, or d=
o they
> > >only guarantee the stability of _mm_crc32_*() from immintrin.h?  At le=
ast for
> > >the rest of the SSE and AVX stuff, I thought that only the immintrin.h=
 functions
> > >are actually considered stable.
> > >
> > >- Eric
> >
> > There is that... also are there compiler versions that we support that =
do not have -mcrc32 support?
> >
> Checking GCC 5.1.0 and Clang 13.0.1, it seems that both support '-mcrc32'=
.
>
I just checked and GCC 5.1.0 doesn't appear to be able to compile the
kernel anymore, at least not with "defconfig". It doesn't have
retpoline support for one and then can't compile lib/zstd:

lib/zstd/decompress/zstd_decompress_block.c: In function
=E2=80=98ZSTD_decompressSequences_default=E2=80=99:
lib/zstd/decompress/zstd_decompress_block.c:1539:1: error: inlining
failed in call to always_inline =E2=80=98ZSTD_decompressSequences_body=E2=
=80=99:
optimization level attribute mismatch
 ZSTD_decompressSequences_body(ZSTD_DCtx* dctx,
 ^
lib/zstd/decompress/zstd_decompress_block.c:1633:12: error: called from her=
e
     return ZSTD_decompressSequences_body(dctx, dst, maxDstSize,
seqStart, seqSize, nbSeq, isLongOffset, frame);
            ^

GCC 6.1.0 gets further, but also doesn't have retpoline support. Maybe
the minimal version should be changed?

Anyway, GCC 5.1.0 doesn't support
__attribute__((__target__("crc32"))), so I'd have to use the flag. I
know I can conditionally add the flag with:

CFLAGS_crc32-glue.o :=3D -mcrc32

But like I said, the file is compiled twice (why?), but only once with
the arch/x86/lib/Makefile. If anyone has any suggestions on how to
solve this, please let me know.

-bw
