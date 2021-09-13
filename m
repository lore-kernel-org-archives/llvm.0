Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2A83FC4
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 20:50:30 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id i28so19594649ljm.7
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 13:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TVqbn8thZCqMP/VrYd9m008Vn/d1QsljDuZZA3Cj3U=;
        b=Kx+QXs7/Gqu+0fT01IBf7AvtFuuKzukMCBr8Uj8Tlirfgy3sBlDb/0dgxW8i2fm4ki
         Cr2wjOBudyMAbTz6hMk9v40PhWKj9nMcIvmb30kyKFZB5RsdvaSnLonYQoWCJky9Fn/q
         rvmHHz1xfT6sAANA+Cql145bvCNIa1CwpBa7ThFjKt5zw9vKElWhqhFhEUwiaxOgfZ8Z
         mc6ZDYEM+0S6oMqPrZMSE/Xi4nZl2oaQoisz2wKEDinJKmadJxfu8MSthUEwUNPCWeqH
         fluefePE4KH12STgQsgozYhaHaImiPkP9T36zeeUIgpXLdwXCdryY+34zNJ9CWrttP02
         lFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TVqbn8thZCqMP/VrYd9m008Vn/d1QsljDuZZA3Cj3U=;
        b=XyAK2fcgjnN8Kr8Pi1htF2LL2XvWM+dmxbAgmviujWViax8uvzf8itRvsYLGPKEgav
         qFglcfFLWuY7YgrqdNl+6C6qYzWcionQIPj+mFYa9VnsdwOdz7ufux88ULBSRyaFmkLc
         SBEVoephQcoNkaBFw0aYrDStvjrVEse1FMrGYQhHT0PyrOH9J8cmGDN9GMoYSEYKIrEv
         JOJjBIcfpdRnsHvtnlqXUeEPHICB9ykYUPyienIURXAfGs2Gj9B9gFnIFW9Bf86jI2NR
         gQFpSl08kf3vUCXhxOKURJKWN4aZwCeHpwzbi4jaHb/VdmAizndkE0FEhVVHf5dRC9FC
         xh/w==
X-Gm-Message-State: AOAM530KRnfXS+TSDr7YOOk8ttGlqg7o646SdtXNHkA/6xu1e/1HMqya
	TVsg/I66xDGvUJQ1lwy7amTQMI34AlWBF+GR/e064Q==
X-Google-Smtp-Source: ABdhPJy0QpA58fznBHhrAEHivK9kgUxh+cUT8ejPHdCeOcbTpFXS2375qe5rVNCNeV1nKlpokjSe4FcWCpoMJsDrm+0=
X-Received: by 2002:a05:651c:54d:: with SMTP id q13mr12530242ljp.526.1631566228215;
 Mon, 13 Sep 2021 13:50:28 -0700 (PDT)
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
 <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com>
 <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
 <CAHk-=whwREzjT7=OSi5=qqOkQsvMkCOYVhyKQ5t8Rdq4bBEzuw@mail.gmail.com>
 <CAKwvOdkf3B41RRe8FDkw1H-0hBt1_PhZtZxBZ5pj0pyh7vDLmA@mail.gmail.com> <CAHk-=wjP2ijctPt2Hw3DagSZ-KgdRsO6zWTTKQNnSk0MajtJgA@mail.gmail.com>
In-Reply-To: <CAHk-=wjP2ijctPt2Hw3DagSZ-KgdRsO6zWTTKQNnSk0MajtJgA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Sep 2021 13:50:17 -0700
Message-ID: <CAKwvOd=ZG8sf1ZOkuidX_49VGkQE+BJDa19_vR4gh2FNQ2F_9Q@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Nathan Chancellor <natechancellor@gmail.com>, Baokun Li <libaokun1@huawei.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-stable <stable@vger.kernel.org>, 
	Hulk Robot <hulkci@huawei.com>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Sasha Levin <sashal@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, 
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 1:42 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Sep 13, 2021 at 1:16 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Do we have access to _Generic in GCC 4.9?
>
> We've ended up using it unconditionally since last year, so yes.

Sorry, grepping would have taken < 1s. I'm very lazy.
http://threevirtues.com/

>
> In fact, the compiler version tests got removed when we raised the gcc
> version requirement to 4.9 in commit 6ec4476ac825 ("Raise gcc version
> requirement to 4.9"):
>
>    "In particular, raising the minimum to 4.9 means that we can now just
>     assume _Generic() exists, which is likely the much better replacement
>     for a lot of very convoluted built-time magic with conditionals on
>     sizeof and/or __builtin_choose_expr() with same_type() etc"
>
> but we haven't used it much since.
>
> The "seqprop" code for picking the right lock for seqlock is perhaps
> the main example, and staring at that code will make you go blind, so
> look away.

Looking at my patch:
https://lore.kernel.org/stable/20210913203201.1844253-1-ndesaulniers@google.com/
I don't think _Generic helps us in the case of dispatching based on
the result of is_signed_type() (the operands could undergo type
promotion, so we'd need lots of cases that are more concisely covered
by is_signed_type()). It could replace the nested checks in div_64
with nested _Generics, I think. Not sure it's a huge win for
readability.  Maybe cut the number of expansions of the parameters in
half though. Let me give it a try just to see what it looks like.
-- 
Thanks,
~Nick Desaulniers
