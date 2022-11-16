Received: from condef-05.nifty.com (condef-05.nifty.com [202.248.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDA633D1
	for <llvm@lists.linux.dev>; Wed, 16 Nov 2022 20:42:19 +0000 (UTC)
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-05.nifty.com with ESMTP id 2AGKcQnV029306
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 05:38:26 +0900
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49]) (authenticated)
	by conssluserg-02.nifty.com with ESMTP id 2AGKc8eN001930
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 05:38:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 2AGKc8eN001930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1668631088;
	bh=c7CHuhEkcILYlod524PGOT/hdlG/esbc7n/dEx43MCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Rl7XjlFmmOZyOTwUmKDz97vVfo1RSfJB+BDQppKrZuXnHlIGgqKvNkB4y4JtL8w9t
	 lRI/YyS9+fMTNzRoTwnLW+dPpKaw2JQn87aNhY7+/widowFmUhLrL8bnHNaGH1Eq5P
	 w8QucvurLElJWmxeWRlNFBlLRzywJbsgKKlFTftLHh3tHTCY6gCxoeLeyBXz+d136P
	 KyUorvVg31SvGrn+mPdF5wlyprs2jrGMMRKDDm7MhLlpwwevS16fEWEIr2CnKLfuYk
	 dke04EqQiLN89F8EHP3bTcGevS/AjAdLmhF00CAfTWauIoQUnlPp5XdmEfazjInV+T
	 OteBsD2RxFWkw==
X-Nifty-SrcIP: [209.85.161.49]
Received: by mail-oo1-f49.google.com with SMTP id r76-20020a4a374f000000b004988a70de2eso2679650oor.2
        for <llvm@lists.linux.dev>; Wed, 16 Nov 2022 12:38:08 -0800 (PST)
X-Gm-Message-State: ANoB5pmJdeFh7us1bYT7jPXDQcMzJNVBqSM8QqnLVoHyGXlC+zYJjaIA
	VOADF3SK74oujMFo/YcaXIRMmnnRbRN3f9MCsI0=
X-Google-Smtp-Source: AA0mqf7Jdd4+gJIc4WyDecmKpKyBiZDFqnp8KV+X1D/zE9vJzobdNIxOxLQ1R2YFgxPjqz2agdgQjup91QEIiBlMcvk=
X-Received: by 2002:a4a:dc13:0:b0:49f:87d0:ef5c with SMTP id
 p19-20020a4adc13000000b0049f87d0ef5cmr4521997oov.96.1668631087318; Wed, 16
 Nov 2022 12:38:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027162839.410720-1-masahiroy@kernel.org> <202211161056.1B9611A@keescook>
In-Reply-To: <202211161056.1B9611A@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 17 Nov 2022 05:37:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWbvpovH8qsGMX-5-31QiQ6pjKNnm+YEDEqr4io1hrSw@mail.gmail.com>
Message-ID: <CAK7LNATWbvpovH8qsGMX-5-31QiQ6pjKNnm+YEDEqr4io1hrSw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix SIGPIPE error message for AR=gcc-ar and AR=llvm-ar
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 17, 2022 at 4:01 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Oct 28, 2022 at 01:28:39AM +0900, Masahiro Yamada wrote:
> > Jiri Slaby reported that building the kernel with AR=gcc-ar shows:
> >   /usr/bin/ar terminated with signal 13 [Broken pipe]
> >
> > Nathan Chancellor reported the latest AR=llvm-ar shows
> >   error: write on a pipe with no reader
> >
> > The latter occurs since LLVM commit 51b557adc131 ("Add an error message
> > to the default SIGPIPE handler").
> >
> > The resulting vmlinux is correct, but it is better to silence it.
> >
> > 'head -n1' exits after reading the first line, so the pipe is closed.
> >
> > Use 'sed -n 1p' to eat the stream till the end.
>
> I think this is wrong because it needlessly consumes CPU time. SIGPIPE
> is _needed_ to stop a process after we found what we needed, but it's up
> to the caller (the shell here) to determine what to do about it.
>
> Similarly, that LLVM commit is wrong -- tools should _not_ catch their
> own SIGPIPEs. They should be caught by their callers.
>
> For example, see:
>
> $ seq 10000 | head -n1
> 1
>
> ^^^ no warnings from the shell (caller of "seq")
> And you can see it _is_ being killed by SIGPIPE:
>
> $ strace seq 1000 | head -n1
> ...
> write(1, "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14"..., 8192) = 8192
> 1
> write(1, "\n1861\n1862\n1863\n1864\n1865\n1866\n1"..., 4096) = -1 EPIPE (Broken pipe)
> --- SIGPIPE {si_signo=SIGPIPE, si_code=SI_USER, si_pid=3503448, si_uid=1000} ---
> +++ killed by SIGPIPE +++
>
> If we use "sed -n 1p" seq will continue to run, consuming needless time
> and CPU resources.
>
> So, I strongly think this is the wrong solution. SIGPIPE should be
> ignored for ar, and LLVM should _not_ catch its own SIGPIPE.
>
> -Kees


I thought of this - it is just wasting CPU time,
but I did not come up with a better idea on the kbuild side.

I do not want to use 2>/dev/null because it may hide
non-SIGPIPE (i.e. real) errors.


I think you guys will be keen on fixing llvm.
I hope gcc as well?



-- 
Best Regards
Masahiro Yamada
