Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28B29A0
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 15:38:42 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id r11so4748784ybg.6
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 08:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FIzZoUMMlZo2xbFysYwzT5d+VkgTyU4t3AvJRHmRmEk=;
        b=U3xuqft8TPHvYP2maeeI00cKq6/ujdWiowTLP8j5pW29X4lB4l9dxZrC4javlttHla
         lbQTHEEZEgCHgpZ+ZgNSt4HJiOPSwfuBaQ9Frb8vBeJJuqPN6uVhzDrNBNoT7WnPzTvH
         cJ/EGVlRqguLHJBxfD1ibOflCRjKjoIvG7XwDY1WMGqGA4td1iRugPdFI99sHzCeqWeC
         Zed+GS1P5kzUjQNXtcJy2uKtWxZs6R3Xqw5SlSYNU1PzZdLkktn78b6KBM7+FX27PWc+
         I0ZyiqCnYAhcHM1PSuavWUV2U2VA522aDg4AllF+GWCvJoCi/2ZGXWtIXF7HDN+Zatfb
         YrEQ==
X-Gm-Message-State: AOAM533LyQRtB+8uFsou7PXV+aRge5qss53HVmqw2YYloYUpJjKeK67o
	nS4swnr+qMuqvCEIY57Og7YhNIdUon0xrL5Y1Ow=
X-Google-Smtp-Source: ABdhPJymKictFepk7hSbmI5qmzHJTpYtQaHiuwIO4NPXTAJvGfgjPZjlsMduSyFq7UitUSiWiqlfpTOKNXxvz9NGEmM=
X-Received: by 2002:a5b:491:0:b0:64a:f42f:6973 with SMTP id
 n17-20020a5b0491000000b0064af42f6973mr11098514ybp.20.1652283521657; Wed, 11
 May 2022 08:38:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220510142550.1686866-1-mailhol.vincent@wanadoo.fr>
 <20220510142550.1686866-2-mailhol.vincent@wanadoo.fr> <CAKwvOdnorHJWesiardEnhYACM4NY_PHBHaoJZB1miJjgKukg2Q@mail.gmail.com>
 <CAMZ6RqLTNQnFantEoUToNPKitHr6A-9y88McDdwv83xwpFoekw@mail.gmail.com>
In-Reply-To: <CAMZ6RqLTNQnFantEoUToNPKitHr6A-9y88McDdwv83xwpFoekw@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Thu, 12 May 2022 00:38:30 +0900
Message-ID: <CAMZ6Rq+Nf=JTBAkb2O4PzLCFA6vWevC_zp1Z8icGf-KihsBA2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate
 constant expressions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed. 11 May 2022 at 08:54, Vincent MAILHOL
