Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295757C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 21:55:39 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id b136so10114349yba.2
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 14:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=kD1klnjJKRI6w/7Cwn8eZteSezS3++bEJBG2EMTq2f0=;
        b=UngWN/a4kU6qDRsx805kkD7v0j4OGbBLUCWpGGGeXKRL1WLNgqTqazJS4kQSd9FUBK
         52WL1POMpIcSsFUSrsHD7xl6vE50gwfyEyH9E+WCQfexYWjIFGmzsqhcAicoXoj5WO6Y
         1WpYL0kNWO2yN3A63xmXxNlbF4Ai5RayWJY38lAJ0SmK2S30aNAKucTDjC6/dukmJU/a
         pewWSiVfTskiV3OIUo/MYOtLJw5LL6ykRbKKSese3k/lcAqq+K5v9AmUIvq4UaDvZuIy
         XeGNBmQ6hgat6WSVQSPnOUW1rQuqqK4WBJ7nylssPbm9+4UOnkI29XS58hHeel9mBKPe
         x1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kD1klnjJKRI6w/7Cwn8eZteSezS3++bEJBG2EMTq2f0=;
        b=V5VsDh7i8a6XPfpSu9JquH7FbCCkWZRB4cGhBePAo22SUe6c8DzLgAXgqvOV3Z//fR
         yMWad4OldvepTB0eC+5qJbQ0SfrsF4D7qH8mF0QhVitCG6mfRz/R0oWAmOQ48TbLkDqP
         mJFoV7UMEooyWgOCQr9U7+QRXbG+hSRIj1R9gZaYvQ5EZV7zlyxDfALhWKKn7UZe0tcw
         XdaDsi6Oo0sK9TIkEJxmo7J9o6xnhYZhr4huX2zFbceyYNVADa8VoQMgwFCOlgtY3N8w
         liF6n2TPnw+UV+kn0xscRH/FVVSHNgcgOihQK02dhMOhCRCVQ10fozqdUe7PuwKsFHM8
         8zCw==
X-Gm-Message-State: ACrzQf3j/K5aFshgwJKec5nBvp6aNsjHtmMqBvcpAO1zouSJMuLSkYfh
	0OipvpDY6PB5Vf6YeGV6th6pnNhsSrx7ggRYtHdAkefR6nnqilHP
X-Google-Smtp-Source: AMsMyM6prJOm+tWy6HBkiDCTWLd1pxpxNsOpokPYZeaX/+vj+1lPcbXkZ+mP7gcfhJuvmoaYYY7Mw7mvXr53SsTevME=
X-Received: by 2002:a25:4014:0:b0:6ae:a92b:87c5 with SMTP id
 n20-20020a254014000000b006aea92b87c5mr498656yba.184.1663797337928; Wed, 21
 Sep 2022 14:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAB8jPhfj0ubtcr6XuotCVc9J+uqbZ-2QhnbUMWmge2ZGJ3xtvg@mail.gmail.com>
 <CAKwvOdmgiUNzi7Y984zVVWH+QAjPqQHK9XcNP4rBajGZibEFYA@mail.gmail.com>
In-Reply-To: <CAKwvOdmgiUNzi7Y984zVVWH+QAjPqQHK9XcNP4rBajGZibEFYA@mail.gmail.com>
From: Hans Wennborg <hwennborg@google.com>
Date: Wed, 21 Sep 2022 14:55:26 -0700
Message-ID: <CAB8jPhepdfWJg-r9i6KxxOGK=fuNKnWK39_PbuQsgr+X6nbuCg@mail.gmail.com>
Subject: Re: Chromium's #include analysis
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, Arnd Bergmann <arnd@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2022 at 1:57 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + external mailing lists
> + external folks (sorry the internal intranet go/ links won't work)

The pages are all public. I'll add the expanded links below.

> On Wed, Sep 21, 2022 at 11:59 AM Hans Wennborg <hwennborg@google.com> wro=
te:
> >
> > It's probably not useful in the context of Linux, but since it came up =
at the social the other day, I figured I'd share a few things we did with i=
ncludes in Chromium.
>
> Thanks for following up!
>
> >
> > http://go/chrome-includes shows stats and allows exploring the include =
graph. I particularly like the "Per-Edge" analysis which shows what include=
 edges would be most beneficial to cut.

https://commondatastorage.googleapis.com/chromium-browser-clang/include-ana=
lysis.html

There's also one for llvm/clang:
https://commondatastorage.googleapis.com/chromium-browser-clang/llvm-includ=
e-analysis.html

>
> Interesting! Do you have a link to (public) CLs that made such cuts as
> a result of these measurements? I'd be curious to see examples.

Sure! We've got tons, most are on
https://bugs.chromium.org/p/chromium/issues/detail?id=3D242216

Here's one which referenced the include analysis explicitly:
https://chromium-review.googlesource.com/c/chromium/src/+/2992303

Here's a few that also use the max-tokens pragma:
https://chromium-review.googlesource.com/c/chromium/src/+/2810763
https://chromium-review.googlesource.com/c/chromium/src/+/2794474
https://chromium-review.googlesource.com/c/chromium/src/+/2153075


>
> >
> > We also track the "total compiler input size" number over time:
> > http://go/chrome-includes-archive

https://commondatastorage.googleapis.com/chromium-browser-clang/chrome_incl=
udes-index.html

> > As you can see, the trend is positive, and not in a good way :-p
> >
> > We used this to do a lot of cleanup and keep build times in check for a=
 while, but as you mentioned backsliding is a very real problem.
> >
> > For a while we used https://chromium.googlesource.com/chromium/src/+/ma=
in/docs/wmax_tokens.md to prevent backsliding in certain files, but it got =
too annoying in the end, especially since updating libc++ meant we had to g=
o raising the limits all the time.
> >
> > Again, probably not useful for Linux, but I'd be interested to hear if =
they ever figure something out that works for them.
>
> Still, it's useful to get folks interested in the problem space
> together in the same room (or mail thread).
>
> --
> Thanks,
> ~Nick Desaulniers
