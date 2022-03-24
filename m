Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156867E
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 23:20:00 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id g9-20020a17090ace8900b001c7cce3c0aeso1956061pju.2
        for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 16:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tyTpYV+qLd3kiCOmwuwEqZzrCGB5RjcTEwNX2Jl7UEA=;
        b=N36LSw7J4Ad6KB9y5Sj67YKYV6mXZvsH8bYHCiyCwTOj6H63DijLBlEMv450NCtV8u
         kQHcDEkhXKCmkiSkTCUpis6/nucGUmAwtRR5L5bIrcD7hu1YE/8SEGjoqBSrLHqfHSsn
         4WmIEKf0WmMgkWJviaxiy+MgajPclr9xWrNW5KYY9e1SAimz6Q0pB0h8NRm5AkJb8C5F
         VJ1ilbu9bVqZJuT7x3W33NfbRrXUB3c19FITLo0XeVxms7QGftQC76GGU+4+Co8Pwdp2
         g18Q8YZWb+NKtxiqD8wYZE0nSw/usHc4WTDa16QVgGC8BVewlqWd3hnziRHQMyrTJcei
         Ankw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tyTpYV+qLd3kiCOmwuwEqZzrCGB5RjcTEwNX2Jl7UEA=;
        b=BVRDJ/2n7f4VttZqASZtSgcqhg0okltBjSuH1Jy7nAIIlAD4kVmjO9O90dY7FrM+VX
         32BskWc7l22HFU+RCAXZzjQx9ReiRZLDkGAcWQAgKWG3n1h2id9J6lxYvddxvE/kjcWX
         psv2fGCXqdITNKg2RKdemgwMa9AMPZBqg9bknRoKQkvyf1lNlx6ZdqVIJ4WjWUBTbCcm
         1p4bBaXrXQLweg+rLr44SbPDOmAg4marckDhcsuk3eKPiak4s+Q8yPOoREAy6bA0uuXy
         owow2s98lc18HpL7IkiC06pTRqkmR3Q9ijC6bDRA2sjmYeKa/1DwKC5alJ/ws+REg0oW
         ot3w==
X-Gm-Message-State: AOAM531KYIGK3GEatIPbf8HUxTWg+ynhU4MP+2vMC4wx/3NZ0aO4joMJ
	gyKQM0IU5Qz/kh43QtuUpvrJfQ==
X-Google-Smtp-Source: ABdhPJwAgOGkPpuK+V2kEzPXMze0c/NG28V5NRgS2aL1z5C83rlqPXntNdJyV8xjYqDrNbN2xQO9uw==
X-Received: by 2002:a17:90a:c595:b0:1c7:bb62:4487 with SMTP id l21-20020a17090ac59500b001c7bb624487mr6473841pjt.190.1648164000136;
        Thu, 24 Mar 2022 16:20:00 -0700 (PDT)
Received: from google.com ([2620:15c:211:202:7198:79bb:dcac:4972])
        by smtp.gmail.com with ESMTPSA id t7-20020a056a0021c700b004f737480bb8sm4446746pfj.4.2022.03.24.16.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 16:19:58 -0700 (PDT)
Date: Thu, 24 Mar 2022 16:19:49 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Sylvestre Ledru <sylvestre@mozilla.com>
Subject: Re: [GIT PULL] locking changes for v5.18
Message-ID: <Yjz8lQtnWimVeTp7@google.com>
References: <YjhdcJB4FaLfsoyO@gmail.com>
 <CAHk-=wjS6ptr5=JqmmyEb_qTjDz_68+S=h1o1bL1fEyArVOymA@mail.gmail.com>
 <CAHk-=whNBs07foho7=QxVbs_hnpDfPP3s2fwyXK-reNw67mU=g@mail.gmail.com>
 <YjwueBQoung7rFD+@gmail.com>
 <YjxFzlzfTF5Av3Zc@zn.tnic>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjxFzlzfTF5Av3Zc@zn.tnic>

On Thu, Mar 24, 2022 at 11:19:58AM +0100, Borislav Petkov wrote:
> On Thu, Mar 24, 2022 at 09:40:24AM +0100, Ingo Molnar wrote:
> > Only intermittently on my side - it only recently started working
> > reliably & it doubles the not inconsiderable test time :-/
> 
> True dat - last time I measured, clang builds take roughly double the
> time gcc builds with the same config do.

See also:
https://lore.kernel.org/lkml/CAHk-=whs8QZf3YnifdLv57+FhBi5_WeNTG1B-suOES=RcUSmQg@mail.gmail.com/

We do have to pay a penalty in that if these binaries can be built as
shared objects, the MUST be. (Actually, IDK if Debian has the same
policy as Fedora).

If you see libLLVM-*.so (and libclang-cpp.so) in your list of
`ldd $(which clang)`, or see multiple symbols from the dynamic linker
after running:

$ perf record -e cycles:pp --call-graph lbr make LLVM=1
$ perf report --no-children --sort=dso,cycles

Then dynamic linking is the main source of performance difference
between GCC and Clang on those distributions. So we're kind of fighting
with one hand behind our backs.

For Linux distros that have server costs, my guess is these policies
allow them to minimize their costs of serving prebuilt binaries, since
dynamic linking does allow for smaller binaries.

For short lived processes like most of the toolchain (and parts that
generally don't overlap, such as the serialization between compilation
THEN linkages), dynamic linking provides a ridiculous startup cost. CoW
gets us most of the benefits of dynamic linking in terms of shared
memory between processes. (I don't think ASLR hurts CoW in that way?)

On the flip side, I have been banging pots and pans around internally
trying to raise awareness of the issue (I'm but a peasant though, Mr.
bottom rung of the ladder); we do have budget finally allocated to focus
on compiler performance. Getting the checks written involves more red
tape and more effort than I expected.

I might start ignoring compiler bugs for a while, go off into the
wilderness, and not come back until I have statically linked images of
clang available to host on kernel.org though. There's a lot we could be
doing to hot rod the compiler to optimize for developer's (and CI's)
time.
