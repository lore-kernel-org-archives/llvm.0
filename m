Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB8C6AD6
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 17:07:01 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c7so16546784wrp.11
        for <llvm@lists.linux.dev>; Thu, 01 Sep 2022 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fA4MAzocVYnZA2PNv0a79ePFGBimCCBV9TwhybPc+1g=;
        b=gaNyFVJIAWi6NladXb1I0D9sKA1wYJuqwzT3vMPSeWijxpfGD7ju8E/Y3qpCZH+5z5
         I5clrbyXneyIbY7yxT2NhXaPYKkI8zIbnuijIbHVkg1GygW6FAX3jkEs46hrEWyloeD6
         NH+rPwNIi+1P/9amACHfAZSkG+wBIYJpRqYb9fJbKc75Jk/B0VuiZgRH08uClKGcmEDK
         yiN/O23Z1sZqKpASU54QXDdZx8fOkg1GrSYPxx29wANWc/x1uDFbSOc/aaxSQ4fUb53m
         uB/IGAAF3ZJVI0EUsjQJV71kT+kkLX9QRBd1LlSPY44Ry6Ege4IDk4UMvIQeu5Vl9wPl
         LiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fA4MAzocVYnZA2PNv0a79ePFGBimCCBV9TwhybPc+1g=;
        b=txJyW2kBRKbefMoXy/gs9iKkdOWDTEHGjGMRZ/5vRuEFBD3cWAVf5fcCv/YFC63QSm
         Iab2LeCmAcO+IaUkxbzugPy4nN5XE3bVcI9MsyowEvruGlP4du+6L54H2g8QsKl5vvV6
         Xyghzhb8tbv7bS6g3GTYM7YfhrHSPp7xL3GX2mRr6dA3w1eR0bMRUtD1Ha8ekBsP7kas
         g2jTkrlYFTwN3XcZowTAJfqBsQwuocEhW4f4bOfaTN/abhpK9vPKnrD1gsFIfXHT6mmy
         mT9UW4oUdk7OSA/Xe7f6TqlzJXaa8JExzLnZ6qwmwXNsPdNX9kZNlnBZlPMSt9q/3R3X
         Dqgg==
X-Gm-Message-State: ACgBeo3Ekvg3BUuHaZ+lp45RHn6qBOxIJxIfigHiv9cFJ67oKKbV9Fjq
	KewHPk0BDPGKBXnmiboXYgkYmerg/r6i1iFFQ8Q0Fg==
X-Google-Smtp-Source: AA6agR73Y35/orZRP6OW0fmTCoK9dzubdjVPKax1N9hX81ihv1EYXPfbC2vCtqRIuINb3pbTgiJ55+g4kDpcHcCpQb0=
X-Received: by 2002:a5d:47ac:0:b0:226:df12:412f with SMTP id
 12-20020a5d47ac000000b00226df12412fmr10609969wrb.675.1662052020147; Thu, 01
 Sep 2022 10:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220831075742.295-1-mailhol.vincent@wanadoo.fr> <Yw8hJS9f6SofG4/6@yury-laptop>
 <YxArx4UGoSQXljQd@yury-laptop> <CAMZ6Rq+XVWGEEHr9t5dkXN0E36hkpMb5kNEZJmMFgtJxyQntsg@mail.gmail.com>
 <YxC+eShQLDor0B9D@yury-laptop>
In-Reply-To: <YxC+eShQLDor0B9D@yury-laptop>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 1 Sep 2022 10:06:48 -0700
Message-ID: <CAKwvOd=xWEc9T=RQcZDuHNMtng+pODa2SXs9iOmPWdJ5coPBaA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
To: Yury Norov <yury.norov@gmail.com>
Cc: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 7:19 AM Yury Norov <yury.norov@gmail.com> wrote:
>
> On Thu, Sep 01, 2022 at 07:30:10PM +0900, Vincent MAILHOL wrote:
> > On Tue. 1 sept. 2022 at 12:49, Yury Norov <yury.norov@gmail.com> wrote:
> > > On Wed, Aug 31, 2022 at 01:54:01AM -0700, Yury Norov wrote:
> > > > On Wed, Aug 31, 2022 at 04:57:40PM +0900, Vincent Mailhol wrote:
> > > > > The compilers provide some builtin expression equivalent to the ffs(),
> > > > > __ffs() and ffz() functions of the kernel. The kernel uses optimized
> > > > > assembly which produces better code than the builtin
> > > > > functions. However, such assembly code can not be folded when used
> > > > > with constant expressions.
> > > > >
> > > > > This series relies on __builtin_constant_p to select the optimal solution:
> > > > >
> > > > >   * use kernel assembly for non constant expressions
> > > > >
> > > > >   * use compiler's __builtin function for constant expressions.
> > > > >
> > > > >
> > > > > ** Statistics **
> > > > >
> > > > > Patch 1/2 optimizes 26.7% of ffs() calls and patch 2/2 optimizes 27.9%
> > > > > of __ffs() and ffz() calls (details of the calculation in each patch).
> > > >
> > > > Hi Vincent,
> > > >
> > > > Can you please add a test for this? We've recently added a very similar
> > > > test_bitmap_const_eval() in lib/test_bitmap.c.
> > > >
> > > > dc34d5036692c ("lib: test_bitmap: add compile-time optimization/evaluations
> > > > assertions")
> > > >
> > > > Would be nice to have something like this for ffs() and ffz() in
> > > > lib/test_bitops.c.
> > > >
> > > > Please keep me in loop in case of new versions.
> >
> > Hi Yury,
> >
> > My patch only takes care of the x86 architecture.
>
> OK, I just realized that you started submitting this at least back in May.
>
> For me, v6 is good enough and well-described. So, for the series:
> Reviewed-by: Yury Norov <yury.norov@gmail.com>
>
> How are you going to merge it? If you haven't a specific tree in mind
> already, I can take it in my bitmap tree because  ffs and ffz are closely
> related to find_bit() functions.

Unless Boris feels strong enough to nack the series, I think Yury
accepting the series is the way to go.
-- 
Thanks,
~Nick Desaulniers
