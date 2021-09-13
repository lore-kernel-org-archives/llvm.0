Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACCD3FC3
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 20:10:42 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id i28so19423716ljm.7
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 13:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=146IDoLHsnlYB84TPDL7kqzW39fi+lkR3958WvJksNU=;
        b=gyRS8gjhHVDEJW3sWIFVBpPRc2KEVEPHvvR30CLnqsK+D0Cdnc2iMmALs9/mMesYTx
         DWIkQLMkgDI0IL1b4WvgD65bkxCoJcXYobVOE4MVrZsCt0d4JU3u0ngT8fARn6axUyBf
         W1N+PxcICKOZsZfThMM7E97Qm8F9LSOpst2ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=146IDoLHsnlYB84TPDL7kqzW39fi+lkR3958WvJksNU=;
        b=6RKDM1Xo9U4iHG/geO2PsTA5e+AjNbGWLZfOMzVPx997L+EpKFkgK/2zWH3FgMPSv0
         Ae0H5lTpXH/3rPpPqFX+xdu+WCCaN7hJHwF40dB4VB/K8HSsYOVVOGBTGkMN7svgml+7
         jHAjdLr6JNq+ESoG1Q/1vHHN9FLT+07u458ySEeoYQgpSa3lWx7m67eqAcfUJ1v1UH/z
         NTuU7nU/fXgf4jFqgCW8ZumH+00xp/j1W2u0UBNEuqoXeFK9LygRLrVAV7BIesQWvRGI
         oE0BXl3oBplKiuIi/R6y7sJdEUJQNwMNFXLPrAd28dX4D41sql820DHber7AR8aBEb+D
         UPEw==
X-Gm-Message-State: AOAM530uCovfaTc/Vui5sHIrjbT/bcYOkdLoZq445JSWqXXCqdBftDSM
	+OQqB3qR3b5E5kYkok/DZUsrJ45weD7xlkHhwaY=
X-Google-Smtp-Source: ABdhPJwgOJrlZQixShdMYr+BRmzxFzUB5L+3bboURvP/+PrkqnaMyDjzwVAhoA4cKOJEotrh3TWHFw==
X-Received: by 2002:a05:651c:4c7:: with SMTP id e7mr12651335lji.438.1631563840112;
        Mon, 13 Sep 2021 13:10:40 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id u28sm918412lfm.162.2021.09.13.13.10.38
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 13:10:39 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id g14so19424934ljk.5
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 13:10:38 -0700 (PDT)
X-Received: by 2002:a2e:1542:: with SMTP id 2mr12239121ljv.249.1631563837811;
 Mon, 13 Sep 2021 13:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913131113.390368911@linuxfoundation.org> <20210913131114.028340332@linuxfoundation.org>
 <CA+G9fYtdPnwf+fi4Oyxng65pWjW9ujZ7dd2Z-EEEHyJimNHN6g@mail.gmail.com>
 <YT+RKemKfg6GFq0S@kroah.com> <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
 <CAKwvOdmCS5Q7AzUL5nziYVU7RrtRjoE9JjOXfVBWagO1Bzbsew@mail.gmail.com>
 <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com> <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
In-Reply-To: <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 13:10:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwREzjT7=OSi5=qqOkQsvMkCOYVhyKQ5t8Rdq4bBEzuw@mail.gmail.com>
Message-ID: <CAHk-=whwREzjT7=OSi5=qqOkQsvMkCOYVhyKQ5t8Rdq4bBEzuw@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	Baokun Li <libaokun1@huawei.com>, open list <linux-kernel@vger.kernel.org>, 
	linux-stable <stable@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 1:02 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Ha! I pulled+rebased and this code disappeared...I thought I had
> rebased on the wrong branch or committed work to master accidentally.
> Patch to stable-only inbound.

Side note: for stable, can you look into using _Generic() instead of
__builtin_choose_expression() with typeof, or some
__builtin_types_compatible_p() magic?

Yes, yes, we use __builtin_choose_expression() elsewhere, but we've
started using _Generic(), and it's really the more natural model - in
addition to being the standard C one.

Of course, there may be some reason why _Generic() doesn't work, but
it _is_ the natural fit for any "for type X, do Y" kind of thing.

No?

          Linus
