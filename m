Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478E3FC3
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 20:02:45 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id i4so6411098lfv.4
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 13:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gVlem88uR6+O3AEpNn6Yh2wjkDnIsvdG9SBuzHecDPY=;
        b=UtwnzoxIKMk4tOfMxxm4CpllD0ShmrKrKQSd8xl/r5+Nf6ZLZtS9/OyvibeXeJRjJm
         qJb8asXWsxkH8rMGhQmFiAc9zt9A20ouuq77sfZCOcwEBRY3tnwTv8gByYQCor/Quz48
         og1G2y8Pl9wxe7Gr4qj+V+3W1nEqAaqVtcdiHmee1cHKUsJcv7M1ZOYmo851M7WyJjxB
         s2cwUJHvcdnzka3/e/fwcF8RA8HvXllV2N/rj5OSMWm+RkgRLLf9Vx78zmfKw/WSWc7j
         E1acsbtB9KLKrBrScCWd2Unh4K44M/5o+4GJsvBA1ZhCB35t9GyhLHgeM4zk+YAM2EGy
         Bj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gVlem88uR6+O3AEpNn6Yh2wjkDnIsvdG9SBuzHecDPY=;
        b=s1p16gWVciaETWfg/kmjCjHh1IALaVgjyrohLHPODAUR7zObvpux0tDBI97vH/fl79
         ByENaSRKA0qH950Tb+e3Ercqwa97ieRw31IoyY+zoBKvLVyR2BlEAHrisRj7SRQIoGsT
         EEtqxkVAMrn+HO3dlB2mqZKHV1lKurdNXs1BYa56WCTe0OipfRV4BC+qXQOU+WvkoquL
         0leST3EL+DUCxY0JALiLcssWGHKk7VZHbSD1G4qgotV2UWW6UmUZngwjUyUq6ST/evQN
         xNfLx7Li1/jGDj1qR/IIHCQYYJTUbtuH18fJKUn5bdTCXeA1P35UEXZEEM+HfIN5S/aP
         4Q8w==
X-Gm-Message-State: AOAM530OQP3FqMLuaGvMeUHpCEVjY2nNn7gaba2f23eswsnBjcCfQ369
	+/VqsUMsrOyVWydi1sLamX3nzIGdZ3A5SbklFZkTaA==
X-Google-Smtp-Source: ABdhPJybQilluIHG6i+P60qv7XmPd0cdDddL5AUg5XZKqBiVfw8k7+1hrq7lipQL53Lr2BDFIjLWKWvU6iKbwY7roOA=
X-Received: by 2002:a05:6512:139c:: with SMTP id p28mr9744729lfa.523.1631563363038;
 Mon, 13 Sep 2021 13:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913131113.390368911@linuxfoundation.org> <20210913131114.028340332@linuxfoundation.org>
 <CA+G9fYtdPnwf+fi4Oyxng65pWjW9ujZ7dd2Z-EEEHyJimNHN6g@mail.gmail.com>
 <YT+RKemKfg6GFq0S@kroah.com> <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
 <CAKwvOdmCS5Q7AzUL5nziYVU7RrtRjoE9JjOXfVBWagO1Bzbsew@mail.gmail.com> <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com>
In-Reply-To: <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Sep 2021 13:02:32 -0700
Message-ID: <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
To: sedat.dilek@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Nathan Chancellor <natechancellor@gmail.com>, Baokun Li <libaokun1@huawei.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-stable <stable@vger.kernel.org>, 
	Hulk Robot <hulkci@huawei.com>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Sasha Levin <sashal@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, 
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 12:57 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, Sep 13, 2021 at 9:53 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > On Mon, Sep 13, 2021 at 11:39 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > There's an issue with my alternative approach
> > > (https://gist.github.com/nickdesaulniers/2479818f4983bbf2d688cebbab435863)
> > > with declaring the local variable z in div_64() since either operand
> > > could be 64b, which result in an unwanted truncation if the dividend
> > > is 32b (or less, and divisor is 64b). I think (what I realized this
> > > weekend) is that we might be able to replace the `if` with
> > > `__builtin_choose_expr`, then have that whole expression be the final
> > > statement and thus the "return value" of the statement expression.
> >
> > Christ...that...works? Though, did Linus just merge my patches for gcc 5.1?
> >
>
> "Merge branch 'gcc-min-version-5.1' (make gcc-5.1 the minimum version)"

Ha! I pulled+rebased and this code disappeared...I thought I had
rebased on the wrong branch or committed work to master accidentally.
Patch to stable-only inbound.
-- 
Thanks,
~Nick Desaulniers