<mailhol.vincent@wanadoo.fr> wrote:
> On Wed. 11 May 2022 at 07:29, Nick Desaulniers <ndesaulniers@google.com> =
wrote:
> > On Tue, May 10, 2022 at 7:26 AM Vincent Mailhol
> > <mailhol.vincent@wanadoo.fr> wrote:
> > >
> > > For x86_64, the current ffs() implementation does not produce
> > > optimized code when called with a constant expression. On the
> > > contrary, the __builtin_ffs() function of both GCC and clang is able
> > > to simplify the expression into a single instruction.
> > >
> > > * Example *
> > >
> > > Let's consider two dummy functions foo() and bar() as below:
> > >
> > > | #include <linux/bitops.h>
> > > | #define CONST 0x01000000
> > > |
> > > | unsigned int foo(void)
> > > | {
> > > |       return ffs(CONST);
> > > | }
> > > |
> > > | unsigned int bar(void)
> > > | {
> > > |       return __builtin_ffs(CONST);
> > > | }
> > >
> > > GCC would produce below assembly code:
> > >
> > > | 0000000000000000 <foo>:
> > > |    0: b8 ff ff ff ff          mov    $0xffffffff,%eax
> > > |    5: 0f bc c7                bsf    %edi,%eax
> > > |    8: 83 c0 01                add    $0x1,%eax
> > > |    b: c3                      ret
> > > |    c: 0f 1f 40 00             nopl   0x0(%rax)
> > > |
> > > | 0000000000000010 <bar>:
> > > |   10: b8 19 00 00 00          mov    $0x19,%eax
> > > |   15: c3                      ret
> > >
> > > And clang would produce:
> > >
> > > | 0000000000000000 <foo>:
> > > |    0: 55                      push   %rbp
> > > |    1: 48 89 e5                mov    %rsp,%rbp
> > > |    4: b8 ff ff ff ff          mov    $0xffffffff,%eax
> > > |    9: 0f bc 05 00 00 00 00    bsf    0x0(%rip),%eax        # 10 <fo=
o+0x10>
> > > |   10: ff c0                   inc    %eax
> > > |   12: 5d                      pop    %rbp
> > > |   13: c3                      ret
> > > |   14: 66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
> > > |   1b: 00 00 00
> > > |   1e: 66 90                   xchg   %ax,%ax
> > > |
> > > | 0000000000000020 <bar>:
> > > |   20: 55                      push   %rbp
> > > |   21: 48 89 e5                mov    %rsp,%rbp
> > > |   24: b8 19 00 00 00          mov    $0x19,%eax
> > > |   29: 5d                      pop    %rbp
> > > |   2a: c3                      ret
> >
> > Right, we need to allocate registers to move the inputs into the asm
> > block, and the results back out. Inline asm is analogous to a call
> > with a custom calling convention, where we don't look into the body of
> > the inline asm.
> >
> > Does -fomit-frame-pointer clean make these snippets clearer, or did
> > you not build with -O2?  Consider using those flags if so, since we
> > generally prefer the ORC unwinder on x86, not the frame pointer
> > unwinder.  If the compilers are forcing a frame pointer when using the
> > builtins once optimizations are enabled, that's a problem (that we've
> > seen in the past with the builtins for reading eflags with clang; now
> > fixed).
>
> I have not played with those parameters yet, so short answer, I
> am using the kernel default (above assembly was compiled with
> Kbuild).  You are touching a few topics I am not familiar with, I
> need some research on this before answering you in more detail.

I got the answer: actually, I was using an allnoconfig when I
generated the above assembly code. And it appears that allnoconfig has
-fno-omit-frame-pointer by default. I will activate the ORC unwinder
and update the snippets in v2.

