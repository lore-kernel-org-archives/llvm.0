Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F751FC9
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 02:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28083C43140
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 02:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666148123;
	bh=5kYqembv+YpjeHp7+ryb4q5hAFpoO+zim4SanD/yA2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lg5nneR05pA7Uyp/6yDHLQ0lv/FvSCJgKB9zgsPhYW97lwtHHW0sCoNOxth3WHcqn
	 LIffbmGZD9n3wYxVIkeFA9JGT376Q0vySQRT+iUihgiq4Sd/Rv4D6uIriY41E3TjAi
	 gNjbHLPrz7jwQLM8hVo6pF3wWrOCQKj+/foh3wo/Qu9OKdeoKMgPr5lhUNZL93Z5b3
	 8TnR1QQZ2PfHpt7GF8jKRqR7bIZdouX2tq6HjcxC+Ag0fNhkEsSACG+yebLs79DZbC
	 /ECaOjoyOL8Ej3mbchEVWDoI7hMajnEn85fSQgnnaechD2ZiopfRde+NBkdD5fcGZA
	 vXEwdW2bcH8Rg==
Received: by mail-ot1-f48.google.com with SMTP id d18-20020a05683025d200b00661c6f1b6a4so8740398otu.1
        for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 19:55:23 -0700 (PDT)
X-Gm-Message-State: ACrzQf2nu8snzBBtxIqxYY1kk2c5vTNti3BTT5ZQZXy1G3PUZ9qx80zu
	lfOxm/9R+zIiaq1PC2zeB1Pot0VX55nx0fzpzsE=
X-Google-Smtp-Source: AMsMyM5C2i3Ly90Zfv1TFQiVbzhvl/qqipUlQgQ5lvq37RcRpl/8aSWNrQoateRH2fQeJuj+TJ+GtxnpltGYrkmr3Ko=
X-Received: by 2002:a9d:60dd:0:b0:661:b6ae:aa7a with SMTP id
 b29-20020a9d60dd000000b00661b6aeaa7amr2779172otk.140.1666148122239; Tue, 18
 Oct 2022 19:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220928162007.3791-1-jszhang@kernel.org> <20220928162007.3791-5-jszhang@kernel.org>
 <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com> <YzXBZnGXQdEGR1LW@xhacker>
In-Reply-To: <YzXBZnGXQdEGR1LW@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 Oct 2022 10:55:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTonVbTAJGw3qHdfK5vKkHRX64hJB757zsiNgWq4y0Xmw@mail.gmail.com>
Message-ID: <CAJF2gTTonVbTAJGw3qHdfK5vKkHRX64hJB757zsiNgWq4y0Xmw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: entry: consolidate general regs saving into save_gp
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 12:11 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 11:59:00AM +0800, Guo Ren wrote:
> > On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > Consolidate the saving/restoring GPs(except ra, sp and tp) into
> > > save_gp/restore_gp macro.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/include/asm/asm.h   | 65 +++++++++++++++++++++++++
> > >  arch/riscv/kernel/entry.S      | 87 ++--------------------------------
> > >  arch/riscv/kernel/mcount-dyn.S | 58 +----------------------
> > >  3 files changed, 70 insertions(+), 140 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> > > index 1b471ff73178..2f3b49536e9d 100644
> > > --- a/arch/riscv/include/asm/asm.h
> > > +++ b/arch/riscv/include/asm/asm.h
> > > @@ -68,6 +68,7 @@
> > >  #endif
> > >
> > >  #ifdef __ASSEMBLY__
> > > +#include <asm/asm-offsets.h>
> > >
> > >  /* Common assembly source macros */
> > >
> > > @@ -80,6 +81,70 @@
> > >         .endr
> > >  .endm
> > >
> > > +       /* save all GPs except ra, sp and tp */
> > > +       .macro save_gp
> > How about leave x3(gp) out of the macro, and define:
> > .marco save_from_x5_to_x31
> > .marco restore_from_x5_to_x31
>
> Good idea, will do in next version.

Where is the next version?

I want to involve the patch in my generic entry series, it would help
in the coding convention of the entry code.

>
> Thanks



-- 
Best Regards
 Guo Ren
