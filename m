Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC632C85
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 16:07:59 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id k26so5869118pfi.5
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xzTnwoLnAg4yxUR1p1+niMEXmCm4LAESQ8zfxJgSW1o=;
        b=Ke9pXYHmXhwSgHX+YlH/Fu/CIUIXF0r9+cIIbJ+u8uwBH40bgXaajqMDaKdSJTgwWF
         M2GuJspn2mgigOtqNVrHeWckm84ShMqYg7P+fDjD+6f7IQAfaw3SOhPahKblO7vl8UjR
         ILEDrnZpsPx/TEw3NxKJY+EtKt1nDTc1nPKoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xzTnwoLnAg4yxUR1p1+niMEXmCm4LAESQ8zfxJgSW1o=;
        b=63NpT7Hsdht9ZuxGgxz1Ab/MiCO7kNov72qI2BvGDilPr8FM9PWE1KSDQxldDGfmho
         jEj15ze962rgwdbbRWJcXKc2fIAHJ2FHnTGumWpW0I6ODH/jK3PuYgxpIPCYGAfXhIRo
         UCmXR6vYf5bQdG1KZAGhp+X5xN7t/zFNyyfkcVqikm6DTYGacfD8T26CE1daKGxe4kun
         KTvgDyc4ePBgHQ9AnpkrHl1preqRaX+x6+jULQcpgStrbd+lBjdehoN/MC391EJsNBDp
         XGR3y9tB9MiJ8OhgpUsdCJDPTug8+32QAWc7ZPi4gr2kz8K+kbymb8l87qiYqqD+AqIE
         L1eA==
X-Gm-Message-State: AOAM532XMznG51moPLmiRjEKzqrHFQuZN1YtgYGfyhMqoU2sMV1ZXPvN
	ooQGK5JyRTmvaOK9ad5yA8xKeQ==
X-Google-Smtp-Source: ABdhPJxyurXNLP1RI1utm/SWbqiR/ZAsDnv9BxxxdyJA1udvk/MOmScduj8UgTO+HmtPIoThB6A4ug==
X-Received: by 2002:a05:6a00:1344:b0:44c:4cd7:4d4b with SMTP id k4-20020a056a00134400b0044c4cd74d4bmr6318994pfu.50.1634227679225;
        Thu, 14 Oct 2021 09:07:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j6sm2895326pfb.175.2021.10.14.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:07:58 -0700 (PDT)
Date: Thu, 14 Oct 2021 09:07:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Sami Tolvanen <samitolvanen@google.com>, x86@kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 09/15] x86: Use an opaque type for functions not
 callable from C
Message-ID: <202110140904.41B5183E@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-10-samitolvanen@google.com>
 <YWgSwmzPFrRbMC1P@zn.tnic>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWgSwmzPFrRbMC1P@zn.tnic>

On Thu, Oct 14, 2021 at 01:21:38PM +0200, Borislav Petkov wrote:
> On Wed, Oct 13, 2021 at 11:16:52AM -0700, Sami Tolvanen wrote:
> > The kernel has several assembly functions that are not directly callable
> > from C. Use an opaque type for these function prototypes to make misuse
> > harder, and to avoid the need to annotate references to these functions
> > for Clang's Control-Flow Integrity (CFI).
> > 
> > Suggested-by: Andy Lutomirski <luto@amacapital.net>
> > Suggested-by: Alexander Lobakin <alobakin@pm.me>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > ---
> >  arch/x86/include/asm/ftrace.h         |  2 +-
> >  arch/x86/include/asm/idtentry.h       | 10 +++++-----
> >  arch/x86/include/asm/page_64.h        |  7 ++++---
> >  arch/x86/include/asm/paravirt_types.h |  3 ++-
> >  arch/x86/include/asm/processor.h      |  2 +-
> >  arch/x86/include/asm/proto.h          | 25 +++++++++++++------------
> >  arch/x86/include/asm/uaccess_64.h     |  9 +++------
> >  arch/x86/kernel/alternative.c         |  2 +-
> >  arch/x86/kernel/ftrace.c              |  2 +-
> >  arch/x86/kernel/paravirt.c            |  4 ++--
> >  arch/x86/kvm/emulate.c                |  4 ++--
> >  arch/x86/kvm/kvm_emulate.h            |  9 ++-------
> >  arch/x86/xen/enlighten_pv.c           |  6 +++---
> >  arch/x86/xen/xen-ops.h                | 10 +++++-----
> >  14 files changed, 45 insertions(+), 50 deletions(-)
> 
> No matter from which direction I look at it, wrapping some functions
> which a crazy macro doesn't look good.
> 
> So what's the plan here?
> 
> Everytime someone adds an asm function which is not callable from C but
> forgets to use that magic macro, someone from team CFI will send a patch
> fixing that?
> 
> I.e., a whack-a-mole game?

I don't think it's a super common thing to add, so in this case, yes,
I think doing it on a case-by-case basis will be fine. This is common
practice in the kernel; not everyone tests all CONFIGs, so stuff gets
missed, patches are sent, life goes on. :)

> If we're going to do that keep-CFI-working game, we might just as well
> not do the macro but use the C code it evaluates to, so that at least it
> looks ok-ish:
> 
> DECLARE_NOT_CALLED_FROM_C(int3_magic);
> 
> vs
> 
> extern const u8 int3_magic[];

I'd _much_ prefer keeping the macro, as it explains what's going on,
which doesn't require a comment at every "extern const u8 foo[]" usage.
It serves as an annotation, etc.

And, there's been a lot of discussion on the best way to do this, what
to name it, etc. This looks to be the best option currently.

-Kees

-- 
Kees Cook
