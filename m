Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59313FC2
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 15:49:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id m3so3068136eda.12
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 08:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4dhFsHlPlvcgQnVjUa+mHnTzrJV68XTZuGnDxYxZSu4=;
        b=IN4R36fVYPVs6/B3yawNpatvT0g56oTugoNv50vlbOXyXAsWcQoX74Glmu+xcRhOae
         GvAaCg3MG/L8Q3tas9HwCOXN3WC128YoUW6cyI94sICqKBOFj+qu5Pqj+Xtjd7FCE/B9
         KkxrkeW/KK4wmkj30T3mcNCqF/q+6LqDkPiPNAKPsxrctP5e4Kojgv2JnihFQoPjqdJ/
         DM/T11hN+TzYjoppc5tkW7sVbID5LzLP59xDvMfco3TjvCbrG0Oq/OjRNaBHrGmkAU+U
         11JcCqoTcYzdCIF31VPjJE7zXI8LZoG7BMP+YKmd9Nk/SlkVy6K+g49IFh1ZQOJfuSxr
         8gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4dhFsHlPlvcgQnVjUa+mHnTzrJV68XTZuGnDxYxZSu4=;
        b=tgYzic7nnlTjsm0ckj/Bzuesy/Eq2gzgYZV8fVEqiGlJ4sYreXN6Z7aY/rtc/cezGf
         IdHcfl2cO7Y/4tEo4gu8KTJEATqRyUZeccHFew3RYv3f8pmVJDzdCznRxNh7ayWGgjA7
         Vw9nFC7xjXeMhmyL4D9TyoZwWdHuYsxHrHXsNAO+F+NBUY4ygoCnVH4JRLH7YnVOaFgU
         Cyj8wPf/P8Go/UdtAOToAUPd1fLm2Oa4wBcWks2q/HorBwPt5Is9FBG+hypHQyJLFPAK
         TtHB8bVBaPNeksxAo5zabSv8AU3wRxYhu3ABu6TmjpWc34xKQM+TA7jtO7iK4CkXJksQ
         11Dg==
X-Gm-Message-State: ACgBeo0q5f7cRFoM5HaYe81828pJ68/XCYqTvev7qJoUg2T0HiJ9PjOq
	lNS5i1HWpb4soFsAcvvsmwcW+48gXD9jgGAKD19+
X-Google-Smtp-Source: AA6agR6Z4Bn46EoUvSA1obe0hHw0oo1/HH93DbRoRMf9w53XlRDeYqGX/S8m5ayEPeAxSsXgKiop3kZAgsLMXX0XPUY=
X-Received: by 2002:a05:6402:274c:b0:44f:334e:1e11 with SMTP id
 z12-20020a056402274c00b0044f334e1e11mr28344216edd.304.1663170575800; Wed, 14
 Sep 2022 08:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220902213750.1124421-1-morbo@google.com> <20220902213750.1124421-3-morbo@google.com>
 <202209022251.B14BD50B29@keescook> <CAGG=3QXpK+bFOSYZkdNNFGzNfgJSSADGTRWYRv6z0vfBAgQvWQ@mail.gmail.com>
 <CAKwvOdm+kVTrqMrSPHwTa0NrG9qwTcFkGnikjYjk0ctFGBfeRA@mail.gmail.com>
 <YxhbO1YZPMHutw48@hirez.programming.kicks-ass.net> <YyHn+UbfC7e1XIT3@dev-arch.thelio-3990X>
In-Reply-To: <YyHn+UbfC7e1XIT3@dev-arch.thelio-3990X>
From: Bill Wendling <morbo@google.com>
Date: Wed, 14 Sep 2022 16:49:19 +0100
Message-ID: <CAGG=3QVCH+Cgki8_Jvsj3Jz3=4Tpot4aHN_obY7Hy3wAwEODhA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/paravirt: add extra clobbers with
 ZERO_CALL_USED_REGS enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <keescook@chromium.org>, Juergen Gross <jgross@suse.com>, 
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>, Alexey Makhalov <amakhalov@vmware.com>, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux-foundation.org, 
	LKML <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 14, 2022 at 3:41 PM Nathan Chancellor <nathan@kernel.org> wrote:
> On Wed, Sep 07, 2022 at 10:50:03AM +0200, Peter Zijlstra wrote:
> > On Tue, Sep 06, 2022 at 11:00:07PM -0700, Nick Desaulniers wrote:
> > > On Sun, Sep 4, 2022 at 11:02 PM Bill Wendling <morbo@google.com> wrote:
> > > >
> > > > On Sat, Sep 3, 2022 at 12:18 AM Kees Cook <keescook@chromium.org> wrote:
> > > > >
> > > > > On Fri, Sep 02, 2022 at 09:37:50PM +0000, Bill Wendling wrote:
> > > > > > [...]
> > > > > >         callq   *pv_ops+536(%rip)
> > > > >
> > > > > Do you know which pv_ops function is this? I can't figure out where
> > > > > pte_offset_kernel() gets converted into a pv_ops call....
> > > > >
> > > > This one is _paravirt_ident_64, I believe. I think that the original
> > > > issue Nathan was seeing was with another seemingly innocuous function.
> > >
> > > _paravirt_ident_64 is marked noinstr, which makes me suspect that it
> > > really needs to not be touched at all by the compiler for
> > > these...special features.
> >
> > My source tree sayeth:
> >
> >   u64 notrace _paravirt_ident_64(u64 x)
> >
> > And that function is only ever called at boot, after alternatives runs
> > it's patched with:
> >
> >   mov %_ASM_ARG1, %_ASM_AX
> >
> > Anyway, if you want to take it away from the compiler, something like
> > so should do.
>
> This appears to work fine for me in QEMU, as I can still boot with
> CONFIG_ZERO_CALL_USED_REGS and spawn a nested guest without any issues.
>
Thanks, Nathan. I much prefer to use this patch then and file a
separate issue to investigate the clobbers issue for later.

-bw

> > diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
> > index 7ca2d46c08cc..8922e2887779 100644
> > --- a/arch/x86/kernel/paravirt.c
> > +++ b/arch/x86/kernel/paravirt.c
> > @@ -80,11 +80,16 @@ static unsigned paravirt_patch_call(void *insn_buff, const void *target,
> >  }
> >
> >  #ifdef CONFIG_PARAVIRT_XXL
> > -/* identity function, which can be inlined */
> > -u64 notrace _paravirt_ident_64(u64 x)
> > -{
> > -     return x;
> > -}
> > +extern u64 _paravirt_ident_64(u64 x);
> > +asm (".pushsection .entry.text, \"ax\"\n"
> > +     ".global _paravirt_ident_64\n"
> > +     "_paravirt_ident_64:\n\t"
> > +     ASM_ENDBR
> > +     "mov %" _ASM_ARG1 ", %" _ASM_AX "\n\t"
> > +     ASM_RET
> > +     ".size _paravirt_ident_64, . - _paravirt_ident_64\n\t"
> > +     ".type _paravirt_ident_64, @function\n\t"
> > +     ".popsection");
> >  #endif
> >
> >  DEFINE_STATIC_KEY_TRUE(virt_spin_lock_key);
> >
