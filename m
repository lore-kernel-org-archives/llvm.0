Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A52C82
	for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 17:46:39 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x27so45169804lfu.5
        for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G3liRWXWYS1s+kXeJAAKWiMsrJmxBJ1cDV26MMJDbes=;
        b=TnW3ABm0OVJvzPER3UibMgD2tHUWx8hIodouprolo1pQ2KcV7bKQL0W76OF0nQEwqE
         CS3avdCajvbDwFOzmCvQPcnST3AY2ZA/5G+9H2pleAT2YuPCvd4fuoawZVYTRA5cZzky
         NxeAh/qHsMmAgiFUrOw3qxRPCXYMZRbNLKyjci1/8UHRom3LINvZy//ZR90Pqj40D5ng
         wS98C3Aempy+c/KSaPERJlrPKcf6KVYJuFS4TDM6TsbFL4sVXVjbZOshphSqehtntNIa
         U/JPGmgTOdvddKiYJ/HZlKbiOtYhavrEuetc1ZTDMC/BwmQESrsbJNQzJ+AgUx3vFr+n
         f/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G3liRWXWYS1s+kXeJAAKWiMsrJmxBJ1cDV26MMJDbes=;
        b=SL/cTmYzaNBGQRW9dcTMPY7kx+LOvoJ0srANGw8FEcbyUa1lNGiTNLwM4fSpbBtz3F
         BFYCueYCqagkgvcCbTL4YoY1iu24UZzVBr5cDNj9UbYRyaTpRLn9l+ieCfGzFXxIRD0o
         mkd582krwwMxKv4Ec3RNd/M6L89sM0uVHjMEnetKKOM4F0zrsQMOlAwUXUJcZMQKuGAH
         VbCfIOpaiUH3aChcD6j0JZyGc6X2qbAnvd0FGR4xDM69QzkDkXfh8L/RBun1w73FVzSe
         kNfsPiL5l9DTKGs3UMnQcVZvY69G4eaJ9T+U5UzsdslxbI6nm7fO2jOqCL3znQ+KjWWI
         enPw==
X-Gm-Message-State: AOAM533hmuv0TFAYB4JokxiQa7p13YUMW45gziFwp7Pv6fFL8qP0aC4o
	AQ7Grd5ZRcKQic88dnLSiAEdMUJuM8GOXgFbZkyJiA==
X-Google-Smtp-Source: ABdhPJzy6SjwnBkv257ZaQikJimUQZzZ6gtTxUBcl0CKOc48sbCnffXN2ruUTxquuXfacw9kpNhJsKXPMQBRIts8KKk=
X-Received: by 2002:a05:6512:398f:: with SMTP id j15mr11738210lfu.523.1634319997584;
 Fri, 15 Oct 2021 10:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211015085148.67943-1-pbonzini@redhat.com> <YWmuPOB6/rXWqXBH@archlinux-ax161>
In-Reply-To: <YWmuPOB6/rXWqXBH@archlinux-ax161>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Oct 2021 10:46:25 -0700
Message-ID: <CAKwvOdmnHYRqGxgx+G-_nAMC4ViYxYtTX4JMZ8b3YdXCrj=5tw@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: avoid warning with -Wbitwise-instead-of-logical
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	seanjc@google.com, torvic9@mailbox.org, Jim Mattson <jmattson@google.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 9:37 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Oct 15, 2021 at 04:51:48AM -0400, Paolo Bonzini wrote:
> > This is a new warning in clang top-of-tree (will be clang 14):
> >
> > In file included from arch/x86/kvm/mmu/mmu.c:27:
> > arch/x86/kvm/mmu/spte.h:318:9: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
> >         return __is_bad_mt_xwr(rsvd_check, spte) |
> >                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >                                                  ||
> > arch/x86/kvm/mmu/spte.h:318:9: note: cast one or both operands to int to silence this warning
> >
> > Reported-by: torvic9@mailbox.org
> > Suggested-by: Jim Mattson <jmattson@google.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Link: https://github.com/ClangBuiltLinux/linux/issues/1474
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> > ---
> >  arch/x86/kvm/mmu/spte.h | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
> > index eb7b227fc6cf..32bc7268c9ea 100644
> > --- a/arch/x86/kvm/mmu/spte.h
> > +++ b/arch/x86/kvm/mmu/spte.h
> > @@ -314,9 +314,12 @@ static __always_inline bool is_rsvd_spte(struct rsvd_bits_validate *rsvd_check,
> >        * Use a bitwise-OR instead of a logical-OR to aggregate the reserved
> >        * bits and EPT's invalid memtype/XWR checks to avoid an extra Jcc
> >        * (this is extremely unlikely to be short-circuited as true).
> > +      *
> > +      * (int) avoids clang's "use of bitwise '|' with boolean operands"
> > +      * warning.
> >        */
> > -     return __is_bad_mt_xwr(rsvd_check, spte) |
> > -            __is_rsvd_bits_set(rsvd_check, spte, level);
> > +     return (int)__is_bad_mt_xwr(rsvd_check, spte) |
> > +            (int)__is_rsvd_bits_set(rsvd_check, spte, level);
> >  }
> >
> >  static inline bool spte_can_locklessly_be_made_writable(u64 spte)
> > --
> > 2.27.0
> >
> >
>


-- 
Thanks,
~Nick Desaulniers
