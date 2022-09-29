Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4565395
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 16:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6583C433D6;
	Thu, 29 Sep 2022 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664467882;
	bh=YQ2VBsdrbmdPy2lXy7ot5iuJYzQlEhfs7SsBIKRXys0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIiXGJaWxiVEK7X2NAyW+d/K6UeALMRP5UlZu5D/jYoqbAmGXNDzv/Y20YziT2HIH
	 VueM46Fqx1jwmmpB0RtTnFQXf54vSZf4HvO8hSpXJKylMbkhya2nJd3ceYoEwHrZ+b
	 HRZcZlwA6YvAr8MTVFHSDZX25Q0JHnBXN8qGKSXnsIJp70DrelwBnXwyhPesBQ47gm
	 YH7R5AFs5g8+tMucOIcfZ3NrS8Adnt1Kl6HMmkvlF0vM9daU5BzAT7jge2N8jcfL+Q
	 Bx4xR5htE9VIukaJeLeN8dRKyCt0N7YSTrqHusSOYOutV3dB1idDjYbC6Ec1wfsamg
	 UfTL446k0S+nw==
Date: Fri, 30 Sep 2022 00:01:42 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 4/4] riscv: entry: consolidate general regs saving
 into save_gp
Message-ID: <YzXBZnGXQdEGR1LW@xhacker>
References: <20220928162007.3791-1-jszhang@kernel.org>
 <20220928162007.3791-5-jszhang@kernel.org>
 <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>

On Thu, Sep 29, 2022 at 11:59:00AM +0800, Guo Ren wrote:
> On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Consolidate the saving/restoring GPs(except ra, sp and tp) into
> > save_gp/restore_gp macro.
> >
> > No functional change intended.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/include/asm/asm.h   | 65 +++++++++++++++++++++++++
> >  arch/riscv/kernel/entry.S      | 87 ++--------------------------------
> >  arch/riscv/kernel/mcount-dyn.S | 58 +----------------------
> >  3 files changed, 70 insertions(+), 140 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> > index 1b471ff73178..2f3b49536e9d 100644
> > --- a/arch/riscv/include/asm/asm.h
> > +++ b/arch/riscv/include/asm/asm.h
> > @@ -68,6 +68,7 @@
> >  #endif
> >
> >  #ifdef __ASSEMBLY__
> > +#include <asm/asm-offsets.h>
> >
> >  /* Common assembly source macros */
> >
> > @@ -80,6 +81,70 @@
> >         .endr
> >  .endm
> >
> > +       /* save all GPs except ra, sp and tp */
> > +       .macro save_gp
> How about leave x3(gp) out of the macro, and define:
> .marco save_from_x5_to_x31
> .marco restore_from_x5_to_x31

Good idea, will do in next version.

Thanks
