Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E895381
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 22:03:45 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 78so13380432pgb.13
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ERLuTlisgIR2n9tXC1fe0GP37JKycUgxAwJd1Ig7q9Q=;
        b=DxAWIhOWGcHpcmmOwlPYx3KHgn35bBdjd63eqQb/+4KWhI74WgEDeYIWrdXpGU0bj5
         hRhgnnLilYW3EAaA5y3NOPl4/XRJP9c72OiZVjNRml5lpRx3+jQcBi0aSfwOhLi9e/HX
         l8oY4DBT7jivOUW62K516ODwZI2vEfEC8kI8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ERLuTlisgIR2n9tXC1fe0GP37JKycUgxAwJd1Ig7q9Q=;
        b=7VaV2YWXXO58RJ4FemBP58nnJZKB0MIxGwmzTnzhRLT34xiEyPjc7sr7UfNHGreKDV
         8pKHB3LXrfnGHOB+xu1tLZUTLc5sYfyUS7GYts5dGbnUHMUCcmWVSKRzUGX2v2+cmyws
         G4oWh9cdwCPLOC5aK412xbaU9MSmZRLrfahnPbHOmX+K83OG3j3e1iKgqQ3YMKtfaz+o
         iUhbkHTsnl+kQ6bcLVOVjscR12VmHjlzbTQz7Van/ht7oWuWxxkcqUi981hzEGbkbe1z
         WoAYQw7ApSdc5ni/WCbJnFwxAhKW290/HATLNnxtwevs5f/Fhff8Te68p6t1JvfW3yUL
         oi6Q==
X-Gm-Message-State: ACrzQf03KoC6R2QuEadjT0KB+nUQZoJG+oDPhcr35rDuDRL2cKYsp4xU
	TZU89511SrzD5t0V65K4rGTaVA==
X-Google-Smtp-Source: AMsMyM4SBD1FlI/Uz4/bWjuAArTJ4XDxSG+Kh04joDyyUmbFtNP5JhczPQMy+VzxQT6s1FBs+mgQvw==
X-Received: by 2002:a65:5886:0:b0:439:8dd3:18d4 with SMTP id d6-20020a655886000000b004398dd318d4mr30891351pgu.430.1664402625067;
        Wed, 28 Sep 2022 15:03:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f22-20020a63f116000000b0042a713dd68csm4194606pgi.53.2022.09.28.15.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 15:03:44 -0700 (PDT)
Date: Wed, 28 Sep 2022 15:03:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v4] x86, mem: move memmove to out of line assembler
Message-ID: <202209281431.C5EF6C32A@keescook>
References: <CAKwvOdkaKTa2aiA90VzFrChNQM6O_ro+b7VWs=op70jx-DKaXA@mail.gmail.com>
 <20220928210512.642594-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928210512.642594-1-ndesaulniers@google.com>

On Wed, Sep 28, 2022 at 02:05:12PM -0700, Nick Desaulniers wrote:
> When building ARCH=i386 with CONFIG_LTO_CLANG_FULL=y, it's possible
> (depending on additional configs which I have not been able to isolate)
> to observe a failure during register allocation:
> 
>   error: inline assembly requires more registers than available
> 
> when memmove is inlined into tcp_v4_fill_cb() or tcp_v6_fill_cb().
> 
> memmove is quite large and probably shouldn't be inlined due to size
> alone. A noinline function attribute would be the simplest fix, but
> there's a few things that stand out with the current definition:
> 
> In addition to having complex constraints that can't always be resolved,
> the clobber list seems to be missing %bx and %dx, and possibly %cl. By
> using numbered operands rather than symbolic operands, the constraints
> are quite obnoxious to refactor.
> 
> Having a large function be 99% inline asm is a code smell that this
> function should simply be written in stand-alone out-of-line assembler.
> That gives the opportunity for other cleanups like fixing the
> inconsistent use of tabs vs spaces and instruction suffixes, and the
> label 3 appearing twice.  Symbolic operands and local labels would
> provide this code with a fresh coat of paint.
> 
> Moving this to out of line assembler guarantees that the
> compiler cannot inline calls to memmove.
> 
> This has been done previously for 64b:
> commit 9599ec0471de ("x86-64, mem: Convert memmove() to assembly file
> and fix return value bug")
> 
> Also, add a test that tickles the `rep movsl` implementation to test it
> for correctness, since it has implicit operands.

Yeah, thanks for poking this in particular. I was bothered that the
side-effect test caught a corner case and was planning to expand the
memcpy tests even more; thank you for doing that! I've got some more
coming and can confirm they tickled the same bug.

> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

This time I've looked at the binary differences between the functions
generated by both GCC[1] and Clang[2]. GCC is a little more difficult to
compare, since it does some register swaps, but the Clang output is same
excepting the order of push/pop, and different nops.

Reviewed-by: Kees Cook <keescook@chromium.org>

Nick's tests pass, and my newly written tests also pass; I'll send those
as a follow-up.

Tested-by: Kees Cook <keescook@chromium.org>

-Kees

[1] https://paste.debian.net/hidden/b6298e62/
[2] https://paste.debian.net/hidden/d8343143/

-- 
Kees Cook
