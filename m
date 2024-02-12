Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5A39FC3
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707738735; cv=none; b=Zkyh+cH83mlfXQalZ89lQTuat+82fXBPedGEOLiyfLMlTHGbnHt5x4Dq528tmei5AdV2TWLslpb88XUTUTFroqBrCzB3V5jno4OGZmNb6C3Abh2VFjdKN1mczY5kfm6MmMFlZ1yoGlNMy8Fkpzt1yrDfWufkA/Bjc5AvIdYilfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707738735; c=relaxed/simple;
	bh=IIJ7UpRpiR1RBF6szjseHmqF1nSqMFZ/aVFQ4VSgasw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4J58Sw2Pz+iZDFpa7lDKTdgH7J6+9aY0QHCMKuiexnC4lUsAii984xZXyqjb4YZ8JotlKZ2+TV8ioepC4305FHTZ1Uju+nP/kLLWzJrq6cnsArxahb4sSOMxVzAINmsaiOzZq4ivjp2CDX6auRtp1tuSlMfEzZmzXHZ6j22YoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpxuRcnw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpxuRcnw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC827C43394
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707738734;
	bh=IIJ7UpRpiR1RBF6szjseHmqF1nSqMFZ/aVFQ4VSgasw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qpxuRcnwemDeo6lXv5+DQqqUxNPpEn9w2LDjrtj71b/OY/Dy/igCCnVU18sTzWZhK
	 EjQNpj6bpjcI60BGc3O4Rmhbam9OHLscHLTCHq/np0L3PL6O+rvbbBIoTTle7/4XAd
	 LAwf+fWdG6ncSPkhtgW+/07/7A7R5v0S4Zg/rC6CmGuHPhJ7G0Mea5E7rq8y/NLsvK
	 j77sjYavNySYOEjGKlRreYXCEz3ZsA58VHL3bOncVw+vGi0SE5js3SR732ro4iWrVX
	 xqjkbglM69lodfNd8NlmV2EeSEqdJvSCGMebnCHUUZZ+Ckhcw9q4ND5gg8gFv7fGI4
	 t6/rK9Xu+t4Sg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5116588189aso5433522e87.1
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 03:52:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6A7G9Wj6X0+2ibF9kLA/FWzSXT97BcJDCzcZB8nwgP3oU4uSanzdu9uBBPjG0yeRUcrOKnOEMA0Z0OBfw+1DW979oag==
X-Gm-Message-State: AOJu0Yzv1UPouUIpyLxa5d4B2BifHcfsZ8z5dn0NY6tVTf5YnVj0rGrX
	jOLaDNkqgxbWRNc2DMYDxCCWsklHEtDPgZHRoPpfaA4LOhy/T3k15r+8mdcMI5ly6+EYTBL52KC
	st1ZOLyLVNrEYZHeyO5G4QH8WqKA=
X-Google-Smtp-Source: AGHT+IEU3p/a6dR89ftZiMJ/2uAey8PZzo/ZBrpk8p+hlzOP+4Q+BDJs4qS3F4Z4AygUj+xfJErPICriWOikHjKTGL0=
X-Received: by 2002:a05:6512:2824:b0:511:4683:d537 with SMTP id
 cf36-20020a056512282400b005114683d537mr4364819lfb.55.1707738733104; Mon, 12
 Feb 2024 03:52:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
 <20240129180502.4069817-29-ardb+git@google.com> <20240212102901.GVZcny7WeK_ZWt0HEP@fat_crate.local>
In-Reply-To: <20240212102901.GVZcny7WeK_ZWt0HEP@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 12 Feb 2024 12:52:01 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH2uwLT-EgqYFRcC0OH524W=sYtDoFC-x+isifzsia17w@mail.gmail.com>
Message-ID: <CAMj1kXH2uwLT-EgqYFRcC0OH524W=sYtDoFC-x+isifzsia17w@mail.gmail.com>
Subject: Re: [PATCH v3 08/19] x86/head64: Replace pointer fixups with PIE codegen
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Kevin Loughlin <kevinloughlin@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Feb 2024 at 11:29, Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, Jan 29, 2024 at 07:05:11PM +0100, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Some of the C code in head64.c may be called from a different virtual
> > address than it was linked at. Currently, we deal with this by using
>
> Yeah, make passive pls: "Currently, this is done by using... "
>
> > ordinary, position dependent codegen, and fixing up all symbol
> > references on the fly. This is fragile and tricky to maintain. It is
> > also unnecessary: we can use position independent codegen (with hidden
>                    ^^^
> Ditto: "use ..."
>
> In the comments below too, pls, where it says "we".
>

Ack.

> > visibility) to ensure that all compiler generated symbol references are
> > RIP-relative, removing the need for fixups entirely.
> >
> > It does mean we need explicit references to kernel virtual addresses to
> > be generated by hand, so generate those using a movabs instruction in
> > inline asm in the handful places where we actually need this.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/Makefile                 |  8 ++
> >  arch/x86/boot/compressed/Makefile |  2 +-
> >  arch/x86/include/asm/desc.h       |  3 +-
> >  arch/x86/include/asm/setup.h      |  4 +-
> >  arch/x86/kernel/Makefile          |  5 ++
> >  arch/x86/kernel/head64.c          | 88 +++++++-------------
> >  arch/x86/kernel/head_64.S         |  5 +-
> >  7 files changed, 51 insertions(+), 64 deletions(-)
> >
> > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > index 1a068de12a56..2b5954e75318 100644
> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -168,6 +168,14 @@ else
> >          KBUILD_CFLAGS += -mcmodel=kernel
> >          KBUILD_RUSTFLAGS += -Cno-redzone=y
> >          KBUILD_RUSTFLAGS += -Ccode-model=kernel
> > +
> > +     PIE_CFLAGS-$(CONFIG_STACKPROTECTOR)     += -fno-stack-protector
>
> Main Makefile has
>
> KBUILD_CFLAGS += -fno-PIE
>
> and this ends up being:
>
> gcc -Wp,-MMD,arch/x86/kernel/.head64.s.d -nostdinc ... -fno-PIE ... -fpie ... -fverbose-asm -S -o arch/x86/kernel/head64.s arch/x86/kernel/head64.c
>
> Can you pls remove -fno-PIE from those TUs which use PIE_CFLAGS so that
> there's no confusion when staring at V=1 output?
>

Yeah. That would means adding PIE_CFLAGS_REMOVE alongside PIE_CFLAGS
and applying both in every place it is used, but we are only dealing
with a handful of object files here.


> > +     PIE_CFLAGS-$(CONFIG_LTO)                += -fno-lto
> > +
> > +     PIE_CFLAGS := -fpie -mcmodel=small $(PIE_CFLAGS-y) \
> > +                   -include $(srctree)/include/linux/hidden.h
> > +
> > +     export PIE_CFLAGS
> >  endif
> >
> >  #
>
> Other than that, that code becomes much more readable, cool!
>

Thanks. But now that we have RIP_REL_REF(), I might split the cleanup
from the actual switch to -fpie, which I am still a bit on the fence
about, given different compiler versions, LTO, etc.

RIP_REL_REF(foo) just turns into 'foo' when compiling with -fpie and
we could drop those piecemeal once we are confident that -fpie does
not cause any regressions.

Note that I have some reservations now about .pi.text as well: it is a
bit intrusive, and on x86, we might just as well move everything that
executes from the 1:1 mapping into .head.text, and teach objtool that
those sections should not contain any ELF relocations involving
absolute addresses. But this is another thing that I want to spend a
bit more time on before I respin it, so I will just do the cleanup in
the next revision, and add the rigid correctness checks the next
cycle.
