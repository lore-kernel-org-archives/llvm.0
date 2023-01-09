Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D25233
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 22:21:58 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id 17so11199079pll.0
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 14:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lYRWg/J0ttDlaWM6UjZHnwN9ihNosYMSn3gAowHT2M=;
        b=iZkHJUsyXNwcsEHrsbTJYu+zqyvldkM3q+Jfocy7lLDq1f7yOgQS1qKFoy5t4X5pG9
         Lf/ZF8NRkoj5rP8ngrUbICNDbgpVxXPWsloJhs+CgsIOpuTXQJYx9vidSOSymo+S/Ije
         ZRdYM3E+gr4cegsnPR9y6mWYIIos6agegktTw69vzRhPWvB31/70485UOuHiIZt7kvKI
         SBA2Oyi6BTPPCUvJIXk/eECcarBR62uD3hPBv+usIaj97tq7BVt+dtDkYzmI7cQtyels
         t9bd4Aphg7YAQPz0VZdAi/yap0q2tswAhG4V+3glGwKWobeSKDbnEQsQ3A5njX97VoCm
         NCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lYRWg/J0ttDlaWM6UjZHnwN9ihNosYMSn3gAowHT2M=;
        b=M13g+ZKE0oS/BiaH12ADVXhPKzpC/kkQXKOJLr3CCWA4D1pQ3JguUgICo1hAQISm2W
         VSdlnyWN1WdXdLOZ6vO1jxq1o0wU29kxNqD22jKIgMhrFiiY0l24m//S25mevA6orNbW
         yFq8fLfX85et9pKPKt1D/qWd5C2AqKLcQ6iXBGBZgB1tXasA6wEldFQrdbPTB5b/LjKr
         tpcjbUkZqR/TxTWzcWBMfJhIFIPZms4XCgqqmyF71yiFvSJwkuBCxspxM1W3SxiSTGXC
         9UdbFmmlI2pnMYvgYqXRps59Sa6y4Ga+gWzdGN91UJRgsZ/qDKHyK20SBLWxRswbn9sh
         axSQ==
X-Gm-Message-State: AFqh2kpjyo6+130gRUOP3HvelyjhGGJ4fUY/Pt5GEb9iERx/5DD3w8Gt
	3+gE+OQkQDnZACw171SUgatdQKWuCERWsMzhWgbPqg==
X-Google-Smtp-Source: AMrXdXucbZiJrH1ZgxnLhDID88TWaIKL8fHclfX+Cw9XnW12o2dLaMix9Djfz5cY+2Sta5hP/Ikhd0ti7JTVF7GsPaw=
X-Received: by 2002:a17:902:c94d:b0:191:24d1:3b31 with SMTP id
 i13-20020a170902c94d00b0019124d13b31mr2860808pla.94.1673302917777; Mon, 09
 Jan 2023 14:21:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <Y7yR65TeqQXU/4nS@dev-arch.thelio-3990X>
In-Reply-To: <Y7yR65TeqQXU/4nS@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 14:21:46 -0800
Message-ID: <CAKwvOdn5Wmi+b7x9DniE0=aCqFfLFwusAi2Ny-bfMNfncp5dUg@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 9, 2023 at 2:15 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Jan 09, 2023 at 01:58:32PM -0800, Nick Desaulniers wrote:
> > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > warns that ASFLAGS contains '-s', which is a linking phase option, so it
> > > is unused.
> > >
> > >   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> > >
> > > Looking at the GAS sources, '-s' is only useful when targeting Solaris
> > > and it is ignored for the powerpc target so just drop the flag
> > > altogether, as it is not needed.
> >
> > Do you have any more info where you found this?  I don't see -s
> > documented as an assembler flag.
> > https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
> > https://sourceware.org/binutils/docs/as/Invoking.html
>
> Sure thing, sorry I did not include it initially. See the section from
> line 1284 to 1291 or search for "case 's':":
>
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-ppc.c;h=9450fa74de1b61542c9a18babf8c8f621ef904fb;hb=HEAD
>
> > The patch seems fine to me, but what was this ever supposed to be?
> > FWICT it predates git history (looking at
> > arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)
>
> Right, I could not figure it out either, it has been there since the
> vDSO was introduced back in 2005 (I was three days away from 10!) and
> there is no comment about it so *shrug*:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=054eb7153aeb84cc92da84210cf93b0e2a34811b
>
> If someone else's archeological skills are better and can provide more
> information, I am happy to include that.
>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Thanks as always for the review! I'll include this and a note about
> where in binutils I found that information for v2.

Yeah, I think the comment from binutils sources would be good to add
to a v2 commit message. Thanks!


-- 
Thanks,
~Nick Desaulniers
