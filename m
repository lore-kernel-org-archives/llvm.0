Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A9B4C62
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 19:06:55 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id u12so4664864pjj.1
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=W3ASQ/4BEnMmDHF1uq/+A5cnEmR5wykxy9kK3sptaxY=;
        b=o6gF0BIPfROOsR+RzwsAhXruWNZRLqgFj0clWAglKOSG6A8mI2OJ11R071Ajl+7I7x
         eRlCM2OxVKD9YP5SfA5jG3+3W6vrq3FX40SSBJbOsDjO+D7hY9/gxYfJw3kLztM6VHCn
         gO0EFxeVBI+TOuMG0StvdWRvdYIVzNnRTpkW3B0/YK6PMcrJtWFQkD0HhaHDWHSV+Jf7
         AYtjmiMK+pWWigbCORaJMc7qdvSWiJrNOZfbojVi8in8DTf/0OUbT4sMKkPbiCcCQrHX
         bokGF1KrfBdaQpETmNlr8zMoGV04aSDGAxhP3RAfuSeRi3hbRd35wqn2VMhN5L15xVra
         Fp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=W3ASQ/4BEnMmDHF1uq/+A5cnEmR5wykxy9kK3sptaxY=;
        b=WobcNDCYFNM2QbL4/MNg2Vm9akf1FT1vXC/NHqoRJ+cjC667v+PethVTOMn4vR190j
         S6YKUJJVkkdkuTs35n0u+saX19xhw+iFnzlLqpadub0bcH8ObOAP0odEhbDIBmspToiT
         WxCJX44llb9Shiarq77GUWqCOtycdPw3BOulUrC0F30+NI5Y31fStuToPdK635+tfZqC
         VuLX6R0xe6/8c7SNd4FLbQLarZX5r4oO31HuE/IU+15pY7tyPuKlnH4cfr30NdlbWmp4
         gE0q4VzRCWg1qIs+R1SmipxDXNeQuz+yrWoA76OWt3ikQ8eqSln92NTo3hYyEh+pa/le
         S29Q==
X-Gm-Message-State: ACrzQf29ltJV6TQo/cpgfCE4Flf4N9rORiI/PgQEW8lbJ/auNFiclEag
	/Avl1K8oh2JV+NKoixsRna8E5YuAL/aCBEcUnTf3iA==
X-Google-Smtp-Source: AMsMyM4fP4mGUPlpcS8f4HUJXSMvxbW2E37cAr05PH8PpgKS1vmQtjs+RLpeNam1jtgkpIf0o2JRQaLDbTXGtUcjDvs=
X-Received: by 2002:a17:90b:33c9:b0:200:a0ca:e6c8 with SMTP id
 lk9-20020a17090b33c900b00200a0cae6c8mr11977762pjb.147.1664392014929; Wed, 28
 Sep 2022 12:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209271333.10AE3E1D@keescook> <20220927210248.3950201-1-ndesaulniers@google.com>
 <a753c608-813a-f880-67ca-f16fe503b152@rasmusvillemoes.dk>
In-Reply-To: <a753c608-813a-f880-67ca-f16fe503b152@rasmusvillemoes.dk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Sep 2022 12:06:43 -0700
Message-ID: <CAKwvOd=C=yhC5-fBVxD18GSWOibPpSJ1G4bfM=X0bw+LpTsfgg@mail.gmail.com>
Subject: Re: [PATCH v3] x86, mem: move memmove to out of line assembler
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 28, 2022 at 12:24 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 27/09/2022 23.02, Nick Desaulniers wrote:
>
> > +     /* Decide forward/backward copy mode */
> > +     cmpl    dest, src
> > +     jb      .Lbackwards_header
>
> I know you're mostly just moving existing code, but for my own education
> I'd like to understand this.
>
> > +     /*
> > +      * movs instruction have many startup latency
> > +      * so we handle small size by general register.
> > +      */
> > +     cmpl    $680, n
> > +     jb      .Ltoo_small_forwards
>
> OK, this I get, there's some overhead, and hence we need _some_ cutoff
> value; 680 is probably chosen by some trial-and-error, but the exact
> value likely doesn't matter too much.

__memmove in arch/x86/lib/memmove_64.S uses the same value.
But I assume this is precisely why FSRM was created.
https://www.phoronix.com/news/Intel-5.6-FSRM-Memmove
commit f444a5ff95dc ("x86/cpufeatures: Add support for fast short REP; MOVSB")

>
> > +     /*
> > +      * movs instruction is only good for aligned case.
> > +      */
> > +     movl    src, tmp0
> > +     xorl    dest, tmp0
> > +     andl    $0xff, tmp0
> > +     jz      .Lforward_movs
>
> But this part I don't understand at all. This checks that the src and
> dest have the same %256 value, which is a rather odd thing, and very
> unlikely to ever be hit in practice. I could understand if it checked
> that they were both 4 or 8 or 16-byte aligned (i.e., (src|dest)&FOO)),
> or if it checked that they had the same offset within a cacheline [say
> (src^dest)&0x3f].
>
> Any idea where that comes from? Or am I just incapable of reading x86 asm?

So I think the above is roughly:
if ((src ^ dest) & 0xff == 0)
  goto .Lforward_movs;

So if src or dest don't have the same bottom byte value, don't use movs?

>
> > +.Ltoo_small_forwards:
> > +     subl    $0x10, n
> > +
> > +     /*
> > +      * We gobble 16 bytes forward in each loop.
> > +      */
> > +.L16_byteswap_forwards_loop:
> > +     subl    $0x10, n
> > +     movl    0*4(src), tmp0
> > +     movl    1*4(src), tmp1
> > +     movl    tmp0, 0*4(dest)
> > +     movl    tmp1, 1*4(dest)
> > +     movl    2*4(src), tmp0
> > +     movl    3*4(src), tmp1
> > +     movl    tmp0, 2*4(dest)
> > +     movl    tmp1, 3*4(dest)
> > +     leal    0x10(src), src
> > +     leal    0x10(dest), dest
> > +     jae     .L16_byteswap_forwards_loop
> > +     addl    $0x10, n
> > +     jmp     .L16_byteswap
> > +
> > +     /*
> > +      * Handle data forward by movs.
> > +      */
> > +.p2align 4
> > +.Lforward_movs:
> > +     movl    -4(src, n), tmp0
> > +     leal    -4(dest, n), tmp1
> > +     shrl    $2, n
> > +     rep     movsl
> > +     movl    tmp0, (tmp1)
> > +     jmp     .Ldone
>
> So in the original code, %1 was forced to be %esi and %2 was forced to
> be %edi and they were initialized by src and dest. But here I fail to
> see how those registers have been properly set up before the rep movs;
> your names for those are tmp0 and tmp2. You have just loaded the last
> word of the source to %edi, and AFAICT %esi aka tmp2 is entirely
> uninitialized at this point (the only use is in L16_byteswap).
>
> I must be missing something. Please enlighten me.

No, you're right.  It looks like rep movsl needs src in %esi and dest
needs to be in %edi, so I can't reuse the input registers from
-mregparm=3; a pair of movs is required.  A v4 is required.

Probably should write a test for memcpy where n > magic constant 680.
-- 
Thanks,
~Nick Desaulniers
