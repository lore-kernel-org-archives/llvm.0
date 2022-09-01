Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2556FA23
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 10:30:23 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id t184so7969653yba.4
        for <llvm@lists.linux.dev>; Thu, 01 Sep 2022 03:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=o0dNB2dEotiHbBAgc7JJeptZGUlaTEB/UzQJO7GfLf0=;
        b=JX/IaSTC8uQAliouG7MU1MrOlOkLl+hDL6ZL6vvB5LhujwlyvTCEUX2jqJILMBrbrd
         3xs0/JLmO+2v14meuA5G0UjjV866TbDZQviiiAqPgJd74SNiujTaWxHp9iNoJWGsg25R
         d/hGQvr2XCpFOT/nMer+ap3vn6liDAXmaOe7EnGfO2qY1emtAVgq7f4CzgPpMBPYoAAG
         CDyxhLOoXKLVztSx2fh7KeUNDh2a9Am25iZ/Yktl32G3wdqxWfoh7THI/r5njKInjlJH
         untB4OnLeNLAnf/nB5O9pnOworPkvjYf3hAujc8oQMMXrmRPD44Nxqv6xcXfdbURanEc
         P8Mg==
X-Gm-Message-State: ACgBeo0jxD3DGIXea/UkYENcKQlKU7vGTnzg9AuYNGPie5KOdTkHe7Tt
	JcjHWrmUcIX4CRBj/1o54Lbrt374Al8njsV2e+A=
X-Google-Smtp-Source: AA6agR4eU/leGtZXqINtxP77iUKDVvRtNJm8A9wHt1oClNaG3THlQmhcG79vWTs7fJxTbIYhOgNqLGK9Xo6zlfsq7M8=
X-Received: by 2002:a25:34d8:0:b0:6a2:2cc3:3b2d with SMTP id
 b207-20020a2534d8000000b006a22cc33b2dmr431315yba.142.1662028221974; Thu, 01
 Sep 2022 03:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220831075742.295-1-mailhol.vincent@wanadoo.fr> <Yw8hJS9f6SofG4/6@yury-laptop>
 <YxArx4UGoSQXljQd@yury-laptop>
In-Reply-To: <YxArx4UGoSQXljQd@yury-laptop>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Thu, 1 Sep 2022 19:30:10 +0900
Message-ID: <CAMZ6Rq+XVWGEEHr9t5dkXN0E36hkpMb5kNEZJmMFgtJxyQntsg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Yury Norov <yury.norov@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue. 1 sept. 2022 at 12:49, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Aug 31, 2022 at 01:54:01AM -0700, Yury Norov wrote:
> > On Wed, Aug 31, 2022 at 04:57:40PM +0900, Vincent Mailhol wrote:
> > > The compilers provide some builtin expression equivalent to the ffs(),
> > > __ffs() and ffz() functions of the kernel. The kernel uses optimized
> > > assembly which produces better code than the builtin
> > > functions. However, such assembly code can not be folded when used
> > > with constant expressions.
> > >
> > > This series relies on __builtin_constant_p to select the optimal solution:
> > >
> > >   * use kernel assembly for non constant expressions
> > >
> > >   * use compiler's __builtin function for constant expressions.
> > >
> > >
> > > ** Statistics **
> > >
> > > Patch 1/2 optimizes 26.7% of ffs() calls and patch 2/2 optimizes 27.9%
> > > of __ffs() and ffz() calls (details of the calculation in each patch).
> >
> > Hi Vincent,
> >
> > Can you please add a test for this? We've recently added a very similar
> > test_bitmap_const_eval() in lib/test_bitmap.c.
> >
> > dc34d5036692c ("lib: test_bitmap: add compile-time optimization/evaluations
> > assertions")
> >
> > Would be nice to have something like this for ffs() and ffz() in
> > lib/test_bitops.c.
> >
> > Please keep me in loop in case of new versions.

Hi Yury,

My patch only takes care of the x86 architecture. Assuming some other
architectures are not optimized yet, adding such a test might break
some builds. I am fine with adding the test, however, I will not write
patches for the other architecture because I do not have the
environment to compile and test it.

Does it still make sense to add the test before fixing all the architectures?

> Also, what about fls? Is there any difference with ffs/ffz wrt compile
> time optimizations? If not, would be great if the series will take
> care of it too.

Agree. The fls() and fls64() can use __builtin_ctz() and
__builtin_ctzll(). However, those two functions are a bit less
trivial. I wanted to have this first series approved first before
working on *fls*().


Yours sincerely,
Vincent Mailhol
