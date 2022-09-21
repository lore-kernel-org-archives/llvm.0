Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DE7C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 22:01:46 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id b23so7327500pfp.9
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 15:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=YX0Re/VSeG04+hYbMeaepPBhMTJaVZBP2h8z0AeIcTc=;
        b=W+/k4ncwaDu0NSvRzm4IUQ9uxl00t3/iuWiUHN8s9xXfDfw+VAmnizj0F78oe5wvlc
         82u+AdMUimCPSFGAkO+S1U8Yh/M2LPfzlrO2ThLOAh0NbTD40yN7UKwh/OqubBvZUbLA
         VHOEn+ODRu3jb2HE0bYN2xDalpjGktHECNUzlWV0gieBJBZhhQfc4HcsxiA/06C3U+Li
         zD7kWyK6tliecZWf3fJv2XxLZdj0SFftkgLLRKRIPLLWXxWQAH37GOsGMfRj7X2JqKbi
         aqyGvK/swO/GHmo2qwHunykotJeYP1UntDS/f0ZbQXzRfQbS54vOuf/wyv/sSs2C4CDE
         80jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YX0Re/VSeG04+hYbMeaepPBhMTJaVZBP2h8z0AeIcTc=;
        b=1OMRmepPBynDmQwSBFg1xRejSMyQZTtOyr3uFETZFoW2GZYdIeAG+TTi2W5+0uz+xI
         Kx1Kf3/B6pSkgBX0oD19NR2GFskR1xblzkSOhhKJbZYkypFABGakFf8ozZu+h2MclcAE
         HYGKxTYlYvWnvj6+OYBysGifRlLIayJo/Z5TAg4o1pWhHQmuiNJRH3Ae22wfNJ7FsYhH
         rIYAuenUosAt/RWRihKTHhHSLVuShUMvd4i0RvnIwdX3SVGzcR6yZ+HOvNcLivhWnEfN
         DgZ//ZaiD4RHH6h1NDYY5X+vakOBrme6u4raSrr+SnsT8ciV5a/qtgUTeYlZ39JDZ8Ne
         XSaQ==
X-Gm-Message-State: ACrzQf1MNCbcZRpQTQnnMNRNIBGO39qAlqw3YSPWaAJ+ibWYY79HVKkD
	g+2Os6yzXgpuQFbL8pA004wHA2+916Va8M4O8xgDSA==
X-Google-Smtp-Source: AMsMyM7mZtO1pTzLDQknqUhPZPvXEJkmixjruRpJyae/zWY64DklWo7FI5aOgrMwDn7QJaQNxMGoFSuxT0CezwgPLf0=
X-Received: by 2002:a05:6a00:1743:b0:548:8629:ceab with SMTP id
 j3-20020a056a00174300b005488629ceabmr229186pfc.23.1663797706052; Wed, 21 Sep
 2022 15:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAB8jPhfj0ubtcr6XuotCVc9J+uqbZ-2QhnbUMWmge2ZGJ3xtvg@mail.gmail.com>
 <CAKwvOdmgiUNzi7Y984zVVWH+QAjPqQHK9XcNP4rBajGZibEFYA@mail.gmail.com> <CAB8jPhepdfWJg-r9i6KxxOGK=fuNKnWK39_PbuQsgr+X6nbuCg@mail.gmail.com>
In-Reply-To: <CAB8jPhepdfWJg-r9i6KxxOGK=fuNKnWK39_PbuQsgr+X6nbuCg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 21 Sep 2022 15:01:34 -0700
Message-ID: <CAKwvOd=sjj=-Lah3Lzr5ZqmEO_Nueq9qvWtddHWdSGcnVhe0Zg@mail.gmail.com>
Subject: Re: Chromium's #include analysis
To: Hans Wennborg <hwennborg@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, Arnd Bergmann <arnd@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2022 at 2:55 PM Hans Wennborg <hwennborg@google.com> wrote:
>
> On Wed, Sep 21, 2022 at 1:57 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > + external mailing lists
> > + external folks (sorry the internal intranet go/ links won't work)
>
> The pages are all public. I'll add the expanded links below.

Oh, interesting. Thanks for the updated links.

What ability do we have to "aim" this at arbitrary open source C/C++
code bases? Even if it's not precise enough (yet) for the Linux
kernel, it might be a good first order approximation.

>
> > On Wed, Sep 21, 2022 at 11:59 AM Hans Wennborg <hwennborg@google.com> w=
rote:
> > >
> > > It's probably not useful in the context of Linux, but since it came u=
p at the social the other day, I figured I'd share a few things we did with=
 includes in Chromium.
> >
> > Thanks for following up!
> >
> > >
> > > http://go/chrome-includes shows stats and allows exploring the includ=
e graph. I particularly like the "Per-Edge" analysis which shows what inclu=
de edges would be most beneficial to cut.
>
> https://commondatastorage.googleapis.com/chromium-browser-clang/include-a=
nalysis.html
>
> There's also one for llvm/clang:
> https://commondatastorage.googleapis.com/chromium-browser-clang/llvm-incl=
ude-analysis.html
>
> >
> > Interesting! Do you have a link to (public) CLs that made such cuts as
> > a result of these measurements? I'd be curious to see examples.
>
> Sure! We've got tons, most are on
> https://bugs.chromium.org/p/chromium/issues/detail?id=3D242216
>
> Here's one which referenced the include analysis explicitly:
> https://chromium-review.googlesource.com/c/chromium/src/+/2992303
>
> Here's a few that also use the max-tokens pragma:
> https://chromium-review.googlesource.com/c/chromium/src/+/2810763
> https://chromium-review.googlesource.com/c/chromium/src/+/2794474
> https://chromium-review.googlesource.com/c/chromium/src/+/2153075
>
>
> >
> > >
> > > We also track the "total compiler input size" number over time:
> > > http://go/chrome-includes-archive
>
> https://commondatastorage.googleapis.com/chromium-browser-clang/chrome_in=
cludes-index.html
>
> > > As you can see, the trend is positive, and not in a good way :-p
> > >
> > > We used this to do a lot of cleanup and keep build times in check for=
 a while, but as you mentioned backsliding is a very real problem.
> > >
> > > For a while we used https://chromium.googlesource.com/chromium/src/+/=
main/docs/wmax_tokens.md to prevent backsliding in certain files, but it go=
t too annoying in the end, especially since updating libc++ meant we had to=
 go raising the limits all the time.
> > >
> > > Again, probably not useful for Linux, but I'd be interested to hear i=
f they ever figure something out that works for them.
> >
> > Still, it's useful to get folks interested in the problem space
> > together in the same room (or mail thread).
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