> > >
> > > For both examples, we clearly see the benefit of using __builtin_ffs(=
)
> > > instead of the kernel's asm implementation for constant expressions.
> > >
> > > However, for non constant expressions, the ffs() asm version of the
> > > kernel remains better for x86_64 because, contrary to GCC, it doesn't
> > > emit the CMOV assembly instruction, c.f. [1] (noticeably, clang is
> > > able optimize out the CMOV call).
> > >
> > > This patch uses the __builtin_constant_p() to select between the
> > > kernel's ffs() and the __builtin_ffs() depending on whether the
> > > argument is constant or not.
> > >
> > >
> > > As a side benefit, this patch also removes below -Wshadow warning:
> > >
> > > | ./arch/x86/include/asm/bitops.h:283:28: warning: declaration of 'ff=
s' shadows a built-in function [-Wshadow]
> > > |   283 | static __always_inline int ffs(int x)
> >
> > Nice! :)
>
> Thanks.
>
> For the record, fixing the -Wshadow is my real motivation. I am
> pissed when the header files through some W=3D12 warnings.  Once
> this patch is applied, there will be one last annoying W=3D2
> warning to clear in order to only see local warnings and not
> random spam from headers when doing a W=3D12 (at least on x86_64).
>
> But because those kinds of W=3D2 fixes aren't so popular, I figured
> it would be better to offer something else. I first checked if
> GCC produces less optimized code than the kernel assembly: that
> was still the case. I then looked at the GCC mailing list to see
> if discussion on this topic existed. Didn't find it but found
> instead that GCC could optimize constant expressions. And voil=C3=A0
> how I came to the creation of this patch.
>
> > >
> > > [1] commit ca3d30cc02f7 ("x86_64, asm: Optimise fls(), ffs() and fls6=
4()")
> > > http://lkml.kernel.org/r/20111213145654.14362.39868.stgit@warthog.pro=
cyon.org.uk
> >
> > + David, author of ca3d30cc02f7.  I was wondering if this applied to
> > more than just x86, but I see now that some architectures just include
> > include/asm-generic/bitops/builtin-ffs.h into their
> > arch/*/include/asm/bitops.h. It's only when we want to beat the
> > compiler for non-ICE expressions.
>
> Yes, I did a quick research, the majority of the architectures already
> rely on the builtin function.
> Would need to give a deeper look to track if anyone else other than
> x86 also uses assembly.
>
> Also, this potentially may apply to builtin functions other than
> the ffs family. Just did not find any other cases so far.
>
> > Patch LGTM; just minor comments on commit message, naming, and formatti=
ng.
> >
> > >
> > >
> > > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > > ---
> > >  arch/x86/include/asm/bitops.h | 29 +++++++++++++++++------------
> > >  1 file changed, 17 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bit=
ops.h
> > > index a288ecd230ab..535a7a358c14 100644
> > > --- a/arch/x86/include/asm/bitops.h
> > > +++ b/arch/x86/include/asm/bitops.h
> > > @@ -269,18 +269,7 @@ static __always_inline unsigned long __fls(unsig=
ned long word)
> > >  #undef ADDR
> > >
> > >  #ifdef __KERNEL__
> > > -/**
> > > - * ffs - find first set bit in word
> > > - * @x: the word to search
> > > - *
> > > - * This is defined the same way as the libc and compiler builtin ffs
> > > - * routines, therefore differs in spirit from the other bitops.
> > > - *
> > > - * ffs(value) returns 0 if value is 0 or the position of the first
> > > - * set bit if value is nonzero. The first (least significant) bit
> > > - * is at position 1.
> > > - */
> > > -static __always_inline int ffs(int x)
> > > +static __always_inline int __ffs_asm(int x)
> >
> > How about variable_ffs rather than __ffs_asm? Let's try to stick with
> > the convention used by test_bit?
>
> ACK. I will also follow this comment for path 2/2 and use
> __variable_ffs instead of __ffs_asm_not_zero there.
>
> > >  {
> > >         int r;
> > >
> > > @@ -310,6 +299,22 @@ static __always_inline int ffs(int x)
> > >         return r + 1;
> > >  }
> > >
> > > +/**
> > > + * ffs - find first set bit in word
> > > + * @x: the word to search
> > > + *
> > > + * This is defined the same way as the libc and compiler builtin ffs
> > > + * routines, therefore differs in spirit from the other bitops.
> > > + *
> > > + * ffs(value) returns 0 if value is 0 or the position of the first
> > > + * set bit if value is nonzero. The first (least significant) bit
> > > + * is at position 1.
> > > + */
> > > +#define ffs(x)                                 \
> > > +        (__builtin_constant_p(x) ?             \
> > > +         __builtin_ffs(x) :                    \
> > > +         __ffs_asm(x))
> > > +
> >
> > I think this whole #define can fit on one line?
>
> I split it into multiple lines to be consistent with other macros
> in the file. I have no objections to doing it on a single line (I
> will just check if this is within the 80 characters limit and if
> so, will do a single line in v2).
>
> > If not, perhaps the
> > BCP can start on the initial line?  Otherwise it looks like the
> > then/else clauses are indented by 1 tab followed by 1 space. Consider
> > just using tabs.
>
> Right, I inadvertently added a space after the tab of the first
> line and the editor auto indentation repeated the patterns on the
> other lines.
>
> With that said, I will prepare the v2. I will send it within two
> days I think (can not do it right now).
>
> > >  /**
> > >   * fls - find last set bit in word
> > >   * @x: the word to search
> > > --
> > > 2.35.1
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
