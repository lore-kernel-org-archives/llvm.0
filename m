Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C241E9F9
	for <llvm@lists.linux.dev>; Tue,  1 Nov 2022 22:36:25 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id h2so14684387pgp.4
        for <llvm@lists.linux.dev>; Tue, 01 Nov 2022 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2cwGjp62AuRZ4ErOGQPCTEHZe72CYawrStjsHhz7giw=;
        b=hAAEPFf4J5fodOBH0LmSyrz38aQxWjUdrG6jYhbXewAGk3aOLj1pNDqpa956tKah8m
         RKQOlzYTMEtKDUsYmHP6R3U/zkJs+JfgIkwgb2tkgc9NEKr1pPioAnd/uCmzRSWV970l
         Zzym2tS+iKfutBSNeGiFbIojVYjBySIgyFVQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cwGjp62AuRZ4ErOGQPCTEHZe72CYawrStjsHhz7giw=;
        b=V/Ll3lvgaECqHrU8cFTKLRBEKTcRWLUtpOWetfQCQ/VqY4Wa6OyttuPo0UgJ0QwDLY
         TIyUn9FzZ5og+6r7awf+Bfs/FAd4aCn3UMNsKmjzrH91JGItBYIZR7Mh5HD7kRd7gTdB
         Wlkf7qfwgfrAr+w3yoVpEK5lgVEAbSHeTywS+7vaKP37DnL6WB8j1BpUZwM6Hryao2XU
         IPeEvva7BVwC2f+HRg9lmPUozFnYV+jteIa8uSl0LQlYe2SxK8hiqc6qR3wv1VUBt9My
         kcXyrpiAYTjl0WAL1IBV6Rs05eMlophuCEbI2Z+3uorgwpD4xjyHz8OsxHGH4UCEyArE
         b76g==
X-Gm-Message-State: ACrzQf3CsCRtfuW9Q9yD/O8ldJpJsUVUZE/wijb5pXnee3VkxcDeRbVY
	6wgA6Jr+J6VZmJx2fx6nzOuSnQ==
X-Google-Smtp-Source: AMsMyM4kT+kkRBSFjTOn045KLLXKB9sbYcsB3D9L4w9+wzGQHQ3EJJ+9ptAxFYvDPVxf1wNTjc9Jcg==
X-Received: by 2002:a63:595:0:b0:470:8b7:255a with SMTP id 143-20020a630595000000b0047008b7255amr317560pgf.329.1667342184656;
        Tue, 01 Nov 2022 15:36:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n6-20020a654cc6000000b004608b721dfesm6344856pgt.38.2022.11.01.15.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 15:36:24 -0700 (PDT)
Date: Tue, 1 Nov 2022 15:36:23 -0700
From: Kees Cook <keescook@chromium.org>
To: bp@alien8.de, tglx@linutronix.de, mingo@kernel.org,
	peterz@infradead.org
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, dave.hansen@linux.intel.com,
	David.Laight@aculab.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
	llvm@lists.linux.dev, luto@kernel.org, mingo@redhat.com,
	torvalds@linux-foundation.org, x86@kernel.org
Subject: Re: [RESEND PATCH v5] x86, mem: move memmove to out of line assembler
Message-ID: <202211011534.C31FC5ED6@keescook>
References: <20221018172155.287409-1-ndesaulniers@google.com>
 <Y08NJohEeoYX2aIf@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y08NJohEeoYX2aIf@thelio-3990X>

On Tue, Oct 18, 2022 at 01:31:34PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 18, 2022 at 10:21:55AM -0700, Nick Desaulniers wrote:
> > When building ARCH=i386 with CONFIG_LTO_CLANG_FULL=y, it's possible
> > (depending on additional configs which I have not been able to isolate)
> > to observe a failure during register allocation:
> > 
> >   error: inline assembly requires more registers than available
> > 
> > when memmove is inlined into tcp_v4_fill_cb() or tcp_v6_fill_cb().
> > 
> > memmove is quite large and probably shouldn't be inlined due to size
> > alone. A noinline function attribute would be the simplest fix, but
> > there's a few things that stand out with the current definition:
> > 
> > In addition to having complex constraints that can't always be resolved,
> > the clobber list seems to be missing %bx. By using numbered operands
> > rather than symbolic operands, the constraints are quite obnoxious to
> > refactor.
> > 
> > Having a large function be 99% inline asm is a code smell that this
> > function should simply be written in stand-alone out-of-line assembler.
> > 
> > Moving this to out of line assembler guarantees that the
> > compiler cannot inline calls to memmove.
> > 
> > This has been done previously for 64b:
> > commit 9599ec0471de ("x86-64, mem: Convert memmove() to assembly file
> > and fix return value bug")
> > 
> > That gives the opportunity for other cleanups like fixing the
> > inconsistent use of tabs vs spaces and instruction suffixes, and the
> > label 3 appearing twice.  Symbolic operands, local labels, and
> > additional comments would provide this code with a fresh coat of paint.
> > 
> > Finally, add a test that tickles the `rep movsl` implementation to test
> > it for correctness, since it has implicit operands.
> > 
> > Suggested-by: Ingo Molnar <mingo@kernel.org>
> > Suggested-by: David Laight <David.Laight@aculab.com>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Tested-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> I ran
> 
> $ tools/testing/kunit/kunit.py run --arch i386 --cross_compile x86_64-linux- memcpy
> 
> with GCC 6 through 12 from
> https://mirrors.edge.kernel.org/pub/tools/crosstool/ (my GCC 5 container
> is based on Ubuntu Xenial, which does not have a new enough Python for
> kunit.py) and
> 
> $ tools/testing/kunit/kunit.py run --arch i386 --make_options LLVM=1 memcpy
> 
> with LLVM 11 through 16 from Debian with this change on top of Kees's
> expanding of the memcpy() KUnit tests [1] and everything passed.
> 
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Can an x86 maintainer please pick this up for -tip?

Thanks!

-Kees

-- 
Kees Cook
