Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF412206B2
	for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740640123; cv=none; b=A/WVBAPwiHbLO4swFnlkKwtbq2tk6Uq04DDqWR1v+g8EoofWQH3dWJoDF0GPwRIyaa08/0effu8tqRuR9vecwdd1j/PTT1Oq4xjVFZNd9QyD9hTXmjMuJAmLGrF2MRm9IyB1u6BrYMoCWyAzo1MLxOhf8SOOzlog3sLcWjOGnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740640123; c=relaxed/simple;
	bh=rg8B6FDBMz6yz+xYk4oSNWCWQ+8wOLsYZLdg29RHBE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBg18Y4NeAkA56sIU1foidm7vdbDjcNlHqHZAtrxZx7KNeCOKz6OPgeXOwQRTvKGyaxNb0iTpin+zydoBysrtMW7iXp1mCCm+4/EMG5QxQzXklujvFpY/A+wAtkYV+cZSr7T3T6HKSRwymvrrUQqTgqQMaxoyMs1GQi6yL2Gjdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3SSV5XrE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3SSV5XrE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2feae68f835so117217a91.2
        for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 23:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740640121; x=1741244921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKhkrI6oIv5W5cLDtWVWvtUq/hOpICpzcugG77LEdi8=;
        b=3SSV5XrEmhYDk+HjyyHQ7CKW1WTFYu2ciUwuPv0+IfH8kTg+5iOyWP6riMUauAHyDN
         QDS1MQ+6k1pA8WLqgYWLjPHP3IGQwto7yp++usi1OObBmM6eXCI6MwEbGshwcczYI4jR
         QpXbKDrw5Cn7QsuV07Y49nw5Rh6LMjegs+vlny6/cUXsoP/Iw3xYLgjTCYu8dzVxp82R
         JTpgZYOjegCJR9Um+xi8RL+I/VpbSctApJ1ZNyyEV/Kdcr7IhZMxapUbr+/lf8Zf6C98
         AtbNnY1ZLCfPXAbsbpxRABdhbSz3PbFY9mAVdM9B133CU0ZUT06VF+xNUG7NRWNuCWd5
         QeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740640121; x=1741244921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKhkrI6oIv5W5cLDtWVWvtUq/hOpICpzcugG77LEdi8=;
        b=OBZWxMvH77A00uwHYDe/KyGUbPVJy7OmsZVjG81lht8EKnpuVYY2jhNtlqWhGAKdEC
         BE7OYnEg2dno2gCWUBHGd9CEvFAGeLr/0d3Va5L9YW+X0j9fFSfap73NLWcbyEOXqWyI
         WJSanzdserdFI4AE8ip5ly0WkYIyq5RFhSJ94bXO9uoD7z4PU9gwrzYnyA03R3WeIdIa
         XNRd8Ia4winE3oOxSfRdcWNX3d3IUsLcQ5MPDBM4r0EVi6Sqc/u5k2R0b8zCcpaCkTbN
         Cn0XuhKx+kC+6lMiMTYdaYCq8Anfl8RCZz9y2xoYH0ms/Xu6u3f4ZjWlmnG0H2zDsvT6
         letQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoxXCEUdY7A6t8Kz8zAzyNSGPoYg57wriafOQ236XMz7TqwrLEuURU8W4J+wUba3TyTL1m@lists.linux.dev
X-Gm-Message-State: AOJu0YyFKfoXnMHA+x5bOoR+PX/jKb6oSx7FLTWZrGTpemhUMETx2PqJ
	Rg3r1LSc+5gyV1q3AJc+W6JvIQN5ZwFnM0rU2tUXH+9WM4/GLPJCfHpDy2cnx8Cgs8Lj6z7SvQI
	Hm7pU0SIdRDBM0g6EzK4OfCKSJR6O4wHq2z8=
X-Gm-Gg: ASbGnctKbFN4n/cPsr9Lbpc3LCWPzWgq6OSGfA2DV+6bQf+rC36AT2vxiclVYMsxwr3
	p6E3K2NiINhOcozG6RpP5ZivAAR11tmUFnYpUjec1+vG8aFa/8e0G2osSNKsbJemmiGp/Vi1cmX
	xKWq4r
X-Google-Smtp-Source: AGHT+IFvnuTUQDTO+4VmmSR1/1rup47G/HkdLkZFzWMjG5VYtOpMuG8VhVq3CAiDPdsw8oSQMUp+F3Nut4awmQxTzwE=
X-Received: by 2002:a17:90b:570f:b0:2fe:ac01:8016 with SMTP id
 98e67ed59e1d1-2feac01813cmr679744a91.34.1740640120783; Wed, 26 Feb 2025
 23:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QVi27WRYVxmsk9+HLpJw9ZJrpfLjU8G4exuXm-vUA-KqQ@mail.gmail.com>
 <20250227062859.GA2506@sol.localdomain>
