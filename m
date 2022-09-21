Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7407C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 22:29:04 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3487d84e477so80198487b3.6
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 15:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=3k/0yunZZ9RUotmumVHqdU+M142aiCHItMCSD6sUpO4=;
        b=WVuRydB7jLPErQ57bo0lxvtI4KgfQjYE2gOBW2sNcHraTECE+ug6Yhmz6lU3GX85Mv
         oYrryInjuVedoSAof5bUN/qVYVs1KYXDP7n9S4snzm1mp1rmh3ZTVwJtUJSOLhnxrHjm
         nRfpMiCGMH6IZN2UC4zKQmks9yRTbOa4zcHWYBMacgFnxpBnODUTo4nEjun8jJrNf78Z
         E+rR62l/cGTUYUHZzEvTXJjwDFl6SaO8sQz9zHIS0FMa8RMOnH4KebaVZ+ySNcrq2qrR
         Zh++3VI5IWoxZ3DvT/yoh3kwob+ztdvimkNTNS9IbI/S4b2P8I8AmvNscDYX/EnDcqXV
         E7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3k/0yunZZ9RUotmumVHqdU+M142aiCHItMCSD6sUpO4=;
        b=UrVC8osCyDgtXp8FQxEoq6Cu2B+m5cpJkfGcdK+6dQzq2+8hNiz7lOU8a6EHZTkAvy
         3eEVJjCQcqQ4GHIVUgUWBvpfVYpyT+Ggt+Azu5t+2tv4dfgbJ9eT6lt3cwo0znoHPek3
         jTxtdu+OgmMry2kq11qqX71LYX017F867aggWajF7+xqk7S0N9IGEplfhBRV12ECpMru
         IOc4ZjfabBcLoEa8ljevaxYyyUnZ4ggShUzdM7jt4Q0Ygv738bVle1DgxtPyDLd/gW1h
         S0Pq4SQ/w+rY0vx9uCgovPpQCzRCxyI4SqLQR59H+u/94HdufPsXQqjtC9yM58eSFt5b
         9fiA==
X-Gm-Message-State: ACrzQf16Y1mHYo20HsmURU0nPNOQsPOlmtx2iNKnxILAXerO8xj+uQ9N
	1CkA0zKPq2wzBP1+4Pn6beHeA4GHM1GhypYcA1AiBKXGRQg+/J6X
X-Google-Smtp-Source: AMsMyM6TgV8G/9g7jf+/0C2GpQqV42CKrAMUXL49sUililw5FC8ejWNtDE2CvIjttjJCxIZlYrpQjoItnCAdlQWQo4s=
X-Received: by 2002:a81:7182:0:b0:349:de4c:7a00 with SMTP id
 m124-20020a817182000000b00349de4c7a00mr432463ywc.385.1663799343626; Wed, 21
 Sep 2022 15:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAB8jPhfj0ubtcr6XuotCVc9J+uqbZ-2QhnbUMWmge2ZGJ3xtvg@mail.gmail.com>
 <CAKwvOdmgiUNzi7Y984zVVWH+QAjPqQHK9XcNP4rBajGZibEFYA@mail.gmail.com>
 <CAB8jPhepdfWJg-r9i6KxxOGK=fuNKnWK39_PbuQsgr+X6nbuCg@mail.gmail.com> <CAKwvOd=sjj=-Lah3Lzr5ZqmEO_Nueq9qvWtddHWdSGcnVhe0Zg@mail.gmail.com>
In-Reply-To: <CAKwvOd=sjj=-Lah3Lzr5ZqmEO_Nueq9qvWtddHWdSGcnVhe0Zg@mail.gmail.com>
From: Hans Wennborg <hwennborg@google.com>
Date: Wed, 21 Sep 2022 15:28:51 -0700
Message-ID: <CAB8jPhcm8n3MaHw56utpV9v7T8qm5_DVgdQY+3LxGGROYXUseA@mail.gmail.com>
Subject: Re: Chromium's #include analysis
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, Arnd Bergmann <arnd@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2022 at 3:01 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 21, 2022 at 2:55 PM Hans Wennborg <hwennborg@google.com> wrot=
e:
> >
> > On Wed, Sep 21, 2022 at 1:57 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > + external mailing lists
> > > + external folks (sorry the internal intranet go/ links won't work)
> >
> > The pages are all public. I'll add the expanded links below.
>
> Oh, interesting. Thanks for the updated links.
>
> What ability do we have to "aim" this at arbitrary open source C/C++
> code bases? Even if it's not precise enough (yet) for the Linux
> kernel, it might be a good first order approximation.

Using this for different projects would be a matter of tweaking the
analysis script:
https://source.chromium.org/chromium/chromium/src/+/main:tools/clang/script=
s/analyze_includes.py
and/or that projects build config.

It relies on the files being built with clang's -H and
-fshow-skipped-includes options to capture the full include graph. It
then scrapes the output from building with 'ninja', but it would
probably not be hard to adapt to the output of another build system.

>
> >
> > > On Wed, Sep 21, 2022 at 11:59 AM Hans Wennborg <hwennborg@google.com>=
 wrote:
> > > >
> > > > It's probably not useful in the context of Linux, but since it came=
 up at the social the other day, I figured I'd share a few things we did wi=
th includes in Chromium.
> > >
> > > Thanks for following up!
> > >
> > > >
> > > > http://go/chrome-includes shows stats and allows exploring the incl=
ude graph. I particularly like the "Per-Edge" analysis which shows what inc=
lude edges would be most beneficial to cut.
> >
> > https://commondatastorage.googleapis.com/chromium-browser-clang/include=
-analysis.html
> >
> > There's also one for llvm/clang:
> > https://commondatastorage.googleapis.com/chromium-browser-clang/llvm-in=
clude-analysis.html
> >
> > >
> > > Interesting! Do you have a link to (public) CLs that made such cuts a=
s
> > > a result of these measurements? I'd be curious to see examples.
> >
> > Sure! We've got tons, most are on
> > https://bugs.chromium.org/p/chromium/issues/detail?id=3D242216
> >
> > Here's one which referenced the include analysis explicitly:
> > https://chromium-review.googlesource.com/c/chromium/src/+/2992303
> >
> > Here's a few that also use the max-tokens pragma:
> > https://chromium-review.googlesource.com/c/chromium/src/+/2810763
> > https://chromium-review.googlesource.com/c/chromium/src/+/2794474
> > https://chromium-review.googlesource.com/c/chromium/src/+/2153075
> >
> >
> > >
> > > >
> > > > We also track the "total compiler input size" number over time:
> > > > http://go/chrome-includes-archive
> >
> > https://commondatastorage.googleapis.com/chromium-browser-clang/chrome_=
includes-index.html
> >
> > > > As you can see, the trend is positive, and not in a good way :-p
> > > >
> > > > We used this to do a lot of cleanup and keep build times in check f=
or a while, but as you mentioned backsliding is a very real problem.
> > > >
> > > > For a while we used https://chromium.googlesource.com/chromium/src/=
+/main/docs/wmax_tokens.md to prevent backsliding in certain files, but it =
got too annoying in the end, especially since updating libc++ meant we had =
to go raising the limits all the time.
> > > >
> > > > Again, probably not useful for Linux, but I'd be interested to hear=
 if they ever figure something out that works for them.
> > >
> > > Still, it's useful to get folks interested in the problem space
> > > together in the same room (or mail thread).
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