In-Reply-To: <20250227062859.GA2506@sol.localdomain>
From: Bill Wendling <morbo@google.com>
Date: Wed, 26 Feb 2025 23:08:22 -0800
X-Gm-Features: AQ5f1JrEBuahLVZ7GJL1oCz4jbIFAykPYy8gOB3rzQjuGstuIo1gE7lS5pS-AII
Message-ID: <CAGG=3QVitM-AwqtYF0QjxpBV7Q8bqv59Os+jELFRUKMnRS9OGA@mail.gmail.com>
Subject: Re: [PATCH] x86/crc32: use builtins to improve code generation
To: Eric Biggers <ebiggers@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-crypto@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 10:29=E2=80=AFPM Eric Biggers <ebiggers@kernel.org>=
 wrote:
>
> On Wed, Feb 26, 2025 at 10:12:47PM -0800, Bill Wendling wrote:
> > For both gcc and clang, crc32 builtins generate better code than the
> > inline asm. GCC improves, removing unneeded "mov" instructions. Clang
> > does the same and unrolls the loops. GCC has no changes on i386, but
> > Clang's code generation is vastly improved, due to Clang's "rm"
> > constraint issue.
> >
> > The number of cycles improved by ~0.1% for GCC and ~1% for Clang, which
> > is expected because of the "rm" issue. However, Clang's performance is
> > better than GCC's by ~1.5%, most likely due to loop unrolling.
> >
> > Link: https://github.com/llvm/llvm-project/issues/20571#issuecomment-26=
49330009
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: x86@kernel.org
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Eric Biggers <ebiggers@kernel.org>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> > Cc: Justin Stitt <justinstitt@google.com>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> >  arch/x86/Makefile         | 3 +++
> >  arch/x86/lib/crc32-glue.c | 8 ++++----
> >  2 files changed, 7 insertions(+), 4 deletions(-)
>
> Thanks!  A couple concerns, though:
>
> > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > index 5b773b34768d..241436da1473 100644
> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -114,6 +114,9 @@ else
> >  KBUILD_CFLAGS +=3D $(call cc-option,-fcf-protection=3Dnone)
> >  endif
> >
> > +# Enables the use of CRC32 builtins.
> > +KBUILD_CFLAGS +=3D -mcrc32
>
> Doesn't this technically allow the compiler to insert CRC32 instructions
> anywhere in arch/x86/ without the needed runtime CPU feature check?  Norm=
ally
> when using intrinsics it's necessary to limit the scope of the feature
> enablement to match the runtime CPU feature check that is done, e.g. by u=
sing
> the target function attribute.
>
I'm not sure if CRC32 instructions will automatically be inserted when
not explicitly called, especially since the other vector features are
disabled. I wanted to limit enabling this flag for only crc32-glue.c,
but my Makefile-fu failed me. The file appears to be compiled twice.
But adding __attribute__((target("crc32"))) to the function would be
much better.

> > diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32-glue.c
> > index 2dd18a886ded..fdb94bff25f4 100644
> > --- a/arch/x86/lib/crc32-glue.c
> > +++ b/arch/x86/lib/crc32-glue.c
> > @@ -48,9 +48,9 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
> >  EXPORT_SYMBOL(crc32_le_arch);
> >
> >  #ifdef CONFIG_X86_64
> > -#define CRC32_INST "crc32q %1, %q0"
> > +#define CRC32_INST __builtin_ia32_crc32di
> >  #else
> > -#define CRC32_INST "crc32l %1, %0"
> > +#define CRC32_INST __builtin_ia32_crc32si
> >  #endif
>
> Do both gcc and clang consider these builtins to be a stable API, or do t=
hey
> only guarantee the stability of _mm_crc32_*() from immintrin.h?  At least=
 for
> the rest of the SSE and AVX stuff, I thought that only the immintrin.h fu=
nctions
> are actually considered stable.
>
I don't know the answer for this. In general, once we (Clang) create a
__builtin_* function it's not going away, because it will break anyone
who uses them. (I assume the same is true for GCC.) There's a note in
Documentation/arch/x86/x86_64/fsgs.rst in regards to using
_{read,write}fsbase_u64() from immintrin.h (see below). I don't know
if that's analogous to what I'm doing here, but maybe we should do
something similar for crc32intr.h?

FSGSBASE instructions compiler support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

GCC version 4.6.4 and newer provide intrinsics for the FSGSBASE
instructions. Clang 5 supports them as well.

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  _readfsbase_u64()   Read the FS base register
  _readfsbase_u64()   Read the GS base register
  _writefsbase_u64()  Write the FS base register
  _writegsbase_u64()  Write the GS base register
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

To utilize these intrinsics <immintrin.h> must be included in the source
code and the compiler option -mfsgsbase has to be added.


-bw
